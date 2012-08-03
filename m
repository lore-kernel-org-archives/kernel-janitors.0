From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 03 Aug 2012 00:00:38 +0000
Subject: [josef-btrfs:own-caching 10/12] fs/btrfs/disk-io.c:822:5: sparse: symbol 'btrfs_wq_btree_submit_bio'
Message-Id: <20120803000038.GA5734@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tKW2IUtsqtDRztdT"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josef,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git own-caching
head:   c7fc403528c5a40ac1dad05296ba4835072bc03d
commit: b6579666166dc9043543fbae61ba81451aab628b [10/12] Btrfs: manage metadata cache ourselves

All sparse warnings:

+ fs/btrfs/disk-io.c:822:5: sparse: symbol 'btrfs_wq_btree_submit_bio' was not declared. Should it be static?
+ fs/btrfs/disk-io.c:921:5: sparse: symbol 'merge_bio' was not declared. Should it be static?
+ fs/btrfs/disk-io.c:1049:5: sparse: symbol 'write_iolock_eb' was not declared. Should it be static?
  fs/btrfs/disk-io.c:2805:17: sparse: incompatible types in comparison expression (different address spaces)
  fs/btrfs/disk-io.c:2980:25: sparse: incompatible types in comparison expression (different address spaces)

vim +822 fs/btrfs/disk-io.c
   819			bio_endio(async->bio, ret);
   820	}
   821	
 > 822	int btrfs_wq_btree_submit_bio(struct btrfs_root *root, int rw,
   823				      struct bio *bio, int mirror_num)
   824	{
   825		struct btrfs_fs_info *fs_info = root->fs_info;

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--tKW2IUtsqtDRztdT
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-b657966.diff"

diff --git a/fs/btrfs/delayed-inode.c b/fs/btrfs/delayed-inode.c
index 79ef7f3..e55a489 100644
--- a/fs/btrfs/delayed-inode.c
+++ b/fs/btrfs/delayed-inode.c
@@ -201,7 +201,7 @@ static void btrfs_dequeue_delayed_node(struct btrfs_delayed_root *root,
 	spin_unlock(&root->lock);
 }
 
-struct btrfs_delayed_node *btrfs_first_delayed_node(
+static struct btrfs_delayed_node *btrfs_first_delayed_node(
 			struct btrfs_delayed_root *delayed_root)
 {
 	struct list_head *p;
@@ -220,7 +220,7 @@ out:
 	return node;
 }
 
-struct btrfs_delayed_node *btrfs_next_delayed_node(
+static struct btrfs_delayed_node *btrfs_next_delayed_node(
 						struct btrfs_delayed_node *node)
 {
 	struct btrfs_delayed_root *delayed_root;
@@ -281,7 +281,7 @@ static inline void btrfs_release_delayed_node(struct btrfs_delayed_node *node)
 	__btrfs_release_delayed_node(node, 0);
 }
 
-struct btrfs_delayed_node *btrfs_first_prepared_delayed_node(
+static struct btrfs_delayed_node *btrfs_first_prepared_delayed_node(
 					struct btrfs_delayed_root *delayed_root)
 {
 	struct list_head *p;
@@ -307,7 +307,7 @@ static inline void btrfs_release_prepared_delayed_node(
 	__btrfs_release_delayed_node(node, 1);
 }
 
-struct btrfs_delayed_item *btrfs_alloc_delayed_item(u32 data_len)
+static struct btrfs_delayed_item *btrfs_alloc_delayed_item(u32 data_len)
 {
 	struct btrfs_delayed_item *item;
 	item = kmalloc(sizeof(*item) + data_len, GFP_NOFS);
@@ -382,7 +382,7 @@ static struct btrfs_delayed_item *__btrfs_lookup_delayed_item(
 	return NULL;
 }
 
-struct btrfs_delayed_item *__btrfs_lookup_delayed_insertion_item(
+static struct btrfs_delayed_item *__btrfs_lookup_delayed_insertion_item(
 					struct btrfs_delayed_node *delayed_node,
 					struct btrfs_key *key)
 {
@@ -393,7 +393,7 @@ struct btrfs_delayed_item *__btrfs_lookup_delayed_insertion_item(
 	return item;
 }
 
-struct btrfs_delayed_item *__btrfs_lookup_delayed_deletion_item(
+static struct btrfs_delayed_item *__btrfs_lookup_delayed_deletion_item(
 					struct btrfs_delayed_node *delayed_node,
 					struct btrfs_key *key)
 {
@@ -404,7 +404,7 @@ struct btrfs_delayed_item *__btrfs_lookup_delayed_deletion_item(
 	return item;
 }
 
-struct btrfs_delayed_item *__btrfs_search_delayed_insertion_item(
+static struct btrfs_delayed_item *__btrfs_search_delayed_insertion_item(
 					struct btrfs_delayed_node *delayed_node,
 					struct btrfs_key *key)
 {
@@ -418,7 +418,7 @@ struct btrfs_delayed_item *__btrfs_search_delayed_insertion_item(
 	return item;
 }
 
-struct btrfs_delayed_item *__btrfs_search_delayed_deletion_item(
+static struct btrfs_delayed_item *__btrfs_search_delayed_deletion_item(
 					struct btrfs_delayed_node *delayed_node,
 					struct btrfs_key *key)
 {
@@ -527,7 +527,7 @@ static void btrfs_release_delayed_item(struct btrfs_delayed_item *item)
 	}
 }
 
-struct btrfs_delayed_item *__btrfs_first_delayed_insertion_item(
+static struct btrfs_delayed_item *__btrfs_first_delayed_insertion_item(
 					struct btrfs_delayed_node *delayed_node)
 {
 	struct rb_node *p;
@@ -540,7 +540,7 @@ struct btrfs_delayed_item *__btrfs_first_delayed_insertion_item(
 	return item;
 }
 
-struct btrfs_delayed_item *__btrfs_first_delayed_deletion_item(
+static struct btrfs_delayed_item *__btrfs_first_delayed_deletion_item(
 					struct btrfs_delayed_node *delayed_node)
 {
 	struct rb_node *p;
@@ -553,7 +553,7 @@ struct btrfs_delayed_item *__btrfs_first_delayed_deletion_item(
 	return item;
 }
 
-struct btrfs_delayed_item *__btrfs_next_delayed_item(
+static struct btrfs_delayed_item *__btrfs_next_delayed_item(
 						struct btrfs_delayed_item *item)
 {
 	struct rb_node *p;
diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 65545ab..626a567 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -819,7 +819,7 @@ static void __btree_submit_bio_done(struct btrfs_work *work)
 		bio_endio(async->bio, ret);
 }
 
-int btrfs_wq_btree_submit_bio(struct btrfs_root *root, int rw,
+static int btrfs_wq_btree_submit_bio(struct btrfs_root *root, int rw,
 			      struct bio *bio, int mirror_num)
 {
 	struct btrfs_fs_info *fs_info = root->fs_info;
@@ -918,7 +918,7 @@ static struct bio *eb_setup_bio(struct extent_buffer *eb,
 	return bio;
 }
 
-int merge_bio(struct btrfs_root *root, size_t size, struct bio *bio)
+static int merge_bio(struct btrfs_root *root, size_t size, struct bio *bio)
 {
 	struct btrfs_mapping_tree *map_tree;
 	u64 logical = (u64)bio->bi_sector << 9;
@@ -1046,7 +1046,7 @@ out:
 }
 
 /* Returns 1 if we can write this eb out, 0 if not */
-int write_iolock_eb(struct extent_buffer *eb, int wait)
+static int write_iolock_eb(struct extent_buffer *eb, int wait)
 {
 	int ret = 0;
 
diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 6cbd8b0..6d93da3 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -463,7 +463,7 @@ alloc_extent_state_atomic(struct extent_state *prealloc)
 	return prealloc;
 }
 
-void extent_io_tree_panic(struct extent_io_tree *tree, int err)
+static void extent_io_tree_panic(struct extent_io_tree *tree, int err)
 {
 	btrfs_panic(tree_fs_info(tree), err, "Locking error: "
 		    "Extent tree was modified by another "
diff --git a/fs/btrfs/relocation.c b/fs/btrfs/relocation.c
index 0c8a18e..7df840d 100644
--- a/fs/btrfs/relocation.c
+++ b/fs/btrfs/relocation.c
@@ -326,7 +326,7 @@ static struct rb_node *tree_search(struct rb_root *root, u64 bytenr)
 	return NULL;
 }
 
-void backref_tree_panic(struct rb_node *rb_node, int errno,
+static void backref_tree_panic(struct rb_node *rb_node, int errno,
 					  u64 bytenr)
 {
 

--tKW2IUtsqtDRztdT--
