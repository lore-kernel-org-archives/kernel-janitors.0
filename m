From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Mar 2015 10:30:25 +0000
Subject: [patch] sata_dwc_460ex: indent an if statement
Message-Id: <20150330103025.GA27144@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

We shuffled some code around in 8b3444852a2b ('sata_dwc_460ex: move to
generic DMA driver') an accidentally deleted a tab character here.  It
causes a Smatch warning "if statement not indented".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 5ab4849..9020349 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -295,7 +295,7 @@ static void dma_dwc_xfer_done(void *hsdev_instance)
 	}
 
 	if ((hsdevp->dma_interrupt_count % 2) = 0)
-	sata_dwc_dma_xfer_complete(ap, 1);
+		sata_dwc_dma_xfer_complete(ap, 1);
 
 	spin_unlock_irqrestore(&host->lock, flags);
 }
