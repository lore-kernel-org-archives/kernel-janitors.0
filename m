From: Colin King <colin.king@canonical.com>
Date: Sun, 05 May 2019 21:38:14 +0000
Subject: [PATCH][next] net: mvpp2: cls: fix less than zero check on a u32 variable
Message-Id: <20190505213814.4220-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The signed return from the call to mvpp2_cls_c2_port_flow_index is being
assigned to the u32 variable c2.index and then checked for a negative
error condition which is always going to be false. Fix this by assigning
the return to the int variable index and checking this instead.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
index 4989fb13244f..c10bc257f571 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
@@ -1029,12 +1029,14 @@ static int mvpp2_port_c2_tcam_rule_add(struct mvpp2_port *port,
 	struct flow_action_entry *act;
 	struct mvpp2_cls_c2_entry c2;
 	u8 qh, ql, pmap;
+	int index;
 
 	memset(&c2, 0, sizeof(c2));
 
-	c2.index = mvpp2_cls_c2_port_flow_index(port, rule->loc);
-	if (c2.index < 0)
+	index = mvpp2_cls_c2_port_flow_index(port, rule->loc);
+	if (index < 0)
 		return -EINVAL;
+	c2.index = index;
 
 	act = &rule->flow->action.entries[0];
 
-- 
2.20.1
