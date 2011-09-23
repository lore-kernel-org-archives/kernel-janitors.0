From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2011 06:16:01 +0000
Subject: [patch] dma/timberdale: free_irq() on an error path
Message-Id: <20110923061601.GB4387@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There was an error path that skipped the free_irq() step by mistake.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
index 6dbdf45..a4a398f 100644
--- a/drivers/dma/timb_dma.c
+++ b/drivers/dma/timb_dma.c
@@ -762,7 +762,7 @@ static int __devinit td_probe(struct platform_device *pdev)
 		if ((i % 2) = pchan->rx) {
 			dev_err(&pdev->dev, "Wrong channel configuration\n");
 			err = -EINVAL;
-			goto err_tasklet_kill;
+			goto err_free_irq;
 		}
 
 		td_chan->chan.device = &td->dma;
