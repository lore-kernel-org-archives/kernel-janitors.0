From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Jan 2015 09:22:35 +0000
Subject: [patch] bridge: simplify br_getlink() a bit
Message-Id: <20150121092235.GA19206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, bridge@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Static checkers complain that we should maybe set "ret" before we do the
"goto out;".  They interpret the NULL return from br_port_get_rtnl() as
a failure and forgetting to set the error code is a common bug in this
situation.

The code is confusing but it's actually correct.  We are returning zero
deliberately.  Let's re-write it a bit to be more clear.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
index 528cf27..3875ea51 100644
--- a/net/bridge/br_netlink.c
+++ b/net/bridge/br_netlink.c
@@ -311,17 +311,14 @@ errout:
 int br_getlink(struct sk_buff *skb, u32 pid, u32 seq,
 	       struct net_device *dev, u32 filter_mask)
 {
-	int err = 0;
 	struct net_bridge_port *port = br_port_get_rtnl(dev);
 
 	if (!port && !(filter_mask & RTEXT_FILTER_BRVLAN) &&
 	    !(filter_mask & RTEXT_FILTER_BRVLAN_COMPRESSED))
-		goto out;
+		return 0;
 
-	err = br_fill_ifinfo(skb, port, pid, seq, RTM_NEWLINK, NLM_F_MULTI,
-			     filter_mask, dev);
-out:
-	return err;
+	return br_fill_ifinfo(skb, port, pid, seq, RTM_NEWLINK, NLM_F_MULTI,
+			      filter_mask, dev);
 }
 
 static int br_vlan_info(struct net_bridge *br, struct net_bridge_port *p,
