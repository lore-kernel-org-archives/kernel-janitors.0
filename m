From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 08 Jul 2017 07:46:43 +0000
Subject: [PATCH 2/3] net: stmmac: Fix error handling path in 'alloc_dma_tx_desc_resources()'
Message-Id: <41bce9018e1acec009ed184ba238f495a678297e.1499499451.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1499499451.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1499499451.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peppe.cavallaro@st.com, alexandre.torgue@st.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the first 'kmalloc_array' within the loop fails, we should free what
as already been allocated, as done in all other error handling path.

Fixes: ce736788e8a9 ("net: stmmac: adding multiple buffers for TX")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4322fa4a13e8..07d486a70118 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1561,7 +1561,7 @@ static int alloc_dma_tx_desc_resources(struct stmmac_priv *priv)
 						    sizeof(*tx_q->tx_skbuff_dma),
 						    GFP_KERNEL);
 		if (!tx_q->tx_skbuff_dma)
-			return -ENOMEM;
+			goto err_dma_buffers;
 
 		tx_q->tx_skbuff = kmalloc_array(DMA_TX_SIZE,
 						sizeof(struct sk_buff *),
-- 
2.11.0

