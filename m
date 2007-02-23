From: Thomas Hisch <t.hisch@gmail.com>
Date: Fri, 23 Feb 2007 14:10:35 +0000
Subject: [KJ] [PATCH] net/core: change hlist_for_each/hlist_entry
Message-Id: <20070223141035.GA4775@unknown-00-0d-60-79-ca-00.lan>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

change occurrence of hlist_for_each/hlist_entry to hlist_for_each_entry as it
combines the previous two macros

Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
---

maybe someone can add a TODO entry to the kernel-janitors wiki about other 
such list- and hlist cleanups?? 

look at 
git grep -B4 -A4 list_entry | grep list_for_each
for possible cleanups

thx

 net/core/dev.c |   17 ++++++-----------
 1 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index cf71614..83c2f43 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -475,13 +475,11 @@ __setup("netdev=", netdev_boot_setup);
 struct net_device *__dev_get_by_name(const char *name)
 {
 	struct hlist_node *p;
+	struct net_device *dev;
 
-	hlist_for_each(p, dev_name_hash(name)) {
-		struct net_device *dev
-			= hlist_entry(p, struct net_device, name_hlist);
+	hlist_for_each_entry(dev, p, dev_name_hash(name), name_hlist)
 		if (!strncmp(dev->name, name, IFNAMSIZ))
 			return dev;
-	}
 	return NULL;
 }
 
@@ -522,13 +520,11 @@ struct net_device *dev_get_by_name(const char *name)
 struct net_device *__dev_get_by_index(int ifindex)
 {
 	struct hlist_node *p;
+	struct net_device *dev;
 
-	hlist_for_each(p, dev_index_hash(ifindex)) {
-		struct net_device *dev
-			= hlist_entry(p, struct net_device, index_hlist);
+	hlist_for_each_entry(dev, p, dev_index_hash(ifindex), index_hlist)
 		if (dev->ifindex = ifindex)
 			return dev;
-	}
 	return NULL;
 }
 
@@ -2878,6 +2874,7 @@ int register_netdevice(struct net_device *dev)
 {
 	struct hlist_head *head;
 	struct hlist_node *p;
+	struct net_device *d;
 	int ret;
 
 	BUG_ON(dev_boot_phase);
@@ -2918,9 +2915,7 @@ int register_netdevice(struct net_device *dev)
 
 	/* Check for existence of name */
 	head = dev_name_hash(dev->name);
-	hlist_for_each(p, head) {
-		struct net_device *d
-			= hlist_entry(p, struct net_device, name_hlist);
+	hlist_for_each_entry(d, p, head, name_hlist) {
 		if (!strncmp(d->name, dev->name, IFNAMSIZ)) {
 			ret = -EEXIST;
 			goto out;
-- 
1.5.0-rc2.GIT
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
