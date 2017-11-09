From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Nov 2017 13:59:43 +0000
Subject: [PATCH] openvswitch: add null pointer check on upcall
Message-Id: <20171109135943.418-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pravin Shelar <pshelar@nicira.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, dev@openvswitch.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

upcall may be assigned a NULL pointer as genlmsg_put can potentially
return a NULL.  Add a null check to avoid a null pointer dereference
on upcall.

Detected by CoverityScan, CID#728404 ("Dereference null return value")

Fixes: commit ccb1352e76cf ("net: Add Open vSwitch kernel components.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/openvswitch/datapath.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index 4d38ac044cee..e8fb3d76fa6e 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -461,6 +461,10 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
 
 	upcall = genlmsg_put(user_skb, 0, 0, &dp_packet_genl_family,
 			     0, upcall_info->cmd);
+	if (!upcall) {
+		err = -ENOBUFS;
+		goto out;
+	}
 	upcall->dp_ifindex = dp_ifindex;
 
 	err = ovs_nla_put_key(key, key, OVS_PACKET_ATTR_KEY, false, user_skb);
-- 
2.14.1

