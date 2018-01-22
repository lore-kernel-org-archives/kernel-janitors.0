From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jan 2018 10:31:19 +0000
Subject: [PATCH][next] devlink: fix memory leak on 'resource'
Message-Id: <20180122103119.4801-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arkadi Sharshevsky <arkadis@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently, if the call to devlink_resource_find returns null then
the error exit path does not free the devlink_resource 'resource'
and a memory leak occurs. Fix this by kfree'ing resource on the
error exit path.

Detected by CoverityScan, CID#1464184 ("Resource leak")

Fixes: d9f9b9a4d05f ("devlink: Add support for resource abstraction")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/core/devlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index dd7d6dd07bfb..2b6b8eebcda3 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -3181,6 +3181,7 @@ int devlink_resource_register(struct devlink *devlink,
 			resource_list = &parent_resource->resource_list;
 			resource->parent = parent_resource;
 		} else {
+			kfree(resource);
 			err = -EINVAL;
 			goto out;
 		}
-- 
2.15.1

