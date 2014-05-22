From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 May 2014 07:53:06 +0000
Subject: [patch] ieee802154: missing put_dev() on error
Message-Id: <20140522075306.GB4346@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We should call put_dev() on the error path here.

Fixes: 3e9c156e2c21 ('ieee802154: add netlink interfaces for llsec')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to -next

diff --git a/net/ieee802154/nl-mac.c b/net/ieee802154/nl-mac.c
index 5617b4c..a3281b8 100644
--- a/net/ieee802154/nl-mac.c
+++ b/net/ieee802154/nl-mac.c
@@ -832,8 +832,10 @@ int ieee802154_llsec_getparams(struct sk_buff *skb, struct genl_info *info)
 		return -ENODEV;
 
 	ops = ieee802154_mlme_ops(dev);
-	if (!ops->llsec)
-		return -EOPNOTSUPP;
+	if (!ops->llsec) {
+		rc = -EOPNOTSUPP;
+		goto out_dev;
+	}
 
 	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
 	if (!msg)
