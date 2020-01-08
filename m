From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Jan 2020 05:39:48 +0000
Subject: [PATCH net-next] ethtool: fix a memory leak in ethnl_default_start()
Message-Id: <20200108053947.776s3sp3op6v7a6r@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Michal Kubecek <mkubecek@suse.cz>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If ethnl_default_parse() fails then we need to free a couple
memory allocations before returning.

Fixes: 728480f12442 ("ethtool: default handlers for GET requests")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/ethtool/netlink.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 4ca96c7b86b3..5d16436498ac 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -472,8 +472,8 @@ static int ethnl_default_start(struct netlink_callback *cb)
 		return -ENOMEM;
 	reply_data = kmalloc(ops->reply_data_size, GFP_KERNEL);
 	if (!reply_data) {
-		kfree(req_info);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_req_info;
 	}
 
 	ret = ethnl_default_parse(req_info, cb->nlh, sock_net(cb->skb->sk), ops,
@@ -487,7 +487,7 @@ static int ethnl_default_start(struct netlink_callback *cb)
 		req_info->dev = NULL;
 	}
 	if (ret < 0)
-		return ret;
+		goto free_reply_data;
 
 	ctx->ops = ops;
 	ctx->req_info = req_info;
@@ -496,6 +496,13 @@ static int ethnl_default_start(struct netlink_callback *cb)
 	ctx->pos_idx = 0;
 
 	return 0;
+
+free_reply_data:
+	kfree(reply_data);
+free_req_info:
+	kfree(req_info);
+
+	return ret;
 }
 
 /* default ->done() handler for GET requests */
-- 
2.11.0
