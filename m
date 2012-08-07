From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 07 Aug 2012 16:20:15 +0000
Subject: [josef-btrfs:master 12/16] fs/btrfs/inode.c:78:19: sparse: symbol 'btrfs_dip_cachep' was not declare
Message-Id: <20120807162015.GA10779@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josef,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git master
head:   1529b67c68e0ac3123a831815c26211d801ab975
commit: 3f1d28fc7d56b5b6c77af4ca1f258dacdd508ce4 [12/16] Btrfs: use a slab for btrfs_dio_private

All sparse warnings:

+ fs/btrfs/inode.c:78:19: sparse: symbol 'btrfs_dip_cachep' was not declared. Should it be static?

vim +78 fs/btrfs/inode.c
    75	struct kmem_cache *btrfs_transaction_cachep;
    76	struct kmem_cache *btrfs_path_cachep;
    77	struct kmem_cache *btrfs_free_space_cachep;
  > 78	struct kmem_cache *btrfs_dip_cachep;
    79	
    80	#define S_SHIFT 12
    81	static unsigned char btrfs_type_by_mode[S_IFMT >> S_SHIFT] = {

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--FL5UXtIhxfXey3p5
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-3f1d28f.diff"

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 351dd3b..7ab714f 100644
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

--FL5UXtIhxfXey3p5--
