From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 02 Aug 2020 12:22:27 +0000
Subject: [PATCH] ath10k: Fix the size used in a 'dma_free_coherent()' call in an error handling path
Message-Id: <20200802122227.678637-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, pillair@codeaurora.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Update the size used in 'dma_free_coherent()' in order to match the one
used in the corresponding 'dma_alloc_coherent()'.

Fixes: 1863008369ae ("ath10k: fix shadow register implementation for WCN3990")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch looks obvious to me, but commit 1863008369ae looks also simple.
So it is surprising that such a "typo" slipped in.
---
 drivers/net/wireless/ath/ath10k/ce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 294fbc1e89ab..e6e0284e4783 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1555,7 +1555,7 @@ ath10k_ce_alloc_src_ring(struct ath10k *ar, unsigned int ce_id,
 		ret = ath10k_ce_alloc_shadow_base(ar, src_ring, nentries);
 		if (ret) {
 			dma_free_coherent(ar->dev,
-					  (nentries * sizeof(struct ce_desc_64) +
+					  (nentries * sizeof(struct ce_desc) +
 					   CE_DESC_RING_ALIGN),
 					  src_ring->base_addr_owner_space_unaligned,
 					  base_addr);
-- 
2.25.1
