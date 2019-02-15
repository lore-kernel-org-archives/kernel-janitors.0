From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 15 Feb 2019 02:36:47 +0000
Subject: [PATCH net-next] net: dsa: bcm_sf2: Remove set but not used variables 'v6_spec, v6_m_spec'
Message-Id: <20190215023647.146445-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d90ee0a1-f36b-ffe6-8c2e-f54ae05d7c44@huawei.com>
In-Reply-To: <d90ee0a1-f36b-ffe6-8c2e-f54ae05d7c44@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/dsa/bcm_sf2_cfp.c: In function 'bcm_sf2_cfp_ipv6_rule_set':
drivers/net/dsa/bcm_sf2_cfp.c:606:40: warning:
 variable 'v6_m_spec' set but not used [-Wunused-but-set-variable]
drivers/net/dsa/bcm_sf2_cfp.c:606:30: warning:
 variable 'v6_spec' set but not used [-Wunused-but-set-variable]

It not used any more after commit e4f7ef54cbd8 ("dsa: bcm_sf2: use flow_rule
infrastructure")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/dsa/bcm_sf2_cfp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.c
index 0b9ca4bdf47e..e6234d209787 100644
--- a/drivers/net/dsa/bcm_sf2_cfp.c
+++ b/drivers/net/dsa/bcm_sf2_cfp.c
@@ -603,7 +603,6 @@ static int bcm_sf2_cfp_ipv6_rule_set(struct bcm_sf2_priv *priv, int port,
 				     unsigned int queue_num,
 				     struct ethtool_rx_flow_spec *fs)
 {
-	struct ethtool_tcpip6_spec *v6_spec, *v6_m_spec;
 	struct ethtool_rx_flow_spec_input input = {};
 	unsigned int slice_num, rule_index[2];
 	const struct cfp_udf_layout *layout;
@@ -618,13 +617,9 @@ static int bcm_sf2_cfp_ipv6_rule_set(struct bcm_sf2_priv *priv, int port,
 	switch (fs->flow_type & ~FLOW_EXT) {
 	case TCP_V6_FLOW:
 		ip_proto = IPPROTO_TCP;
-		v6_spec = &fs->h_u.tcp_ip6_spec;
-		v6_m_spec = &fs->m_u.tcp_ip6_spec;
 		break;
 	case UDP_V6_FLOW:
 		ip_proto = IPPROTO_UDP;
-		v6_spec = &fs->h_u.udp_ip6_spec;
-		v6_m_spec = &fs->m_u.udp_ip6_spec;
 		break;
 	default:
 		return -EINVAL;
