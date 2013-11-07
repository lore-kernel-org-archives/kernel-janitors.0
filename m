From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 07:52:00 +0000
Subject: [patch] dmaengine: s3c24xx-dma: make phy->irq signed for error handling
Message-Id: <20131107075200.GJ21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a bug in s3c24xx_dma_probe() where we do:

		phy->irq = platform_get_irq(pdev, i);
		if (phy->irq < 0) {

The problem is that "phy->irq" is unsigned so the error handling doesn't
work.  I have changed it to signed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 4cb1279..63b55f3 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -192,7 +192,7 @@ struct s3c24xx_dma_phy {
 	unsigned int			id;
 	bool				valid;
 	void __iomem			*base;
-	unsigned int			irq;
+	int				irq;
 	struct clk			*clk;
 	spinlock_t			lock;
 	struct s3c24xx_dma_chan		*serving;
