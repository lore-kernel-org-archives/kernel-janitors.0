From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jun 2018 14:46:01 +0000
Subject: [PATCH 2/2 net] team: use netdev_features_t instead of u32
Message-Id: <20180604144601.wo5iqb5irfes4frv@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180604.093147.1707102168081704551.davem@davemloft.net>
In-Reply-To: <20180604.093147.1707102168081704551.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This code was introduced in 2011 around the same time that we made
netdev_features_t a u64 type.  These days a u32 is not big enough to
hold all the potential features.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/team/team.c b/drivers/net/team/team.c
index 267dcc929f6c..8863fa023500 100644
--- a/drivers/net/team/team.c
+++ b/drivers/net/team/team.c
@@ -1004,7 +1004,8 @@ static void team_port_disable(struct team *team,
 static void __team_compute_features(struct team *team)
 {
 	struct team_port *port;
-	u32 vlan_features = TEAM_VLAN_FEATURES & NETIF_F_ALL_FOR_ALL;
+	netdev_features_t vlan_features = TEAM_VLAN_FEATURES &
+					  NETIF_F_ALL_FOR_ALL;
 	netdev_features_t enc_features  = TEAM_ENC_FEATURES;
 	unsigned short max_hard_header_len = ETH_HLEN;
 	unsigned int dst_release_flag = IFF_XMIT_DST_RELEASE |
