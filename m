From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Dec 2020 16:06:14 +0000
Subject: [PATCH 2/2] dmaengine: fsldma: Fix a resource leak in an error handling path of the probe function
Message-Id: <20201212160614.92576-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: leoyang.li@nxp.com, zw@zh-kernel.org, vkoul@kernel.org, dan.j.williams@intel.com, iws@ovro.caltech.edu
Cc: linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error, the previous 'fsl_dma_chan_probe()' calls must be undone
by some 'fsl_dma_chan_remove()', as already done in the remove function.

It was added in the remove function in commit 77cd62e8082b ("fsldma: allow
Freescale Elo DMA driver to be compiled as a module")

Fixes: d3f620b2c4fe ("fsldma: simplify IRQ probing and handling")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Patch provided as-is.
I don't have the configuration to compile test this patch
---
 drivers/dma/fsldma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 554f70a0c18c..f8459cc5315d 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1214,6 +1214,7 @@ static int fsldma_of_probe(struct platform_device *op)
 {
 	struct fsldma_device *fdev;
 	struct device_node *child;
+	unsigned int i;
 	int err;
 
 	fdev = kzalloc(sizeof(*fdev), GFP_KERNEL);
@@ -1292,6 +1293,10 @@ static int fsldma_of_probe(struct platform_device *op)
 	return 0;
 
 out_free_fdev:
+	for (i = 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
+		if (fdev->chan[i])
+			fsl_dma_chan_remove(fdev->chan[i]);
+	}
 	irq_dispose_mapping(fdev->irq);
 	iounmap(fdev->regs);
 out_free:
-- 
2.27.0
