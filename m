From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 07:20:20 +0000
Subject: [PATCH] net: ethernet: nb8800: remove redundant pointer rxd
Message-Id: <20180704072020.14785-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer rxd is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'rxb' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/aurora/nb8800.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/aurora/nb8800.c b/drivers/net/ethernet/aurora/nb8800.c
index e94159507847..c8d1f8fa4713 100644
--- a/drivers/net/ethernet/aurora/nb8800.c
+++ b/drivers/net/ethernet/aurora/nb8800.c
@@ -304,12 +304,10 @@ static int nb8800_poll(struct napi_struct *napi, int budget)
 
 again:
 	do {
-		struct nb8800_rx_buf *rxb;
 		unsigned int len;
 
 		next = (last + 1) % RX_DESC_COUNT;
 
-		rxb = &priv->rx_bufs[next];
 		rxd = &priv->rx_descs[next];
 
 		if (!rxd->report)
-- 
2.17.1

