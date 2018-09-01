From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 01 Sep 2018 03:13:10 +0000
Subject: [PATCH net-next] net: bgmac: remove set but not used variable 'err'
Message-Id: <1535771590-158413-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Colin Ian King <colin.king@canonical.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/broadcom/bgmac.c: In function 'bgmac_dma_alloc':
drivers/net/ethernet/broadcom/bgmac.c:619:6: warning:
 variable 'err' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 4c94d92..cabc8e4 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -616,7 +616,6 @@ static int bgmac_dma_alloc(struct bgmac *bgmac)
 	static const u16 ring_base[] = { BGMAC_DMA_BASE0, BGMAC_DMA_BASE1,
 					 BGMAC_DMA_BASE2, BGMAC_DMA_BASE3, };
 	int size; /* ring size: different for Tx and Rx */
-	int err;
 	int i;
 
 	BUILD_BUG_ON(BGMAC_MAX_TX_RINGS > ARRAY_SIZE(ring_base));
@@ -666,7 +665,6 @@ static int bgmac_dma_alloc(struct bgmac *bgmac)
 		if (!ring->cpu_base) {
 			dev_err(bgmac->dev, "Allocation of RX ring 0x%X failed\n",
 				ring->mmio_base);
-			err = -ENOMEM;
 			goto err_dma_free;
 		}
