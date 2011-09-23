From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2011 06:22:40 +0000
Subject: [patch] Input: potential info leak in uiput_ff_upload_to_user()
Message-Id: <20110923062240.GG4387@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@euromail.se>, Ping Cheng <pingc@wacom.com>, Peter Hutterer <peter.hutterer@who-t.net>, Aristeu Rozanski <aris@ruivo.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch has a new check for Rosenberg type information leaks where
structs are copied to the user with uninitialized stack data in them.

The issue here is that struct uinput_ff_upload_compat has a hole in
it.

struct uinput_ff_upload_compat {
        int                        request_id;           /*     0     4 */
        int                        retval;               /*     4     4 */
        struct ff_effect_compat    effect;               /*     8     0 */

        /* XXX 44 bytes hole, try to pack */

        struct ff_effect_compat    old;                  /*    52     0 */

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 7360568..40e2ba4 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -528,6 +528,8 @@ static int uinput_ff_upload_to_user(char __user *buffer,
 	if (INPUT_COMPAT_TEST) {
 		struct uinput_ff_upload_compat ff_up_compat;
 
+		memset(&ff_up_compat, 0, sizeof(ff_up_compat));
+
 		ff_up_compat.request_id = ff_up->request_id;
 		ff_up_compat.retval = ff_up->retval;
 		/*
