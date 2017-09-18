From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 17:39:40 +0000
Subject: [PATCH] [media] jl2005bcd: Delete an error message for a failed memory allocation in jl2005c_dostrea
Message-Id: <7b118f3d-99e0-1936-16d4-09151a5da006@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Sep 2017 19:24:24 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/gspca/jl2005bcd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/gspca/jl2005bcd.c b/drivers/media/usb/gspca/jl2005bcd.c
index 17c7a953564c..23400ead1919 100644
--- a/drivers/media/usb/gspca/jl2005bcd.c
+++ b/drivers/media/usb/gspca/jl2005bcd.c
@@ -320,10 +320,8 @@ static void jl2005c_dostream(struct work_struct *work)
 	u8 *buffer;
 
 	buffer = kmalloc(JL2005C_MAX_TRANSFER, GFP_KERNEL | GFP_DMA);
-	if (!buffer) {
-		pr_err("Couldn't allocate USB buffer\n");
+	if (!buffer)
 		goto quit_stream;
-	}
 
 	while (gspca_dev->present && gspca_dev->streaming) {
 #ifdef CONFIG_PM
-- 
2.14.1

