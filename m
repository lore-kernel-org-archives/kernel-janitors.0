From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 May 2018 12:01:25 +0000
Subject: [PATCH 1/2 net-next] net_failover: fix net_failover_compute_features()
Message-Id: <20180531120124.pc4txiifxnrslbei@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Sridhar Samudrala <sridhar.samudrala@intel.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This has an '&' vs '|' typo so it starts with vlan_features set to none.
Also a u32 type isn't large enough to hold all the feature bits, it
should be netdev_features_t.

Fixes: cfc80d9a1163 ("net: Introduce net_failover driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
index 8b508e2cf29b..ef50158e90a9 100644
--- a/drivers/net/net_failover.c
+++ b/drivers/net/net_failover.c
@@ -380,7 +380,8 @@ static rx_handler_result_t net_failover_handle_frame(struct sk_buff **pskb)
 
 static void net_failover_compute_features(struct net_device *dev)
 {
-	u32 vlan_features = FAILOVER_VLAN_FEATURES & NETIF_F_ALL_FOR_ALL;
+	netdev_features_t vlan_features = FAILOVER_VLAN_FEATURES |
+					  NETIF_F_ALL_FOR_ALL;
 	netdev_features_t enc_features  = FAILOVER_ENC_FEATURES;
 	unsigned short max_hard_header_len = ETH_HLEN;
 	unsigned int dst_release_flag = IFF_XMIT_DST_RELEASE |
