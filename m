From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:28 +0000
Subject: [PATCH 35/39] GFS2: drop null test before destroy functions
Message-Id: <1442146532-9100-36-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Whitehouse <swhiteho@redhat.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/gfs2/main.c |   29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index 241a399..4d78c3e 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -192,28 +192,13 @@ fail:
 fail_lru:
 	unregister_shrinker(&gfs2_qd_shrinker);
 	gfs2_glock_exit();
-
-	if (gfs2_rsrv_cachep)
-		kmem_cache_destroy(gfs2_rsrv_cachep);
-
-	if (gfs2_quotad_cachep)
-		kmem_cache_destroy(gfs2_quotad_cachep);
-
-	if (gfs2_rgrpd_cachep)
-		kmem_cache_destroy(gfs2_rgrpd_cachep);
-
-	if (gfs2_bufdata_cachep)
-		kmem_cache_destroy(gfs2_bufdata_cachep);
-
-	if (gfs2_inode_cachep)
-		kmem_cache_destroy(gfs2_inode_cachep);
-
-	if (gfs2_glock_aspace_cachep)
-		kmem_cache_destroy(gfs2_glock_aspace_cachep);
-
-	if (gfs2_glock_cachep)
-		kmem_cache_destroy(gfs2_glock_cachep);
-
+	kmem_cache_destroy(gfs2_rsrv_cachep);
+	kmem_cache_destroy(gfs2_quotad_cachep);
+	kmem_cache_destroy(gfs2_rgrpd_cachep);
+	kmem_cache_destroy(gfs2_bufdata_cachep);
+	kmem_cache_destroy(gfs2_inode_cachep);
+	kmem_cache_destroy(gfs2_glock_aspace_cachep);
+	kmem_cache_destroy(gfs2_glock_cachep);
 	gfs2_sys_uninit();
 	return error;
 }

