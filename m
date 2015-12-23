From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 23 Dec 2015 21:06:24 +0000
Subject: [PATCH] cleancache: constify cleancache_ops structure
Message-Id: <1450904784-17139-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org

The cleancache_ops structure is never modified, so declare it as const.

This also removes the __read_mostly declaration on the cleancache_ops
variable declaration, since it seems redundant with const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

Not sure that the __read_mostly change is correct.  Does it apply to the
variable, or to what the variable points to?

 drivers/xen/tmem.c         |    2 +-
 include/linux/cleancache.h |    2 +-
 mm/cleancache.c            |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/cleancache.h b/include/linux/cleancache.h
index bda5ec0b4..cb3e142 100644
--- a/include/linux/cleancache.h
+++ b/include/linux/cleancache.h
@@ -37,7 +37,7 @@ struct cleancache_ops {
 	void (*invalidate_fs)(int);
 };
 
-extern int cleancache_register_ops(struct cleancache_ops *ops);
+extern int cleancache_register_ops(const struct cleancache_ops *ops);
 extern void __cleancache_init_fs(struct super_block *);
 extern void __cleancache_init_shared_fs(struct super_block *);
 extern int  __cleancache_get_page(struct page *);
diff --git a/drivers/xen/tmem.c b/drivers/xen/tmem.c
index 945fc43..4ac2ca8 100644
--- a/drivers/xen/tmem.c
+++ b/drivers/xen/tmem.c
@@ -242,7 +242,7 @@ static int tmem_cleancache_init_shared_fs(char *uuid, size_t pagesize)
 	return xen_tmem_new_pool(shared_uuid, TMEM_POOL_SHARED, pagesize);
 }
 
-static struct cleancache_ops tmem_cleancache_ops = {
+static const struct cleancache_ops tmem_cleancache_ops = {
 	.put_page = tmem_cleancache_put_page,
 	.get_page = tmem_cleancache_get_page,
 	.invalidate_page = tmem_cleancache_flush_page,
diff --git a/mm/cleancache.c b/mm/cleancache.c
index 8fc5081..c6356d6 100644
--- a/mm/cleancache.c
+++ b/mm/cleancache.c
@@ -22,7 +22,7 @@
  * cleancache_ops is set by cleancache_register_ops to contain the pointers
  * to the cleancache "backend" implementation functions.
  */
-static struct cleancache_ops *cleancache_ops __read_mostly;
+static const struct cleancache_ops *cleancache_ops;
 
 /*
  * Counters available via /sys/kernel/debug/cleancache (if debugfs is
@@ -49,7 +49,7 @@ static void cleancache_register_ops_sb(struct super_block *sb, void *unused)
 /*
  * Register operations for cleancache. Returns 0 on success.
  */
-int cleancache_register_ops(struct cleancache_ops *ops)
+int cleancache_register_ops(const struct cleancache_ops *ops)
 {
 	if (cmpxchg(&cleancache_ops, NULL, ops))
 		return -EBUSY;

