From: Colin King <colin.king@canonical.com>
Date: Mon, 30 Mar 2020 10:16:39 +0000
Subject: [PATCH][next] net: ethernet: ti: fix spelling mistake "rundom" -> "random"
Message-Id: <20200330101639.161268-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Grygorii Strashko <grygorii.strashko@ti.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 97f7385c6741..f71c15c39492 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1627,7 +1627,7 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
 							   port->slave.mac_addr) ||
 			   !is_valid_ether_addr(port->slave.mac_addr)) {
 			random_ether_addr(port->slave.mac_addr);
-			dev_err(dev, "Use rundom MAC address\n");
+			dev_err(dev, "Use random MAC address\n");
 		}
 	}
 	of_node_put(node);
-- 
2.25.1
