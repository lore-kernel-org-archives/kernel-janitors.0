From: Dan Carpenter <error27@gmail.com>
Date: Wed, 05 Jan 2011 07:03:12 +0000
Subject: [patch 1/2] dcb: unlock on error in dcbnl_ieee_get()
Message-Id: <20110105070312.GA24847@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: John Fastabend <john.r.fastabend@intel.com>, Shmulik Ravid <shmulikr@broadcom.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

There is a "goto nla_put_failure" hidden inside the NLA_PUT() macro, but
we're holding the dcb_lock so we need to unlock first.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/dcb/dcbnl.c b/net/dcb/dcbnl.c
index ff3c12d..8881cb5 100644
--- a/net/dcb/dcbnl.c
+++ b/net/dcb/dcbnl.c
@@ -1264,9 +1264,14 @@ static int dcbnl_ieee_get(struct net_device *netdev, struct nlattr **tb,
 
 	spin_lock(&dcb_lock);
 	list_for_each_entry(itr, &dcb_app_list, list) {
-		if (strncmp(itr->name, netdev->name, IFNAMSIZ) = 0)
-			NLA_PUT(skb, DCB_ATTR_IEEE_APP,
-				sizeof(itr->app), &itr->app);
+		if (strncmp(itr->name, netdev->name, IFNAMSIZ) = 0) {
+			err = nla_put(skb, DCB_ATTR_IEEE_APP, sizeof(itr->app),
+					 &itr->app);
+			if (err) {
+				spin_unlock(&dcb_lock);
+				goto nla_put_failure;
+			}
+		}
 	}
 	spin_unlock(&dcb_lock);
 	nla_nest_end(skb, app);
