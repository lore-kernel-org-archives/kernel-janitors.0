From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 07:54:55 +0000
Subject: [PATCH] net: ethernet: gianfar_ethtool: remove redundant variable last_rule_idx
Message-Id: <20180704075455.16010-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Claudiu Manoil <claudiu.manoil@nxp.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable last_rule_idx is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'last_rule_idx' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/freescale/gianfar_ethtool.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/gianfar_ethtool.c b/drivers/net/ethernet/freescale/gianfar_ethtool.c
index 8cb98cae0a6f..395a5266ea30 100644
--- a/drivers/net/ethernet/freescale/gianfar_ethtool.c
+++ b/drivers/net/ethernet/freescale/gianfar_ethtool.c
@@ -740,7 +740,6 @@ static void ethflow_to_filer_rules (struct gfar_private *priv, u64 ethflow)
 static int gfar_ethflow_to_filer_table(struct gfar_private *priv, u64 ethflow,
 				       u64 class)
 {
-	unsigned int last_rule_idx = priv->cur_filer_idx;
 	unsigned int cmp_rqfpr;
 	unsigned int *local_rqfpr;
 	unsigned int *local_rqfcr;
@@ -819,7 +818,6 @@ static int gfar_ethflow_to_filer_table(struct gfar_private *priv, u64 ethflow,
 	}
 
 	priv->cur_filer_idx = l - 1;
-	last_rule_idx = l;
 
 	/* hash rules */
 	ethflow_to_filer_rules(priv, ethflow);
-- 
2.17.1

