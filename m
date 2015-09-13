From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:14:55 +0000
Subject: [PATCH 02/39] nilfs2: drop null test before destroy functions
Message-Id: <1442146532-9100-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org

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
 fs/nilfs2/super.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index f47585b..c69455a 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -1405,14 +1405,10 @@ static void nilfs_destroy_cachep(void)
 	 */
 	rcu_barrier();
 
-	if (nilfs_inode_cachep)
-		kmem_cache_destroy(nilfs_inode_cachep);
-	if (nilfs_transaction_cachep)
-		kmem_cache_destroy(nilfs_transaction_cachep);
-	if (nilfs_segbuf_cachep)
-		kmem_cache_destroy(nilfs_segbuf_cachep);
-	if (nilfs_btree_path_cache)
-		kmem_cache_destroy(nilfs_btree_path_cache);
+	kmem_cache_destroy(nilfs_inode_cachep);
+	kmem_cache_destroy(nilfs_transaction_cachep);
+	kmem_cache_destroy(nilfs_segbuf_cachep);
+	kmem_cache_destroy(nilfs_btree_path_cache);
 }
 
 static int __init nilfs_init_cachep(void)

