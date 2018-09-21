From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Sep 2018 08:07:55 +0000
Subject: [PATCH net] devlink: double free in devlink_resource_fill()
Message-Id: <20180921080755.GA16307@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch reports that devlink_dpipe_send_and_alloc_skb() frees the skb
on error so this is a double free.  We fixed a bunch of these bugs in
commit 7fe4d6dcbcb4 ("devlink: Remove redundant free on error path") but
we accidentally overlooked this one.

Fixes: d9f9b9a4d05f ("devlink: Add support for resource abstraction")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 65fc366a78a4..8c0ed225e280 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -2592,7 +2592,7 @@ static int devlink_resource_fill(struct genl_info *info,
 	if (!nlh) {
 		err = devlink_dpipe_send_and_alloc_skb(&skb, info);
 		if (err)
-			goto err_skb_send_alloc;
+			return err;
 		goto send_done;
 	}
 	return genlmsg_reply(skb, info);
@@ -2600,7 +2600,6 @@ static int devlink_resource_fill(struct genl_info *info,
 nla_put_failure:
 	err = -EMSGSIZE;
 err_resource_put:
-err_skb_send_alloc:
 	nlmsg_free(skb);
 	return err;
 }
