From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 09 Jan 2019 12:10:37 +0000
Subject: [PATCH -next] dmaengine: xilinx_dma: remove set but not used variable 'tail_segment'
Message-Id: <1547035837-87800-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Michal Simek <michal.simek@xilinx.com>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, Andrea Merello <andrea.merello@gmail.com>, Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: YueHaibing <yuehaibing@huawei.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/dma/xilinx/xilinx_dma.c: In function 'xilinx_vdma_start_transfer':
drivers/dma/xilinx/xilinx_dma.c:1104:33: warning:
 variable 'tail_segment' set but not used [-Wunused-but-set-variable]

It not used since commit b8349172b400 ("dmaengine: xilinx_dma: Drop SG support
for VDMA IP")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index d9431af..c8acd34 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1101,7 +1101,6 @@ static void xilinx_vdma_start_transfer(struct xilinx_dma_chan *chan)
 	struct xilinx_vdma_config *config = &chan->config;
 	struct xilinx_dma_tx_descriptor *desc, *tail_desc;
 	u32 reg, j;
-	struct xilinx_vdma_tx_segment *tail_segment;
 	struct xilinx_vdma_tx_segment *segment, *last = NULL;
 	int i = 0;
 
@@ -1120,9 +1119,6 @@ static void xilinx_vdma_start_transfer(struct xilinx_dma_chan *chan)
 	tail_desc = list_last_entry(&chan->pending_list,
 				    struct xilinx_dma_tx_descriptor, node);
 
-	tail_segment = list_last_entry(&tail_desc->segments,
-				       struct xilinx_vdma_tx_segment, node);
-
 	/* Configure the hardware using info in the config structure */
 	if (chan->has_vflip) {
 		reg = dma_read(chan, XILINX_VDMA_REG_ENABLE_VERTICAL_FLIP);
