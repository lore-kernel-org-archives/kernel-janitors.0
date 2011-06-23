From: Dan Carpenter <error27@gmail.com>
Date: Thu, 23 Jun 2011 05:58:02 +0000
Subject: [patch -next] dcb: use nlmsg_free() instead of kfree()
Message-Id: <20110623055802.GN14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Fastabend <john.r.fastabend@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>, Shmulik Ravid <shmulikr@broadcom.com>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

These sk_buff structs were allocated with nlmsg_new() so they should
be freed with nlmsg_free().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/dcb/dcbnl.c b/net/dcb/dcbnl.c
index e954d4c..fc56e85 100644
--- a/net/dcb/dcbnl.c
+++ b/net/dcb/dcbnl.c
@@ -1329,7 +1329,7 @@ int dcbnl_notify(struct net_device *dev, int event, int cmd,
 
 	nlh = nlmsg_put(skb, pid, 0, event, sizeof(*dcb), 0);
 	if (nlh = NULL) {
-		kfree(skb);
+		nlmsg_free(skb);
 		return -EMSGSIZE;
 	}
 
@@ -1434,7 +1434,7 @@ static int dcbnl_ieee_get(struct net_device *netdev, struct nlattr **tb,
 
 	nlh = nlmsg_put(skb, pid, seq, RTM_GETDCB, sizeof(*dcb), flags);
 	if (nlh = NULL) {
-		kfree(skb);
+		nlmsg_free(skb);
 		return -EMSGSIZE;
 	}
 
