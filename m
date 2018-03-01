From: Colin King <colin.king@canonical.com>
Date: Thu, 01 Mar 2018 16:42:40 +0000
Subject: [PATCH] net: amd8111e: remove redundant assignment to 'tx_index'
Message-Id: <20180301164240.18014-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable tx_index is being initialized with a value that is never
read and re-assigned a little later, hence the initialization is redundant
and can be removed.

Cleans up clang warning:
drivers/net/ethernet/amd/amd8111e.c:652:6: warning: Value stored to
'tx_index' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/amd/amd8111e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/amd8111e.c b/drivers/net/ethernet/amd/amd8111e.c
index 358f7ab77c70..c99e3e845ac0 100644
--- a/drivers/net/ethernet/amd/amd8111e.c
+++ b/drivers/net/ethernet/amd/amd8111e.c
@@ -649,7 +649,7 @@ static void amd8111e_free_ring(struct amd8111e_priv *lp)
 static int amd8111e_tx(struct net_device *dev)
 {
 	struct amd8111e_priv *lp = netdev_priv(dev);
-	int tx_index = lp->tx_complete_idx & TX_RING_DR_MOD_MASK;
+	int tx_index;
 	int status;
 	/* Complete all the transmit packet */
 	while (lp->tx_complete_idx != lp->tx_idx){
-- 
2.15.1

