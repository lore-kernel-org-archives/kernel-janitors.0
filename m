From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jun 2018 14:43:21 +0000
Subject: [PATCH 1/2 v2 net-next] net_failover: Use netdev_features_t instead of u32
Message-Id: <20180604144321.kjemxdfhi4qqb5ji@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180604.093147.1707102168081704551.davem@davemloft.net>
In-Reply-To: <20180604.093147.1707102168081704551.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Sridhar Samudrala <sridhar.samudrala@intel.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The features mask needs to be a netdev_features_t (u64) because a u32
is not big enough.

Fixes: cfc80d9a1163 ("net: Introduce net_failover driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: In the original patch, I thought that the & should be | and I
    introduced a bug.

diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
index 8b508e2cf29b..83f7420ddea5 100644
--- a/drivers/net/net_failover.c
+++ b/drivers/net/net_failover.c
@@ -380,7 +380,8 @@ static rx_handler_result_t net_failover_handle_frame(struct sk_buff **pskb)
 
 static void net_failover_compute_features(struct net_device *dev)
 {
-	u32 vlan_features = FAILOVER_VLAN_FEATURES & NETIF_F_ALL_FOR_ALL;
+	netdev_features_t vlan_features = FAILOVER_VLAN_FEATURES &
+					  NETIF_F_ALL_FOR_ALL;
 	netdev_features_t enc_features  = FAILOVER_ENC_FEATURES;
 	unsigned short max_hard_header_len = ETH_HLEN;
 	unsigned int dst_release_flag = IFF_XMIT_DST_RELEASE |
