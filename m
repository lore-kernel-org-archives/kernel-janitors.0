From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 19 Aug 2012 00:11:42 +0000
Subject: [josef-btrfs:fsync-work 52/52] fs/btrfs/file.c:905:6: sparse: symbol 'update_extent_generation' was
Message-Id: <20120819001142.GA14432@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+QahgC5+KEYLbs62"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josef,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git fsync-work
head:   6792139d008f49bbadff93f06db6f8275157d2bc
commit: 6792139d008f49bbadff93f06db6f8275157d2bc [52/52] Btrfs: make fsync suck less

All sparse warnings:

  fs/btrfs/file.c:179:21: sparse: symbol 'btrfs_find_defrag_inode' was not declared. Should it be static?
+ fs/btrfs/file.c:905:6: sparse: symbol 'update_extent_generation' was not declared. Should it be static?

vim +905 fs/btrfs/file.c
   902	 * list.  Call this only on extents that actually exist, otherwise this will do
   903	 * a whole lot of work for nothing.
   904	 */
 > 905	void update_extent_generation(struct inode *inode, struct btrfs_path *path,
   906				      int slot, u64 gen)
   907	{
   908		struct btrfs_file_extent_item *fi;

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--+QahgC5+KEYLbs62
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-6792139.diff"

diff --git a/fs/btrfs/extent_map.c b/fs/btrfs/extent_map.c
index 86fbb29..1aa3d8f 100644
--- a/fs/btrfs/extent_map.c
+++ b/fs/btrfs/extent_map.c
@@ -317,7 +317,7 @@ static u64 range_end(u64 start, u64 len)
 	return start + len;
 }
 
-struct extent_map *__lookup_extent_mapping(struct extent_map_tree *tree,
+static struct extent_map *__lookup_extent_mapping(struct extent_map_tree *tree,
 					   u64 start, u64 len, int strict)
 {
 	struct extent_map *em;
diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 8acf72a..3ea526b 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -176,7 +176,7 @@ int btrfs_add_inode_defrag(struct btrfs_trans_handle *trans,
 /*
  * must be called with the defrag_inodes lock held
  */
-struct inode_defrag *btrfs_find_defrag_inode(struct btrfs_fs_info *info,
+static struct inode_defrag *btrfs_find_defrag_inode(struct btrfs_fs_info *info,
 					     u64 root, u64 ino,
 					     struct rb_node **next)
 {
@@ -902,7 +902,7 @@ static int extent_mergeable(struct extent_buffer *leaf, int slot,
  * list.  Call this only on extents that actually exist, otherwise this will do
  * a whole lot of work for nothing.
  */
-void update_extent_generation(struct inode *inode, struct btrfs_path *path,
+static void update_extent_generation(struct inode *inode, struct btrfs_path *path,
 			      int slot, u64 gen)
 {
 	struct btrfs_file_extent_item *fi;
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 3311c39..987223b 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -75,7 +75,7 @@ struct kmem_cache *btrfs_trans_handle_cachep;
 struct kmem_cache *btrfs_transaction_cachep;
 struct kmem_cache *btrfs_path_cachep;
 struct kmem_cache *btrfs_free_space_cachep;
-struct kmem_cache *btrfs_dip_cachep;
+static struct kmem_cache *btrfs_dip_cachep;
 
 #define S_SHIFT 12
 static unsigned char btrfs_type_by_mode[S_IFMT >> S_SHIFT] = {

--+QahgC5+KEYLbs62--
