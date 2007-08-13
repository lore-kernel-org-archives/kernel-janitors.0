From: "Scott Thompson" <postfail@hushmail.com>
Date: Mon, 13 Aug 2007 03:29:56 +0000
Subject: [PATCH ] /drivers/ata ioremap returncode check (pata_ixp4xx_cf.c)
Message-Id: <20070813032957.44BD9DA820@mailserver8.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: a.zummo@towertech.it

patch against 2.6.23-rc2.  this corrects two missing ioremap return 
checks.

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
----------------------------------------------------------

diff --git a/drivers/ata/pata_ixp4xx_cf.c 
b/drivers/ata/pata_ixp4xx_cf.c
index 4ca7fd6..eaebc4d 100644
--- a/drivers/ata/pata_ixp4xx_cf.c
+++ b/drivers/ata/pata_ixp4xx_cf.c
@@ -189,6 +189,14 @@ static __devinit int ixp4xx_pata_probe(struct 
platform_device *pdev)
 	data->cs0 = devm_ioremap(&pdev->dev, cs0->start, 0x1000);
 	data->cs1 = devm_ioremap(&pdev->dev, cs1->start, 0x1000);
 
+	if (!data->cs0 || !data->cs1) {
+		if (data->cs0)
+			iounmap(data->cs0);
+		if (data->cs1)
+			iounmap(data->cs1);
+		return -ENOMEM;
+	}
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq)
 		set_irq_type(irq, IRQT_RISING);

