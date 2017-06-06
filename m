From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Jun 2017 13:10:49 +0000
Subject: [PATCH] net: stmmac: fix a broken u32 less than zero check
Message-Id: <20170606131049.26887-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check that queue is less or equal to zero is always true
because queue is a u32; queue is decremented and will wrap around
and never go -ve. Fix this by making queue an int.

Detected by CoverityScan, CID#1428988 ("Unsigned compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 68a188e74c54..05b1ec9194da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1207,7 +1207,7 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
 	u32 rx_count = priv->plat->rx_queues_to_use;
 	unsigned int bfsize = 0;
 	int ret = -ENOMEM;
-	u32 queue;
+	int queue;
 	int i;
 
 	if (priv->hw->mode->set_16kib_bfsize)
-- 
2.11.0

