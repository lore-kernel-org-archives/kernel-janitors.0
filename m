From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2011 06:22:07 +0000
Subject: [patch] Input: potential info leak in input_event_to_user()
Message-Id: <20110923062207.GF4387@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch has a new check for Rosenberg type information leaks where
structs are copied to the user with uninitialized stack data in them.

The issue here is that struct input_event_compat has a hole in it.

struct input_event_compat {
        struct compat_timeval {
        } time;                             /*     0     0 */

        /* XXX 8 bytes hole, try to pack */

        short unsigned int         type;    /*     8     2 */


Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/input-compat.c b/drivers/input/input-compat.c
index e46a867..007850a 100644
--- a/drivers/input/input-compat.c
+++ b/drivers/input/input-compat.c
@@ -44,6 +44,8 @@ int input_event_to_user(char __user *buffer,
 	if (INPUT_COMPAT_TEST) {
 		struct input_event_compat compat_event;
 
+		memset(&compat_event, 0, sizeof(compat_event));
+
 		compat_event.time.tv_sec = event->time.tv_sec;
 		compat_event.time.tv_usec = event->time.tv_usec;
 		compat_event.type = event->type;
