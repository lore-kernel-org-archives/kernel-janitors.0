From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 31 Aug 2018 03:57:34 +0000
Subject: [PATCH net-next] bnxt_en: remove set but not used variable 'rx_stats'
Message-Id: <1535688481-65721-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Chan <michael.chan@broadcom.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c: In function 'bnxt_vf_rep_rx':
drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c:212:28: warning:
 variable 'rx_stats' set but not used [-Wunused-but-set-variable]
  struct bnxt_vf_rep_stats *rx_stats;

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c
index e31f5d8..b574fe8 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c
@@ -209,9 +209,7 @@ struct net_device *bnxt_get_vf_rep(struct bnxt *bp, u16 cfa_code)
 void bnxt_vf_rep_rx(struct bnxt *bp, struct sk_buff *skb)
 {
 	struct bnxt_vf_rep *vf_rep = netdev_priv(skb->dev);
-	struct bnxt_vf_rep_stats *rx_stats;
 
-	rx_stats = &vf_rep->rx_stats;
 	vf_rep->rx_stats.bytes += skb->len;
 	vf_rep->rx_stats.packets++;
