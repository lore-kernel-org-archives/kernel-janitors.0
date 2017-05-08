From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 07:57:39 +0000
Subject: [PATCH 2/3] block-aoe: Adjust eight checks for null pointers
Message-Id: <172bc5f6-ef1b-6c98-54ac-299c1c7247ed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <705a2cf5-90fe-ec8a-95f9-a27bccbc3f3f@users.sourceforge.net>
In-Reply-To: <705a2cf5-90fe-ec8a-95f9-a27bccbc3f3f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, "Ed L. Cashin" <ed.cashin@acm.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 09:19:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/aoe/aoeblk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
index cfcf21ec123d..a52555984e73 100644
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@ -51,7 +51,7 @@ static ssize_t aoedisk_show_mac(struct device *dev,
 	struct aoedev *d = disk->private_data;
 	struct aoetgt *t = d->targets[0];
 
-	if (t = NULL)
+	if (!t)
 		return snprintf(page, PAGE_SIZE, "none\n");
 	return snprintf(page, PAGE_SIZE, "%pm\n", t->addr);
 }
@@ -84,7 +84,7 @@ static ssize_t aoedisk_show_netif(struct device *dev,
 
 	ne = nd;
 	nd = nds;
-	if (*nd = NULL)
+	if (!*nd)
 		return snprintf(page, PAGE_SIZE, "none\n");
 	for (p = page; nd < ne; nd++)
 		p += snprintf(p, PAGE_SIZE - (p-page), "%s%s",
@@ -194,10 +194,10 @@ aoedisk_add_debugfs(struct aoedev *d)
 	struct dentry *entry;
 	char *p;
 
-	if (aoe_debugfs_dir = NULL)
+	if (!aoe_debugfs_dir)
 		return;
 	p = strchr(d->gd->disk_name, '/');
-	if (p = NULL)
+	if (!p)
 		p = d->gd->disk_name;
 	else
 		p++;
@@ -369,7 +369,7 @@ aoeblk_gdalloc(void *vp)
 		return;
 
 	gd = alloc_disk(AOE_PARTITIONS);
-	if (gd = NULL) {
+	if (!gd) {
 		pr_err("aoe: cannot allocate disk structure for %ld.%d\n",
 			d->aoemajor, d->aoeminor);
 		goto err;
@@ -377,13 +377,13 @@ aoeblk_gdalloc(void *vp)
 
 	mp = mempool_create(MIN_BUFS, mempool_alloc_slab, mempool_free_slab,
 		buf_pool_cache);
-	if (mp = NULL) {
+	if (!mp) {
 		printk(KERN_ERR "aoe: cannot allocate bufpool for %ld.%d\n",
 			d->aoemajor, d->aoeminor);
 		goto err_disk;
 	}
 	q = blk_init_queue(aoeblk_request, &d->lock);
-	if (q = NULL) {
+	if (!q) {
 		pr_err("aoe: cannot allocate block queue for %ld.%d\n",
 			d->aoemajor, d->aoeminor);
 		goto err_mempool;
@@ -452,7 +452,7 @@ aoeblk_init(void)
 	buf_pool_cache = kmem_cache_create("aoe_bufs",
 					   sizeof(struct buf),
 					   0, 0, NULL);
-	if (buf_pool_cache = NULL)
+	if (!buf_pool_cache)
 		return -ENOMEM;
 	aoe_debugfs_dir = debugfs_create_dir("aoe", NULL);
 	if (IS_ERR_OR_NULL(aoe_debugfs_dir)) {
-- 
2.12.2

