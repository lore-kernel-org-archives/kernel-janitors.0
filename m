From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 05 May 2020 10:13:53 +0000
Subject: [PATCH -next] dmaengine: moxart-dma: Drop pointless static qualifier in moxart_probe()
Message-Id: <20200505101353.195446-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the 'void __iomem *dma_base_addr' variable
static since new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/dma/moxart-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/moxart-dma.c b/drivers/dma/moxart-dma.c
index 2a77fa319d78..347146a6e1d0 100644
--- a/drivers/dma/moxart-dma.c
+++ b/drivers/dma/moxart-dma.c
@@ -568,7 +568,7 @@ static int moxart_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct resource *res;
-	static void __iomem *dma_base_addr;
+	void __iomem *dma_base_addr;
 	int ret, i;
 	unsigned int irq;
 	struct moxart_chan *ch;
