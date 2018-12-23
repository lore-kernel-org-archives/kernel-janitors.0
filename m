From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:57:02 +0000
Subject: [PATCH 07/20] dmaengine: at_hdmac: drop useless LIST_HEAD
Message-Id: <1545555435-24576-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: kernel-janitors@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares is never used.

tmp_list has been declared since the introduction of the driver
and has never been used.  The two declarations of list were
introduced with the containing functions but were also not used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: dc78baa2b90b ("dmaengine: at_hdmac: new driver for the Atmel AHB DMA Controller")
Fixes: 4facfe7f09f2b ("dmaengine: hdmac: Split device_control")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 drivers/dma/at_hdmac.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 01d936c9fe89..a0a9cd76c1d4 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -134,7 +134,6 @@ static struct at_desc *atc_desc_get(struct at_dma_chan *atchan)
 	struct at_desc *ret = NULL;
 	unsigned long flags;
 	unsigned int i = 0;
-	LIST_HEAD(tmp_list);
 
 	spin_lock_irqsave(&atchan->lock, flags);
 	list_for_each_entry_safe(desc, _desc, &atchan->free_list, desc_node) {
@@ -1387,8 +1386,6 @@ static int atc_pause(struct dma_chan *chan)
 	int			chan_id = atchan->chan_common.chan_id;
 	unsigned long		flags;
 
-	LIST_HEAD(list);
-
 	dev_vdbg(chan2dev(chan), "%s\n", __func__);
 
 	spin_lock_irqsave(&atchan->lock, flags);
@@ -1408,8 +1405,6 @@ static int atc_resume(struct dma_chan *chan)
 	int			chan_id = atchan->chan_common.chan_id;
 	unsigned long		flags;
 
-	LIST_HEAD(list);
-
 	dev_vdbg(chan2dev(chan), "%s\n", __func__);
 
 	if (!atc_chan_is_paused(atchan))
