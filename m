From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Oct 2020 08:00:59 +0000
Subject: [PATCH 1/2 net] devlink: Fix some error codes
Message-Id: <20201026080059.GA1628785@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@nvidia.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

These paths don't set the error codes.  It's especially important in
devlink_nl_region_notify_build() where it leads to a NULL dereference in
the caller.

Fixes: 544e7c33ec2f ("net: devlink: Add support for port regions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/core/devlink.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index a578634052a3..925da7c0fcf3 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -4213,10 +4213,12 @@ static int devlink_nl_region_fill(struct sk_buff *msg, struct devlink *devlink,
 	if (err)
 		goto nla_put_failure;
 
-	if (region->port)
-		if (nla_put_u32(msg, DEVLINK_ATTR_PORT_INDEX,
-				region->port->index))
+	if (region->port) {
+		err = nla_put_u32(msg, DEVLINK_ATTR_PORT_INDEX,
+				  region->port->index);
+		if (err)
 			goto nla_put_failure;
+	}
 
 	err = nla_put_string(msg, DEVLINK_ATTR_REGION_NAME, region->ops->name);
 	if (err)
@@ -4265,10 +4267,12 @@ devlink_nl_region_notify_build(struct devlink_region *region,
 	if (err)
 		goto out_cancel_msg;
 
-	if (region->port)
-		if (nla_put_u32(msg, DEVLINK_ATTR_PORT_INDEX,
-				region->port->index))
+	if (region->port) {
+		err = nla_put_u32(msg, DEVLINK_ATTR_PORT_INDEX,
+				  region->port->index);
+		if (err)
 			goto out_cancel_msg;
+	}
 
 	err = nla_put_string(msg, DEVLINK_ATTR_REGION_NAME,
 			     region->ops->name);
@@ -4962,10 +4966,12 @@ static int devlink_nl_cmd_region_read_dumpit(struct sk_buff *skb,
 	if (err)
 		goto nla_put_failure;
 
-	if (region->port)
-		if (nla_put_u32(skb, DEVLINK_ATTR_PORT_INDEX,
-				region->port->index))
+	if (region->port) {
+		err = nla_put_u32(skb, DEVLINK_ATTR_PORT_INDEX,
+				  region->port->index);
+		if (err)
 			goto nla_put_failure;
+	}
 
 	err = nla_put_string(skb, DEVLINK_ATTR_REGION_NAME, region_name);
 	if (err)
-- 
2.28.0
