From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2019 10:44:19 +0000
Subject: [PATCH] net: dsa: bcm_sf2: fix buffer overflow doing set_rxnfc
Message-Id: <20190430104419.GA9096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "fs->location" is a u32 that comes from the user in ethtool_set_rxnfc().
We can't pass unclamped values to test_bit() or it results in an out of
bounds access beyond the end of the bitmap.

Fixes: 7318166cacad ("net: dsa: bcm_sf2: Add support for ethtool::rxnfc")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/dsa/bcm_sf2_cfp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.c
index e6234d209787..4212bc4a5f31 100644
--- a/drivers/net/dsa/bcm_sf2_cfp.c
+++ b/drivers/net/dsa/bcm_sf2_cfp.c
@@ -886,6 +886,9 @@ static int bcm_sf2_cfp_rule_set(struct dsa_switch *ds, int port,
 	     fs->m_ext.data[1]))
 		return -EINVAL;
 
+	if (fs->location != RX_CLS_LOC_ANY && fs->location >= CFP_NUM_RULES)
+		return -EINVAL;
+
 	if (fs->location != RX_CLS_LOC_ANY &&
 	    test_bit(fs->location, priv->cfp.used))
 		return -EBUSY;
@@ -974,6 +977,9 @@ static int bcm_sf2_cfp_rule_del(struct bcm_sf2_priv *priv, int port, u32 loc)
 	struct cfp_rule *rule;
 	int ret;
 
+	if (loc >= CFP_NUM_RULES)
+		return -EINVAL;
+
 	/* Refuse deleting unused rules, and those that are not unique since
 	 * that could leave IPv6 rules with one of the chained rule in the
 	 * table.
-- 
2.18.0
