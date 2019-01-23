From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Jan 2019 09:44:34 +0000
Subject: [PATCH net-next] devlink: Use after free in devlink_health_reporter_destroy()
Message-Id: <20190123094434.GB26018@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Eran Ben Elisha <eranbe@mellanox.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This calls kfree(reporter); before dereferencing reporter on the next
line when it does mutex_unlock(&reporter->devlink->lock);

Fixes: 880ee82f0313 ("devlink: Add health reporter create/destroy functionality")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/core/devlink.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 60248a53c0ad..deccce13285a 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -4223,14 +4223,16 @@ EXPORT_SYMBOL_GPL(devlink_health_reporter_create);
 void
 devlink_health_reporter_destroy(struct devlink_health_reporter *reporter)
 {
-	mutex_lock(&reporter->devlink->lock);
+	struct devlink *devlink = reporter->devlink;
+
+	mutex_lock(&devlink->lock);
 	list_del(&reporter->list);
 	devlink_health_buffers_destroy(reporter->dump_buffers_array,
 				       DEVLINK_HEALTH_SIZE_TO_BUFFERS(reporter->ops->dump_size));
 	devlink_health_buffers_destroy(reporter->diagnose_buffers_array,
 				       DEVLINK_HEALTH_SIZE_TO_BUFFERS(reporter->ops->diagnose_size));
 	kfree(reporter);
-	mutex_unlock(&reporter->devlink->lock);
+	mutex_unlock(&devlink->lock);
 }
 EXPORT_SYMBOL_GPL(devlink_health_reporter_destroy);
 
-- 
2.17.1
