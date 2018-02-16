From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 16:00:11 +0000
Subject: [PATCH 3/3] pata_arasan_cf: Move two variable assignments in arasan_cf_probe()
Message-Id: <0f5492bc-d239-401e-6f77-a27897e4ede5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d492f9d2-ed64-e858-441a-fa554369032c@users.sourceforge.net>
In-Reply-To: <d492f9d2-ed64-e858-441a-fa554369032c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Feb 2018 16:42:26 +0100

Move assignments for the local variables "irq_handler" and "pdata"
so that their setting will only be performed after a call
of the function "devm_kzalloc" succeeded by this function.
Thus adjust a corresponding if statement.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/ata/pata_arasan_cf.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index ebecab8c3f36..27f241b1b1b1 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -790,12 +790,12 @@ static struct ata_port_operations arasan_cf_ops = {
 static int arasan_cf_probe(struct platform_device *pdev)
 {
 	struct arasan_cf_dev *acdev;
-	struct arasan_cf_pdata *pdata = dev_get_platdata(&pdev->dev);
+	struct arasan_cf_pdata *pdata;
 	struct ata_host *host;
 	struct ata_port *ap;
 	struct resource *res;
 	u32 quirk;
-	irq_handler_t irq_handler = NULL;
+	irq_handler_t irq_handler;
 	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -812,6 +812,7 @@ static int arasan_cf_probe(struct platform_device *pdev)
 	if (!acdev)
 		return -ENOMEM;
 
+	pdata = dev_get_platdata(&pdev->dev);
 	if (pdata)
 		quirk = pdata->quirk;
 	else
@@ -819,10 +820,12 @@ static int arasan_cf_probe(struct platform_device *pdev)
 
 	/* if irq is 0, support only PIO */
 	acdev->irq = platform_get_irq(pdev, 0);
-	if (acdev->irq)
+	if (acdev->irq) {
 		irq_handler = arasan_cf_interrupt;
-	else
+	} else {
 		quirk |= CF_BROKEN_MWDMA | CF_BROKEN_UDMA;
+		irq_handler = NULL;
+	}
 
 	acdev->pbase = res->start;
 	acdev->vbase = devm_ioremap_nocache(&pdev->dev, res->start,
-- 
2.16.1

