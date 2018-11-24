From: Colin King <colin.king@canonical.com>
Date: Sat, 24 Nov 2018 12:15:51 +0000
Subject: [PATCH] net: bridge: check for a null p->dev before dereferencing it
Message-Id: <20181124121551.6942-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roopa Prabhu <roopa@cumulusnetworks.com>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>, "David S . Miller" <davem@davemloft.net>, bridge@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A recent change added a null check on p->dev after p->dev was being
dereferenced by the ns_capable check on p->dev.  Fix this by performing
the p->dev sanity check before it is dereferenced.

Detected by CoverityScan, CID#751490 ("Dereference before null check")

Fixes: a5f3ea54f3cc ("net: bridge: add support for raw sysfs port options")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/bridge/br_sysfs_if.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/bridge/br_sysfs_if.c b/net/bridge/br_sysfs_if.c
index 7c87a2fe5248..aab8aa17cccf 100644
--- a/net/bridge/br_sysfs_if.c
+++ b/net/bridge/br_sysfs_if.c
@@ -314,15 +314,15 @@ static ssize_t brport_store(struct kobject *kobj,
 	unsigned long val;
 	char *endp;
 
+	if (!p->dev || !p->br)
+		return -EINVAL;
+
 	if (!ns_capable(dev_net(p->dev)->user_ns, CAP_NET_ADMIN))
 		return -EPERM;
 
 	if (!rtnl_trylock())
 		return restart_syscall();
 
-	if (!p->dev || !p->br)
-		goto out_unlock;
-
 	if (brport_attr->store_raw) {
 		char *buf_copy;
 
-- 
2.19.1
