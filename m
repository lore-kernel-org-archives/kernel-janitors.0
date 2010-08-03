From: Julia Lawall <julia@diku.dk>
Date: Tue, 03 Aug 2010 21:34:36 +0000
Subject: [PATCH 7/9] drivers/staging: Drop unnecessary null test
Message-Id: <Pine.LNX.4.64.1008032334160.20393@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

list_for_each_entry binds its first argument to a non-null value, and thus
any null test on the value of that argument is superfluous.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
iterator I;
expression x;
statement S;
@@

I(x,...) { <...
- if (x != NULL || ...)
  S
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/pohmelfs/config.c    |   34 ++++++++++++++++------------------
 drivers/staging/tm6000/tm6000-core.c |    6 ++----
 2 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/pohmelfs/config.c b/drivers/staging/pohmelfs/config.c
index 8c8d1c2..89279ba 100644
--- a/drivers/staging/pohmelfs/config.c
+++ b/drivers/staging/pohmelfs/config.c
@@ -301,10 +301,8 @@ static int pohmelfs_cn_dump(struct cn_msg *msg)
 
 	mutex_lock(&pohmelfs_config_lock);
 
-	list_for_each_entry(g, &pohmelfs_config_list, group_entry) {
-		if (g)
-			total_msg += g->num_entry;
-	}
+	list_for_each_entry(g, &pohmelfs_config_list, group_entry)
+		total_msg += g->num_entry;
 	if (total_msg = 0) {
 		if (pohmelfs_send_reply(err, 0, POHMELFS_NOINFO_ACK, msg, NULL))
 			err = -ENOMEM;
@@ -312,15 +310,16 @@ static int pohmelfs_cn_dump(struct cn_msg *msg)
 	}
 
 	list_for_each_entry(g, &pohmelfs_config_list, group_entry) {
-		if (g) {
-			list_for_each_entry_safe(c, tmp, &g->config_list, config_entry) {
-				struct pohmelfs_ctl *sc = &c->state.ctl;
-				if (pohmelfs_send_reply(err, total_msg - i, POHMELFS_CTLINFO_ACK, msg, sc)) {
-					err = -ENOMEM;
-					goto out_unlock;
-				}
-				i += 1;
+		list_for_each_entry_safe(c, tmp, &g->config_list,
+					 config_entry) {
+			struct pohmelfs_ctl *sc = &c->state.ctl;
+			if (pohmelfs_send_reply(err, total_msg - i,
+						POHMELFS_CTLINFO_ACK, msg,
+						sc)) {
+				err = -ENOMEM;
+				goto out_unlock;
 			}
+			i += 1;
 		}
 	}
 
@@ -354,12 +353,11 @@ static int pohmelfs_cn_flush(struct cn_msg *msg)
 		}
 	} else {
 		list_for_each_entry(g, &pohmelfs_config_list, group_entry) {
-			if (g) {
-				list_for_each_entry_safe(c, tmp, &g->config_list, config_entry) {
-					list_del(&c->config_entry);
-					g->num_entry--;
-					kfree(c);
-				}
+			list_for_each_entry_safe(c, tmp, &g->config_list,
+						 config_entry) {
+				list_del(&c->config_entry);
+				g->num_entry--;
+				kfree(c);
 			}
 		}
 	}
diff --git a/drivers/staging/tm6000/tm6000-core.c b/drivers/staging/tm6000/tm6000-core.c
index 2c38199..5d795e8 100644
--- a/drivers/staging/tm6000/tm6000-core.c
+++ b/drivers/staging/tm6000/tm6000-core.c
@@ -708,10 +708,8 @@ void tm6000_unregister_extension(struct tm6000_ops *ops)
 	struct tm6000_core *dev = NULL;
 
 	mutex_lock(&tm6000_devlist_mutex);
-	list_for_each_entry(dev, &tm6000_devlist, devlist) {
-		if (dev)
-			ops->fini(dev);
-	}
+	list_for_each_entry(dev, &tm6000_devlist, devlist)
+		ops->fini(dev);
 
 	mutex_lock(&tm6000_extension_devlist_lock);
 	printk(KERN_INFO "tm6000: Remove (%s) extension\n", ops->name);
