From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 19:34:56 +0000
Subject: [PATCH] [media] sq905: Delete an error message for a failed memory allocation in sq905_dostream()
Message-Id: <a0e659c0-38b8-cbb1-7207-85440273fc66@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 21:30:58 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/gspca/sq905.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/gspca/sq905.c b/drivers/media/usb/gspca/sq905.c
index f1da34a10ce8..ca8cdd753a2b 100644
--- a/drivers/media/usb/gspca/sq905.c
+++ b/drivers/media/usb/gspca/sq905.c
@@ -218,10 +218,8 @@ static void sq905_dostream(struct work_struct *work)
 	u8 *buffer;
 
 	buffer = kmalloc(SQ905_MAX_TRANSFER, GFP_KERNEL | GFP_DMA);
-	if (!buffer) {
-		pr_err("Couldn't allocate USB buffer\n");
+	if (!buffer)
 		goto quit_stream;
-	}
 
 	frame_sz = gspca_dev->cam.cam_mode[gspca_dev->curr_mode].sizeimage
 			+ FRAME_HEADER_LEN;
-- 
2.14.1

