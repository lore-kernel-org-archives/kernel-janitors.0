From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 13:35:20 +0000
Subject: [PATCH 4/4] [media] cpia2: Delete an unnecessary return statement in process_frame()
Message-Id: <af26d762-74a2-e827-59cc-eae1b9d1aeee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c2ff478e-94d7-6c92-f467-69f5b66b8a1e@users.sourceforge.net>
In-Reply-To: <c2ff478e-94d7-6c92-f467-69f5b66b8a1e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Shyam Saini <mayhs11saini@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 13:32:45 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/cpia2/cpia2_usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/cpia2/cpia2_usb.c b/drivers/media/usb/cpia2/cpia2_usb.c
index d1750fa48aa8..f224992590b8 100644
--- a/drivers/media/usb/cpia2/cpia2_usb.c
+++ b/drivers/media/usb/cpia2/cpia2_usb.c
@@ -154,6 +154,5 @@ static void process_frame(struct camera_data *cam)
 	}
 
 	cam->workbuff->status = FRAME_ERROR;
-	return;
 }
 
-- 
2.14.1

