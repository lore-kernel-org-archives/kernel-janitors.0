From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Jun 2019 13:49:40 +0000
Subject: [PATCH] dmaengine: jz4780: Fix an endian bug in IRQ handler
Message-Id: <20190624134940.GC1754@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Paul Cercueil <paul@crapouillou.net>
Cc: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

The "pending" variable was a u32 but we cast it to an unsigned long
pointer when we do the for_each_set_bit() loop.  The problem is that on
big endian 64bit systems that results in an out of bounds read.

Fixes: 4e4106f5e942 ("dmaengine: jz4780: Fix transfers being ACKed too soon")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't know if this driver is ever used on a big endian 64 bit system,
but the fix is pretty easy and it silences a static checker warning.

Not tested.

 drivers/dma/dma-jz4780.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 77260a6f5178..dfd10fe3c9b3 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -717,12 +717,13 @@ static irqreturn_t jz4780_dma_irq_handler(int irq, void *data)
 {
 	struct jz4780_dma_dev *jzdma = data;
 	unsigned int nb_channels = jzdma->soc_data->nb_channels;
-	uint32_t pending, dmac;
+	unsigned long pending;
+	uint32_t dmac;
 	int i;
 
 	pending = jz4780_dma_ctrl_readl(jzdma, JZ_DMA_REG_DIRQP);
 
-	for_each_set_bit(i, (unsigned long *)&pending, nb_channels) {
+	for_each_set_bit(i, &pending, nb_channels) {
 		if (jz4780_dma_chan_irq(jzdma, &jzdma->chan[i]))
 			pending &= ~BIT(i);
 	}
-- 
2.20.1
