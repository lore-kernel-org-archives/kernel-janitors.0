From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:15:27 +0000
Subject: [patch net-next] net: dsa: bcm_sf2: cleanup bcm_sf2_cfp_rule_get() a little
Message-Id: <20170207131527.GB31552@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch doesn't affect how the code works.

My static checker complains that the mask and shift doesn't make sense
because 0xffffff << 16 goes beyond the end of 32 bits.  It should be
0xffff instead but the existing code won't cause runtime bugs.

Also the casting here is not needed and not consistent with the rest of
the code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.c
index c71be3e0dc2d..346dd9a1232d 100644
--- a/drivers/net/dsa/bcm_sf2_cfp.c
+++ b/drivers/net/dsa/bcm_sf2_cfp.c
@@ -441,17 +441,17 @@ static int bcm_sf2_cfp_rule_get(struct bcm_sf2_priv *priv, int port,
 	nfc->fs.m_u.tcp_ip4_spec.psrc = cpu_to_be16(~0);
 
 	/* IPv4 dst [15:8] */
-	ipv4 = (u16)(reg & 0xff) << 8;
+	ipv4 = (reg & 0xff) << 8;
 	reg = core_readl(priv, CORE_CFP_DATA_PORT(1));
 	/* IPv4 dst [31:16] */
-	ipv4 |= (u32)((reg >> 8) & 0xffffff) << 16;
+	ipv4 |= ((reg >> 8) & 0xffff) << 16;
 	/* IPv4 dst [7:0] */
 	ipv4 |= (reg >> 24) & 0xff;
 	v4_spec->ip4dst = cpu_to_be32(ipv4);
 	nfc->fs.m_u.tcp_ip4_spec.ip4dst = cpu_to_be32(~0);
 
 	/* IPv4 src [15:8] */
-	ipv4 = (u16)(reg & 0xff) << 8;
+	ipv4 = (reg & 0xff) << 8;
 	reg = core_readl(priv, CORE_CFP_DATA_PORT(0));
 
 	if (!(reg & SLICE_VALID))
@@ -460,7 +460,7 @@ static int bcm_sf2_cfp_rule_get(struct bcm_sf2_priv *priv, int port,
 	/* IPv4 src [7:0] */
 	ipv4 |= (reg >> 24) & 0xff;
 	/* IPv4 src [31:16] */
-	ipv4 |= ((reg >> 8) & 0xffffff) << 16;
+	ipv4 |= ((reg >> 8) & 0xffff) << 16;
 	v4_spec->ip4src = cpu_to_be32(ipv4);
 	nfc->fs.m_u.tcp_ip4_spec.ip4src = cpu_to_be32(~0);
 
