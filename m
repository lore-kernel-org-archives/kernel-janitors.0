From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 09:50:24 +0000
Subject: [patch 1/2] dma: pl330: off by one in pl330_probe()
Message-Id: <20131108095024.GH27977@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are only AMBA_NR_IRQS (2) elements in adev->irq[].  This code
maybe works if the there is a zero directly after the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 4b2583c..4af4b0c 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2926,7 +2926,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 
 	amba_set_drvdata(adev, pdmac);
 
-	for (i = 0; i <= AMBA_NR_IRQS; i++) {
+	for (i = 0; i < AMBA_NR_IRQS; i++) {
 		irq = adev->irq[i];
 		if (irq) {
 			ret = devm_request_irq(&adev->dev, irq,
