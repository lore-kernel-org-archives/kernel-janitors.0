From: Dan Carpenter <error27@gmail.com>
Date: Thu, 28 Oct 2010 13:41:56 +0000
Subject: [patch] dma/intel_mid_dma: remove unneeded null check
Message-Id: <20101028134156.GD6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yong Wang <yong.y.wang@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains because we dereference "mid" before checking it.  It
turns out that "mid" is always a valid pointer here so we can just
remove the check.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/dma/intel_mid_dma.c b/drivers/dma/intel_mid_dma.c
index 338bc4e..41941d0 100644
--- a/drivers/dma/intel_mid_dma.c
+++ b/drivers/dma/intel_mid_dma.c
@@ -1021,11 +1021,6 @@ static irqreturn_t intel_mid_dma_interrupt(int irq, void *data)
 
 	/*DMA Interrupt*/
 	pr_debug("MDMA:Got an interrupt on irq %d\n", irq);
-	if (!mid) {
-		pr_err("ERR_MDMA:null pointer mid\n");
-		return -EINVAL;
-	}
-
 	pr_debug("MDMA: Status %x, Mask %x\n", tfr_status, mid->intr_mask);
 	tfr_status &= mid->intr_mask;
 	if (tfr_status) {
