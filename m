From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jan 2018 11:23:03 +0000
Subject: [PATCH][devlink-next] devlink: make functions a couple of new functions static
Message-Id: <20180117112303.20149-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions devlink_resource_find and devlink_resource_validate_children
are local to the source and do not need to be in global scope, so make
them static.

Cleans up sparse warnings:
symbol 'devlink_resource_find' was not declared. Should it be static?
warning: symbol 'devlink_resource_validate_children' was not declared.
Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/core/devlink.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index dd7d6dd07bfb..66d36705fb9d 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -2294,7 +2294,7 @@ static int devlink_nl_cmd_dpipe_table_counters_set(struct sk_buff *skb,
 						counters_enable);
 }
 
-struct devlink_resource *
+static struct devlink_resource *
 devlink_resource_find(struct devlink *devlink,
 		      struct devlink_resource *resource, u64 resource_id)
 {
@@ -2319,7 +2319,8 @@ devlink_resource_find(struct devlink *devlink,
 	return NULL;
 }
 
-void devlink_resource_validate_children(struct devlink_resource *resource)
+static void
+devlink_resource_validate_children(struct devlink_resource *resource)
 {
 	struct devlink_resource *child_resource;
 	bool size_valid = true;
-- 
2.15.1

