From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:06 +0000
Subject: [PATCH 13/39] staging: lustre: drop null test before destroy functions
Message-Id: <1442146532-9100-14-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
@@

-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);

@@
expression x;
@@

-if (x != NULL) {
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
  x = NULL;
-}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/llite/super25.c      |   16 +++-----------
 drivers/staging/lustre/lustre/obdclass/genops.c    |   24 +++++++--------------
 drivers/staging/lustre/lustre/obdclass/lu_object.c |    6 +----
 3 files changed, 14 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/lu_object.c b/drivers/staging/lustre/lustre/obdclass/lu_object.c
index 8e47232..e8101fe 100644
--- a/drivers/staging/lustre/lustre/obdclass/lu_object.c
+++ b/drivers/staging/lustre/lustre/obdclass/lu_object.c
@@ -2052,10 +2052,8 @@ EXPORT_SYMBOL(lu_kmem_init);
 void lu_kmem_fini(struct lu_kmem_descr *caches)
 {
 	for (; caches->ckd_cache != NULL; ++caches) {
-		if (*caches->ckd_cache != NULL) {
-			kmem_cache_destroy(*caches->ckd_cache);
-			*caches->ckd_cache = NULL;
-		}
+		kmem_cache_destroy(*caches->ckd_cache);
+		*caches->ckd_cache = NULL;
 	}
 }
 EXPORT_SYMBOL(lu_kmem_fini);
diff --git a/drivers/staging/lustre/lustre/obdclass/genops.c b/drivers/staging/lustre/lustre/obdclass/genops.c
index 0ca7309..ad78a04 100644
--- a/drivers/staging/lustre/lustre/obdclass/genops.c
+++ b/drivers/staging/lustre/lustre/obdclass/genops.c
@@ -638,22 +638,14 @@ EXPORT_SYMBOL(class_notify_sptlrpc_conf);
 
 void obd_cleanup_caches(void)
 {
-	if (obd_device_cachep) {
-		kmem_cache_destroy(obd_device_cachep);
-		obd_device_cachep = NULL;
-	}
-	if (obdo_cachep) {
-		kmem_cache_destroy(obdo_cachep);
-		obdo_cachep = NULL;
-	}
-	if (import_cachep) {
-		kmem_cache_destroy(import_cachep);
-		import_cachep = NULL;
-	}
-	if (capa_cachep) {
-		kmem_cache_destroy(capa_cachep);
-		capa_cachep = NULL;
-	}
+	kmem_cache_destroy(obd_device_cachep);
+	obd_device_cachep = NULL;
+	kmem_cache_destroy(obdo_cachep);
+	obdo_cachep = NULL;
+	kmem_cache_destroy(import_cachep);
+	import_cachep = NULL;
+	kmem_cache_destroy(capa_cachep);
+	capa_cachep = NULL;
 }
 
 int obd_init_caches(void)
diff --git a/drivers/staging/lustre/lustre/llite/super25.c b/drivers/staging/lustre/lustre/llite/super25.c
index e4020ce..4cf7af2 100644
--- a/drivers/staging/lustre/lustre/llite/super25.c
+++ b/drivers/staging/lustre/lustre/llite/super25.c
@@ -183,18 +183,10 @@ out_sysfs:
 out_debugfs:
 	debugfs_remove(llite_root);
 out_cache:
-	if (ll_inode_cachep != NULL)
-		kmem_cache_destroy(ll_inode_cachep);
-
-	if (ll_file_data_slab != NULL)
-		kmem_cache_destroy(ll_file_data_slab);
-
-	if (ll_remote_perm_cachep != NULL)
-		kmem_cache_destroy(ll_remote_perm_cachep);
-
-	if (ll_rmtperm_hash_cachep != NULL)
-		kmem_cache_destroy(ll_rmtperm_hash_cachep);
-
+	kmem_cache_destroy(ll_inode_cachep);
+	kmem_cache_destroy(ll_file_data_slab);
+	kmem_cache_destroy(ll_remote_perm_cachep);
+	kmem_cache_destroy(ll_rmtperm_hash_cachep);
 	return rc;
 }
 

