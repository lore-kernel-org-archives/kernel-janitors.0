From: Colin King <colin.king@canonical.com>
Date: Wed, 21 Mar 2018 17:31:15 +0000
Subject: [PATCH][next] net: mvpp2: use correct index on array mvpp2_pools
Message-Id: <20180321173115.1820-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Antoine Tenart <antoine.tenart@bootlin.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array mvpp2_pools is being indexed by long_log_pool, however this
looks like a cut-n-paste bug and in fact should be short_log_pool.

Detected by CoverityScan, CID#1466113 ("Copy-paste error")

Fixes: 576193f2d579 ("net: mvpp2: jumbo frames support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/marvell/mvpp2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2.c b/drivers/net/ethernet/marvell/mvpp2.c
index 9bd35f2291d6..f8bc3d4a39ff 100644
--- a/drivers/net/ethernet/marvell/mvpp2.c
+++ b/drivers/net/ethernet/marvell/mvpp2.c
@@ -4632,7 +4632,7 @@ static int mvpp2_swf_bm_pool_init(struct mvpp2_port *port)
 	if (!port->pool_short) {
 		port->pool_short  			mvpp2_bm_pool_use(port, short_log_pool,
-					  mvpp2_pools[long_log_pool].pkt_size);
+					  mvpp2_pools[short_log_pool].pkt_size);
 		if (!port->pool_short)
 			return -ENOMEM;
 
-- 
2.15.1

