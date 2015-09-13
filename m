From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:20 +0000
Subject: [PATCH 27/39] ocfs2: drop null test before destroy functions
Message-Id: <1442146532-9100-28-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mfasheh@suse.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org

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
 fs/ocfs2/dlm/dlmlock.c   |    3 +--
 fs/ocfs2/dlm/dlmmaster.c |   16 +++++-----------
 fs/ocfs2/super.c         |   18 ++++++------------
 fs/ocfs2/uptodate.c      |    3 +--
 4 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/fs/ocfs2/uptodate.c b/fs/ocfs2/uptodate.c
index 82e17b0..78f09c7 100644
--- a/fs/ocfs2/uptodate.c
+++ b/fs/ocfs2/uptodate.c
@@ -633,6 +633,5 @@ int __init init_ocfs2_uptodate_cache(void)
 
 void exit_ocfs2_uptodate_cache(void)
 {
-	if (ocfs2_uptodate_cachep)
-		kmem_cache_destroy(ocfs2_uptodate_cachep);
+	kmem_cache_destroy(ocfs2_uptodate_cachep);
 }
diff --git a/fs/ocfs2/dlm/dlmmaster.c b/fs/ocfs2/dlm/dlmmaster.c
index 46b8b2b..eb53b98 100644
--- a/fs/ocfs2/dlm/dlmmaster.c
+++ b/fs/ocfs2/dlm/dlmmaster.c
@@ -414,8 +414,7 @@ int dlm_init_mle_cache(void)
 
 void dlm_destroy_mle_cache(void)
 {
-	if (dlm_mle_cache)
-		kmem_cache_destroy(dlm_mle_cache);
+	kmem_cache_destroy(dlm_mle_cache);
 }
 
 static void dlm_mle_release(struct kref *kref)
@@ -472,15 +471,10 @@ bail:
 
 void dlm_destroy_master_caches(void)
 {
-	if (dlm_lockname_cache) {
-		kmem_cache_destroy(dlm_lockname_cache);
-		dlm_lockname_cache = NULL;
-	}
-
-	if (dlm_lockres_cache) {
-		kmem_cache_destroy(dlm_lockres_cache);
-		dlm_lockres_cache = NULL;
-	}
+	kmem_cache_destroy(dlm_lockname_cache);
+	dlm_lockname_cache = NULL;
+	kmem_cache_destroy(dlm_lockres_cache);
+	dlm_lockres_cache = NULL;
 }
 
 static void dlm_lockres_release(struct kref *kref)
diff --git a/fs/ocfs2/dlm/dlmlock.c b/fs/ocfs2/dlm/dlmlock.c
index 66c2a49..7496231 100644
--- a/fs/ocfs2/dlm/dlmlock.c
+++ b/fs/ocfs2/dlm/dlmlock.c
@@ -77,8 +77,7 @@ int dlm_init_lock_cache(void)
 
 void dlm_destroy_lock_cache(void)
 {
-	if (dlm_lock_cache)
-		kmem_cache_destroy(dlm_lock_cache);
+	kmem_cache_destroy(dlm_lock_cache);
 }
 
 /* Tell us whether we can grant a new lock request.
diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index 2de4c8a..88396d2 100644
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -1786,12 +1786,9 @@ static int ocfs2_initialize_mem_caches(void)
 					NULL);
 	if (!ocfs2_inode_cachep || !ocfs2_dquot_cachep ||
 	    !ocfs2_qf_chunk_cachep) {
-		if (ocfs2_inode_cachep)
-			kmem_cache_destroy(ocfs2_inode_cachep);
-		if (ocfs2_dquot_cachep)
-			kmem_cache_destroy(ocfs2_dquot_cachep);
-		if (ocfs2_qf_chunk_cachep)
-			kmem_cache_destroy(ocfs2_qf_chunk_cachep);
+		kmem_cache_destroy(ocfs2_inode_cachep);
+		kmem_cache_destroy(ocfs2_dquot_cachep);
+		kmem_cache_destroy(ocfs2_qf_chunk_cachep);
 		return -ENOMEM;
 	}
 
@@ -1805,16 +1802,13 @@ static void ocfs2_free_mem_caches(void)
 	 * destroy cache.
 	 */
 	rcu_barrier();
-	if (ocfs2_inode_cachep)
-		kmem_cache_destroy(ocfs2_inode_cachep);
+	kmem_cache_destroy(ocfs2_inode_cachep);
 	ocfs2_inode_cachep = NULL;
 
-	if (ocfs2_dquot_cachep)
-		kmem_cache_destroy(ocfs2_dquot_cachep);
+	kmem_cache_destroy(ocfs2_dquot_cachep);
 	ocfs2_dquot_cachep = NULL;
 
-	if (ocfs2_qf_chunk_cachep)
-		kmem_cache_destroy(ocfs2_qf_chunk_cachep);
+	kmem_cache_destroy(ocfs2_qf_chunk_cachep);
 	ocfs2_qf_chunk_cachep = NULL;
 }
 

