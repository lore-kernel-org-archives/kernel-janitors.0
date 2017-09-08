From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Sep 2017 12:32:29 +0000
Subject: [PATCH 2/3] [media] DaVinci-VPBE-Display: Improve a size determination in two functions
Message-Id: <d4fc91b4-4850-b756-d297-fcebdc8d7131@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e980c48c-9525-4942-a58e-20af8a96e531@users.sourceforge.net>
In-Reply-To: <e980c48c-9525-4942-a58e-20af8a96e531@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 8 Sep 2017 10:50:32 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpbe_display.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
index 5b6fc550736b..afe31900f5de 100644
--- a/drivers/media/platform/davinci/vpbe_display.c
+++ b/drivers/media/platform/davinci/vpbe_display.c
@@ -1305,9 +1305,5 @@ static int init_vpbe_layer(int i, struct vpbe_display *disp_dev,
 	struct video_device *vbd = NULL;
 
 	/* Allocate memory for four plane display objects */
-
-	disp_dev->dev[i] -		kzalloc(sizeof(struct vpbe_layer), GFP_KERNEL);
-
-	/* If memory allocation fails, return error */
+	disp_dev->dev[i] = kzalloc(sizeof(*disp_dev->dev[i]), GFP_KERNEL);
 	if (!disp_dev->dev[i])
@@ -1396,6 +1392,5 @@ static int vpbe_display_probe(struct platform_device *pdev)
 
 	printk(KERN_DEBUG "vpbe_display_probe\n");
 	/* Allocate memory for vpbe_display */
-	disp_dev = devm_kzalloc(&pdev->dev, sizeof(struct vpbe_display),
-				GFP_KERNEL);
+	disp_dev = devm_kzalloc(&pdev->dev, sizeof(*disp_dev), GFP_KERNEL);
 	if (!disp_dev)
-- 
2.14.1

