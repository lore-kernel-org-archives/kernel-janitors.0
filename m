From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 04 Sep 2017 20:10:01 +0000
Subject: [PATCH 4/6] [media] atmel-isi: Delete an error message for a failed memory allocation in two functio
Message-Id: <7eb22d47-956e-5712-33a5-d50aaf8684ec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88d0739c-fdc1-9d7d-fe53-b7c2eeed1849@users.sourceforge.net>
In-Reply-To: <88d0739c-fdc1-9d7d-fe53-b7c2eeed1849@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Songjun Wu <songjun.wu@microchip.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 4 Sep 2017 21:21:25 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/atmel/atmel-isi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 891fa2505efa..154e9c39b64f 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1041,7 +1041,5 @@ static int isi_formats_init(struct atmel_isi *isi)
-	if (!isi->user_formats) {
-		dev_err(isi->dev, "could not allocate memory\n");
+	if (!isi->user_formats)
 		return -ENOMEM;
-	}
 
 	memcpy(isi->user_formats, isi_fmts,
 	       num_fmts * sizeof(struct isi_format *));
@@ -1179,7 +1177,5 @@ static int atmel_isi_probe(struct platform_device *pdev)
-	if (!isi) {
-		dev_err(&pdev->dev, "Can't allocate interface!\n");
+	if (!isi)
 		return -ENOMEM;
-	}
 
 	isi->pclk = devm_clk_get(&pdev->dev, "isi_clk");
 	if (IS_ERR(isi->pclk))
-- 
2.14.1

