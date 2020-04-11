From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Apr 2020 07:52:11 +0000
Subject: [PATCH] net: ethernet: ti: Add missing '\n' in log messages
Message-Id: <20200411075211.9027-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, grygorii.strashko@ti.com, colin.king@canonical.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index f71c15c39492..2bf56733ba94 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1372,7 +1372,7 @@ static int am65_cpsw_nuss_init_tx_chns(struct am65_cpsw_common *common)
 err:
 	i = devm_add_action(dev, am65_cpsw_nuss_free_tx_chns, common);
 	if (i) {
-		dev_err(dev, "failed to add free_tx_chns action %d", i);
+		dev_err(dev, "Failed to add free_tx_chns action %d\n", i);
 		return i;
 	}
 
@@ -1481,7 +1481,7 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 err:
 	i = devm_add_action(dev, am65_cpsw_nuss_free_rx_chns, common);
 	if (i) {
-		dev_err(dev, "failed to add free_rx_chns action %d", i);
+		dev_err(dev, "Failed to add free_rx_chns action %d\n", i);
 		return i;
 	}
 
@@ -1691,7 +1691,7 @@ static int am65_cpsw_nuss_init_ndev_2g(struct am65_cpsw_common *common)
 	ret = devm_add_action_or_reset(dev, am65_cpsw_pcpu_stats_free,
 				       ndev_priv->stats);
 	if (ret) {
-		dev_err(dev, "failed to add percpu stat free action %d", ret);
+		dev_err(dev, "Failed to add percpu stat free action %d\n", ret);
 		return ret;
 	}
 
-- 
2.20.1
