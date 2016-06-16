From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Jun 2016 06:50:32 +0000
Subject: [patch] devlink: clean up a condition
Message-Id: <20160616065032.GB23129@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Or Gerlitz <ogerlitz@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Presumably having a _get() function implies that we also have a _set()
function but lets make it match when we're calling.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/core/devlink.c b/net/core/devlink.c
index a4f88cb..b2e592a 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -1461,7 +1461,7 @@ static int devlink_nl_cmd_eswitch_mode_set_doit(struct sk_buff *skb,
 
 	mode = nla_get_u16(info->attrs[DEVLINK_ATTR_ESWITCH_MODE]);
 
-	if (ops && ops->eswitch_mode_get)
+	if (ops && ops->eswitch_mode_set)
 		return ops->eswitch_mode_set(devlink, mode);
 	return -EOPNOTSUPP;
 }
