From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 May 2017 19:28:52 +0000
Subject: [PATCH 2/3] soc-knav_dma: Improve a size determination in knav_dma_probe()
Message-Id: <0cdbac2f-115c-a2f2-e44f-ab160fb76d29@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eddc35f7-a04b-42f5-ad8b-d345ca0b57b4@users.sourceforge.net>
In-Reply-To: <eddc35f7-a04b-42f5-ad8b-d345ca0b57b4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 21:06:46 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/soc/ti/knav_dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index a66671a93199..410018d9054e 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -739,8 +739,7 @@ static int knav_dma_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	kdev = devm_kzalloc(dev,
-			sizeof(struct knav_dma_pool_device), GFP_KERNEL);
+	kdev = devm_kzalloc(dev, sizeof(*kdev), GFP_KERNEL);
 	if (!kdev) {
 		dev_err(dev, "could not allocate driver mem\n");
 		return -ENOMEM;
-- 
2.12.2

