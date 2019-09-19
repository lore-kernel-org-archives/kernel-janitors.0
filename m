From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 19 Sep 2019 12:04:30 +0000
Subject: [PATCH v2] mtd: st_spi_fsm: Use devm_platform_ioremap_resource() in stfsm_probe()
Message-Id: <eec0774d-135b-2b19-2595-7a126341c77c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
 <20190919111014.6c569cf3@xps13>
In-Reply-To: <20190919111014.6c569cf3@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Miquel Raynal <miquel.raynal@bootlin.com>, Allison Randal <allison@lohutok.net>, Armijn Hemel <armijn@tjaldur.nl>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@linutronix.de>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Sep 2019 13:30:51 +0200

Simplify this function implementation by using a known wrapper function.
* Thus reduce also a bit of exception handling code.
* Delete the local variable “res”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Further changes were requested by Miquel Raynal.
https://lore.kernel.org/r/20190919111014.6c569cf3@xps13/

* An error message was adjusted another bit.
* A variable was removed.


 drivers/mtd/devices/st_spi_fsm.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index f4d1667daaf9..ce18198301d5 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2017,7 +2017,6 @@ static int stfsm_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct flash_info *info;
-	struct resource *res;
 	struct stfsm *fsm;
 	int ret;

@@ -2033,17 +2032,9 @@ static int stfsm_probe(struct platform_device *pdev)
 	fsm->dev = &pdev->dev;

 	platform_set_drvdata(pdev, fsm);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Resource not found\n");
-		return -ENODEV;
-	}
-
-	fsm->base = devm_ioremap_resource(&pdev->dev, res);
+	fsm->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(fsm->base)) {
-		dev_err(&pdev->dev,
-			"Failed to reserve memory region %pR\n", res);
+		dev_err(&pdev->dev, "Failed to reserve memory region\n");
 		return PTR_ERR(fsm->base);
 	}

--
2.23.0
