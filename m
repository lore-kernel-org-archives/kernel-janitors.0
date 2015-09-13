From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:29 +0000
Subject: [PATCH 36/39] jffs2: drop null test before destroy functions
Message-Id: <1442146532-9100-37-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

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
 fs/jffs2/malloc.c |   27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/fs/jffs2/malloc.c b/fs/jffs2/malloc.c
index b8fd651..ce11897 100644
--- a/fs/jffs2/malloc.c
+++ b/fs/jffs2/malloc.c
@@ -97,25 +97,16 @@ int __init jffs2_create_slab_caches(void)
 
 void jffs2_destroy_slab_caches(void)
 {
-	if(full_dnode_slab)
-		kmem_cache_destroy(full_dnode_slab);
-	if(raw_dirent_slab)
-		kmem_cache_destroy(raw_dirent_slab);
-	if(raw_inode_slab)
-		kmem_cache_destroy(raw_inode_slab);
-	if(tmp_dnode_info_slab)
-		kmem_cache_destroy(tmp_dnode_info_slab);
-	if(raw_node_ref_slab)
-		kmem_cache_destroy(raw_node_ref_slab);
-	if(node_frag_slab)
-		kmem_cache_destroy(node_frag_slab);
-	if(inode_cache_slab)
-		kmem_cache_destroy(inode_cache_slab);
+	kmem_cache_destroy(full_dnode_slab);
+	kmem_cache_destroy(raw_dirent_slab);
+	kmem_cache_destroy(raw_inode_slab);
+	kmem_cache_destroy(tmp_dnode_info_slab);
+	kmem_cache_destroy(raw_node_ref_slab);
+	kmem_cache_destroy(node_frag_slab);
+	kmem_cache_destroy(inode_cache_slab);
 #ifdef CONFIG_JFFS2_FS_XATTR
-	if (xattr_datum_cache)
-		kmem_cache_destroy(xattr_datum_cache);
-	if (xattr_ref_cache)
-		kmem_cache_destroy(xattr_ref_cache);
+	kmem_cache_destroy(xattr_datum_cache);
+	kmem_cache_destroy(xattr_ref_cache);
 #endif
 }
 

