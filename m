From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 20:25:13 +0000
Subject: [PATCH 1/2] dma/ppc4xx: Delete an error message for a failed memory allocation in two functions
Message-Id: <ce6646e3-dfb5-2496-2a3a-d41de4802de6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 20:42:40 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/ppc4xx/adma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 4cf0d4d0cecf..f4033367d59b 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -4183,7 +4183,6 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 		INIT_LIST_HEAD(&ref->node);
 		list_add_tail(&ref->node, &ppc440spe_adma_chan_list);
 	} else {
-		dev_err(&ofdev->dev, "failed to allocate channel reference!\n");
 		ret = -ENOMEM;
 		goto err_ref_alloc;
 	}
@@ -4468,7 +4467,6 @@ static int ppc440spe_configure_raid_devices(void)
 	ppc440spe_dma_fifo_buf = kmalloc((DMA0_FIFO_SIZE + DMA1_FIFO_SIZE) << 1,
 					 GFP_KERNEL);
 	if (!ppc440spe_dma_fifo_buf) {
-		pr_err("%s: DMA FIFO buffer allocation failed.\n", __func__);
 		iounmap(i2o_reg);
 		dcr_unmap(i2o_dcr_host, dcr_len);
 		return -ENOMEM;
-- 
2.16.1

