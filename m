From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 May 2020 10:16:56 +0000
Subject: [PATCH 2/2 net] net: mvpp2: cls: Prevent buffer overflow in mvpp2_ethtool_cls_rule_del()
Message-Id: <20200506101656.GC77004@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200506101622.GB77004@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "info->fs.location" is a u32 that comes from the user via the
ethtool_set_rxnfc() function.  We need to check for invalid values to
prevent a buffer overflow.

I copy and pasted this check from the mvpp2_ethtool_cls_rule_ins()
function.

Fixes: 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
index 8972cdd559e85..7352244c5e68b 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
@@ -1428,6 +1428,9 @@ int mvpp2_ethtool_cls_rule_del(struct mvpp2_port *port,
 	struct mvpp2_ethtool_fs *efs;
 	int ret;
 
+	if (info->fs.location >= MVPP2_N_RFS_ENTRIES_PER_FLOW)
+		return -EINVAL;
+
 	efs = port->rfs_rules[info->fs.location];
 	if (!efs)
 		return -EINVAL;
-- 
2.26.2
