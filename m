From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 04 Mar 2009 18:33:48 +0000
Subject: [PATCH 1/3] xfs: move declaration to header file
Message-Id: <20090304183331.525.4491.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
In-Reply-To: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Blyakher <felixb@sgi.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Fix this sparse warning:
  fs/xfs/xfs_da_btree.c:1550:26: warning: symbol 'xfs_default_nameops' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 fs/xfs/xfs_da_btree.h |    1 +
 fs/xfs/xfs_dir2.c     |    2 --
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_da_btree.h b/fs/xfs/xfs_da_btree.h
index 9d5a7e8..41f27b3 100644
--- a/fs/xfs/xfs_da_btree.h
+++ b/fs/xfs/xfs_da_btree.h
@@ -268,5 +268,6 @@ xfs_daddr_t xfs_da_blkno(xfs_dabuf_t *dabuf);
 
 extern struct kmem_zone *xfs_da_state_zone;
 extern struct kmem_zone *xfs_dabuf_zone;
+extern const struct xfs_nameops xfs_default_nameops;
 
 #endif	/* __XFS_DA_BTREE_H__ */
diff --git a/fs/xfs/xfs_dir2.c b/fs/xfs/xfs_dir2.c
index 1afb122..c657bec 100644
--- a/fs/xfs/xfs_dir2.c
+++ b/fs/xfs/xfs_dir2.c
@@ -46,8 +46,6 @@
 
 struct xfs_name xfs_name_dotdot = {"..", 2};
 
-extern const struct xfs_nameops xfs_default_nameops;
-
 /*
  * ASCII case-insensitive (ie. A-Z) support for directories that was
  * used in IRIX.

