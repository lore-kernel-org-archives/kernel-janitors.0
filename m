From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Jan 2020 05:41:25 +0000
Subject: [PATCH net-next] ethtool: fix ->reply_size() error handling
Message-Id: <20200108054125.feeckqg6xhab3wam@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Michal Kubecek <mkubecek@suse.cz>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ret < 0" comparison is never true because "ret" is still zero.

Fixes: 728480f12442 ("ethtool: default handlers for GET requests")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/ethtool/netlink.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 5d16436498ac..86b79f9bc08d 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -319,9 +319,10 @@ static int ethnl_default_doit(struct sk_buff *skb, struct genl_info *info)
 	rtnl_unlock();
 	if (ret < 0)
 		goto err_cleanup;
-	reply_len = ops->reply_size(req_info, reply_data);
+	ret = ops->reply_size(req_info, reply_data);
 	if (ret < 0)
 		goto err_cleanup;
+	reply_len = ret;
 	ret = -ENOMEM;
 	rskb = ethnl_reply_init(reply_len, req_info->dev, ops->reply_cmd,
 				ops->hdr_attr, info, &reply_payload);
@@ -555,9 +556,10 @@ static void ethnl_default_notify(struct net_device *dev, unsigned int cmd,
 	ret = ops->prepare_data(req_info, reply_data, NULL);
 	if (ret < 0)
 		goto err_cleanup;
-	reply_len = ops->reply_size(req_info, reply_data);
+	ret = ops->reply_size(req_info, reply_data);
 	if (ret < 0)
 		goto err_cleanup;
+	reply_len = ret;
 	ret = -ENOMEM;
 	skb = genlmsg_new(reply_len, GFP_KERNEL);
 	if (!skb)
-- 
2.11.0
