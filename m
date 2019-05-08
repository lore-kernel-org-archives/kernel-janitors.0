From: Colin King <colin.king@canonical.com>
Date: Wed, 08 May 2019 22:33:29 +0000
Subject: [PATCH] dma: dw-axi-dmac: fix null dereference when pointer first is null
Message-Id: <20190508223329.26796-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Huang Shijie <sjhuang@iluvatar.ai>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the unlikely event that axi_desc_get returns a null desc in the
very first iteration of the while-loop the error exit path ends
up calling axi_desc_put on a null pointer 'first' and this causes
a null pointer dereference.  Fix this by adding a null check on
pointer 'first' before calling axi_desc_put.

Addresses-Coverity: ("Explicit null dereference")
fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b2ac1d2c5b86..a1ce307c502f 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -512,7 +512,8 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst_adr,
 	return vchan_tx_prep(&chan->vc, &first->vd, flags);
 
 err_desc_get:
-	axi_desc_put(first);
+	if (first)
+		axi_desc_put(first);
 	return NULL;
 }
 
-- 
2.20.1
