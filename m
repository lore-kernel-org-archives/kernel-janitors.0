From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 04 May 2019 03:54:30 +0000
Subject: [PATCH net-next] net: mvpp2: cls: Remove set but not used variable 'act'
Message-Id: <20190504040405.13004-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c: In function 'mvpp2_cls_c2_build_match':
drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c:1159:28: warning:
 variable 'act' set but not used [-Wunused-but-set-variable]

It is never used since introduction in
commit 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
index 4989fb13244f..f9623f928915 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
@@ -1156,11 +1156,8 @@ static int mvpp2_port_flt_rfs_rule_insert(struct mvpp2_port *port,
 static int mvpp2_cls_c2_build_match(struct mvpp2_rfs_rule *rule)
 {
 	struct flow_rule *flow = rule->flow;
-	struct flow_action_entry *act;
 	int offs = 64;
 
-	act = &flow->action.entries[0];
-
 	if (flow_rule_match_key(flow, FLOW_DISSECTOR_KEY_PORTS)) {
 		struct flow_match_ports match;
