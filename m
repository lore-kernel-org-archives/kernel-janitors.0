From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Jul 2018 09:26:13 +0000
Subject: [PATCH] net: socionext: remove redundant pointer ndev
Message-Id: <20180705092613.20560-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jaswinder.singh@linaro.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer ndev is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'ndev' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/socionext/netsec.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
index e080d3e7c582..01589b6982e4 100644
--- a/drivers/net/ethernet/socionext/netsec.c
+++ b/drivers/net/ethernet/socionext/netsec.c
@@ -780,11 +780,9 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
 static int netsec_napi_poll(struct napi_struct *napi, int budget)
 {
 	struct netsec_priv *priv;
-	struct net_device *ndev;
 	int tx, rx, done, todo;
 
 	priv = container_of(napi, struct netsec_priv, napi);
-	ndev = priv->ndev;
 
 	todo = budget;
 	do {
-- 
2.17.1

