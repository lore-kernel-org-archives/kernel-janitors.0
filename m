From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jan 2018 03:27:42 +0000
Subject: [PATCH net-next] devlink: Make some functions static
Message-Id: <1516159662-109725-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

net/core/devlink.c:2297:25: warning:
 symbol 'devlink_resource_find' was not declared. Should it be static?
net/core/devlink.c:2322:6: warning:
 symbol 'devlink_resource_validate_children' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/core/devlink.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index dd7d6dd..66d3670 100644
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
@@ -2319,7 +2319,8 @@ struct devlink_resource *
 	return NULL;
 }
 
-void devlink_resource_validate_children(struct devlink_resource *resource)
+static void
+devlink_resource_validate_children(struct devlink_resource *resource)
 {
 	struct devlink_resource *child_resource;
 	bool size_valid = true;

