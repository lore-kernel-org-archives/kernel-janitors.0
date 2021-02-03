From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Feb 2021 13:46:52 +0000
Subject: [PATCH][next] dmaengine: dw-axi-dmac: remove redundant null check on desc
Message-Id: <20210203134652.22618-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Sia Jee Heng <jee.heng.sia@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer desc is being null checked twice, the second null check
is redundant because desc has not been re-assigned between the
checks. Remove the redundant second null check on desc.

Addresses-Coverity: ("Logically dead code")
Fixes: ef6fb2d6f1ab ("dmaengine: dw-axi-dmac: simplify descriptor management")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index ac3d81b72a15..d9e4ac3edb4e 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -919,10 +919,6 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst_adr,
 		num++;
 	}
 
-	/* Total len of src/dest sg = 0, so no descriptor were allocated */
-	if (unlikely(!desc))
-		return NULL;
-
 	/* Set end-of-link to the last link descriptor of list */
 	set_desc_last(&desc->hw_desc[num - 1]);
 	/* Managed transfer list */
-- 
2.29.2
