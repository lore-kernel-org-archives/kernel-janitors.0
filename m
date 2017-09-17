From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 13:34:22 +0000
Subject: [PATCH 3/4] [media] cpia2: Delete unnecessary null pointer checks in free_sbufs()
Message-Id: <d15c13d7-3b4c-e343-699b-c7dcb51244ef@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c2ff478e-94d7-6c92-f467-69f5b66b8a1e@users.sourceforge.net>
In-Reply-To: <c2ff478e-94d7-6c92-f467-69f5b66b8a1e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Shyam Saini <mayhs11saini@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 13:23:47 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: kfree(NULL) is safe and this check is probably not required

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/cpia2/cpia2_usb.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/cpia2/cpia2_usb.c b/drivers/media/usb/cpia2/cpia2_usb.c
index 161c9b827f8e..d1750fa48aa8 100644
--- a/drivers/media/usb/cpia2/cpia2_usb.c
+++ b/drivers/media/usb/cpia2/cpia2_usb.c
@@ -519,15 +519,11 @@ static void free_sbufs(struct camera_data *cam)
 	int i;
 
 	for (i = 0; i < NUM_SBUF; i++) {
-		if(cam->sbuf[i].urb) {
-			usb_kill_urb(cam->sbuf[i].urb);
-			usb_free_urb(cam->sbuf[i].urb);
-			cam->sbuf[i].urb = NULL;
-		}
-		if(cam->sbuf[i].data) {
-			kfree(cam->sbuf[i].data);
-			cam->sbuf[i].data = NULL;
-		}
+		usb_kill_urb(cam->sbuf[i].urb);
+		usb_free_urb(cam->sbuf[i].urb);
+		cam->sbuf[i].urb = NULL;
+		kfree(cam->sbuf[i].data);
+		cam->sbuf[i].data = NULL;
 	}
 }
 
-- 
2.14.1

