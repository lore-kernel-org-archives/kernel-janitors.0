From: Dan Carpenter <error27@gmail.com>
Date: Wed, 15 Jun 2011 13:11:42 +0000
Subject: [patch -next] rtnetlink: unlock on error path in netlink_dump()
Message-Id: <20110615131142.GE23739@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Rose <gregory.v.rose@intel.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Patrick McHardy <kaber@trash.net>, Chris Wright <chrisw@sous-sol.org>, "David S. Miller" <davem@davemloft.net>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

In c7ac8679bec939 "rtnetlink: Compute and store minimum ifinfo dump
size", we moved the allocation under the lock so we need to unlock
on error path.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 0b92f7549..ca5276c 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1676,7 +1676,7 @@ static int netlink_dump(struct sock *sk)
 
 	skb = sock_rmalloc(sk, alloc_size, 0, GFP_KERNEL);
 	if (!skb)
-		goto errout;
+		goto errout_skb;
 
 	len = cb->dump(skb, cb);
 
@@ -1716,7 +1716,6 @@ static int netlink_dump(struct sock *sk)
 errout_skb:
 	mutex_unlock(nlk->cb_mutex);
 	kfree_skb(skb);
-errout:
 	return err;
 }
 
