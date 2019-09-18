From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 12:50:27 +0000
Subject: [PATCH] mtd: st_spi_fsm: Use devm_platform_ioremap_resource() in stfsm_probe()
Message-Id: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Allison Randal <allison@lohutok.net>, Armijn Hemel <armijn@tjaldur.nl>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@linutronix.de>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 14:37:34 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/devices/st_spi_fsm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index f4d1667daaf9..5bd1c44ae529 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2034,13 +2034,7 @@ static int stfsm_probe(struct platform_device *pdev)

 	platform_set_drvdata(pdev, fsm);

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Resource not found\n");
-		return -ENODEV;
-	}
-
-	fsm->base = devm_ioremap_resource(&pdev->dev, res);
+	fsm->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(fsm->base)) {
 		dev_err(&pdev->dev,
 			"Failed to reserve memory region %pR\n", res);
--
2.23.0
