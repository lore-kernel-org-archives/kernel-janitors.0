From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 21 Sep 2013 22:27:38 +0000
Subject: [PATCH 06/19] media: Change variable type to bool
Message-Id: <1379802471-30252-6-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: m.chehab@samsung.com
Cc: sakari.ailus@iki.fi, hans.verkuil@cisco.com, peter.senna@gmail.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The variable frame_ready is only assigned the values true and false.
Change its type to bool.

The simplified semantic patch that find this problem is as
follows (http://coccinelle.lip6.fr/):

@exists@
type T;
identifier b;
@@
- T
+ bool
  b = ...;
  ... when any
  b = \(true\|false\)

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---

This fails at checkpatch due initializing static variable to false.
I haven't changed the assignment.

 drivers/media/usb/cpia2/cpia2_usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cpia2/cpia2_usb.c b/drivers/media/usb/cpia2/cpia2_usb.c
index be17192..351a78a 100644
--- a/drivers/media/usb/cpia2/cpia2_usb.c
+++ b/drivers/media/usb/cpia2/cpia2_usb.c
@@ -209,7 +209,7 @@ static void cpia2_usb_complete(struct urb *urb)
 {
 	int i;
 	unsigned char *cdata;
-	static int frame_ready = false;
+	static bool frame_ready = false;
 	struct camera_data *cam = (struct camera_data *) urb->context;
 
 	if (urb->status!=0) {
-- 
1.8.3.1

