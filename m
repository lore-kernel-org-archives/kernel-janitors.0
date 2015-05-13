From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Date: Wed, 13 May 2015 11:43:09 +0000
Subject: [PATCH net-next] netns: fix unbalanced spin_lock on error
Message-Id: <1431517389-19937-1-git-send-email-nicolas.dichtel@6wind.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55533771.6080406@6wind.com>
In-Reply-To: <55533771.6080406@6wind.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: davem@davemloft.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Nicolas Dichtel <nicolas.dichtel@6wind.com>

Unlock was missing on error path.

Fixes: 95f38411df05 ("netns: use a spin_lock to protect nsid management")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 net/core/net_namespace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index a665bf490c88..cb32c0378c10 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -565,6 +565,7 @@ static int rtnl_net_newid(struct sk_buff *skb, struct nlmsghdr *nlh)
 
 	spin_lock_irqsave(&nsid_lock, flags);
 	if (__peernet2id(net, peer) >= 0) {
+		spin_unlock_irqrestore(&nsid_lock, flags);
 		err = -EEXIST;
 		goto out;
 	}
-- 
2.2.2

