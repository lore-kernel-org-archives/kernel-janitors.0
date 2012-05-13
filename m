From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 13 May 2012 18:44:18 +0000
Subject: [patch] openvswitch: checking wrong variable in queue_userspace_packet()
Message-Id: <20120513184418.GB16541@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Gross <jesse@nicira.com>
Cc: "David S. Miller" <davem@davemloft.net>, dev@openvswitch.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"skb" is non-NULL here, for example we dereference it in skb_clone().
The intent was to test "nskb" which was just set.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index fe28562..2c74daa 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -321,7 +321,7 @@ static int queue_userspace_packet(int dp_ifindex, struct sk_buff *skb,
 			return -ENOMEM;
 
 		nskb = __vlan_put_tag(nskb, vlan_tx_tag_get(nskb));
-		if (!skb)
+		if (!nskb)
 			return -ENOMEM;
 
 		nskb->vlan_tci = 0;
