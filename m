From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 07:30:43 +0000
Subject: [PATCH] net: bgmac: remove redundant variable 'freed'
Message-Id: <20180704073043.15286-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <scott.branden@broadcom.com>, Abhishek Shah <abhishek.shah@broadcom.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'freed' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'freed' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index e6ea8e61f96d..4c94d9218bba 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -236,7 +236,6 @@ static void bgmac_dma_tx_free(struct bgmac *bgmac, struct bgmac_dma_ring *ring)
 {
 	struct device *dma_dev = bgmac->dma_dev;
 	int empty_slot;
-	bool freed = false;
 	unsigned bytes_compl = 0, pkts_compl = 0;
 
 	/* The last slot that hardware didn't consume yet */
@@ -279,7 +278,6 @@ static void bgmac_dma_tx_free(struct bgmac *bgmac, struct bgmac_dma_ring *ring)
 
 		slot->dma_addr = 0;
 		ring->start++;
-		freed = true;
 	}
 
 	if (!pkts_compl)
-- 
2.17.1

