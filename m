From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 20:13:19 +0000
Subject: [PATCH 1/3] orangefs: Delete error messages for a failed memory allocation in five functions
Message-Id: <5ee0f84b-1149-7488-c57f-84d1dd0e65c7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6802994a-a537-2e00-e7d8-c1b822879f76@users.sourceforge.net>
In-Reply-To: <6802994a-a537-2e00-e7d8-c1b822879f76@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Brandenburg <martin@omnibond.com>, Mike Marshall <hubcap@omnibond.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 21:00:07 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/orangefs/devorangefs-req.c  |  9 +++------
 fs/orangefs/orangefs-bufmap.c  | 10 ++--------
 fs/orangefs/orangefs-debugfs.c |  1 -
 fs/orangefs/orangefs-mod.c     |  1 -
 fs/orangefs/super.c            |  4 +---
 5 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/fs/orangefs/devorangefs-req.c b/fs/orangefs/devorangefs-req.c
index c19f0787c9c6..2826859bdc2c 100644
--- a/fs/orangefs/devorangefs-req.c
+++ b/fs/orangefs/devorangefs-req.c
@@ -461,13 +461,10 @@ static ssize_t orangefs_devreq_write_iter(struct kiocb *iocb,
 	if (op->downcall.type != ORANGEFS_VFS_OP_READDIR)
 		goto wakeup;
 
-	op->downcall.trailer_buf -		vmalloc(op->downcall.trailer_size);
-	if (op->downcall.trailer_buf = NULL) {
-		gossip_err("%s: failed trailer vmalloc.\n",
-			   __func__);
+	op->downcall.trailer_buf = vmalloc(op->downcall.trailer_size);
+	if (!op->downcall.trailer_buf)
 		goto Enomem;
-	}
+
 	memset(op->downcall.trailer_buf, 0, op->downcall.trailer_size);
 	if (!copy_from_iter_full(op->downcall.trailer_buf,
 			         op->downcall.trailer_size, iter)) {
diff --git a/fs/orangefs/orangefs-bufmap.c b/fs/orangefs/orangefs-bufmap.c
index 038d67545d9f..7ef473f3d642 100644
--- a/fs/orangefs/orangefs-bufmap.c
+++ b/fs/orangefs/orangefs-bufmap.c
@@ -244,20 +244,14 @@ orangefs_bufmap_alloc(struct ORANGEFS_dev_map_desc *user_desc)
 
 	bufmap->buffer_index_array  		kzalloc(DIV_ROUND_UP(bufmap->desc_count, BITS_PER_LONG), GFP_KERNEL);
-	if (!bufmap->buffer_index_array) {
-		gossip_err("orangefs: could not allocate %d buffer indices\n",
-				bufmap->desc_count);
+	if (!bufmap->buffer_index_array)
 		goto out_free_bufmap;
-	}
 
 	bufmap->desc_array  		kcalloc(bufmap->desc_count, sizeof(struct orangefs_bufmap_desc),
 			GFP_KERNEL);
-	if (!bufmap->desc_array) {
-		gossip_err("orangefs: could not allocate %d descriptors\n",
-				bufmap->desc_count);
+	if (!bufmap->desc_array)
 		goto out_free_index_array;
-	}
 
 	bufmap->page_count = bufmap->total_size / PAGE_SIZE;
 
diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index 716ed337f166..93fe8f8e60f1 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -577,5 +577,4 @@ static int orangefs_prepare_cdm_array(char *debug_array_string)
 	if (!cdm_array) {
-		pr_info("malloc failed for cdm_array!\n");
 		rc = -ENOMEM;
 		goto out;
 	}
diff --git a/fs/orangefs/orangefs-mod.c b/fs/orangefs/orangefs-mod.c
index c1b5174cb5a9..85ef87245a87 100644
--- a/fs/orangefs/orangefs-mod.c
+++ b/fs/orangefs/orangefs-mod.c
@@ -100,5 +100,4 @@ static int __init orangefs_init(void)
 	if (!orangefs_htable_ops_in_progress) {
-		gossip_err("Failed to initialize op hashtable");
 		ret = -ENOMEM;
 		goto cleanup_inode;
 	}
diff --git a/fs/orangefs/super.c b/fs/orangefs/super.c
index 5a1bed6c8c6a..47f3fb9cbec4 100644
--- a/fs/orangefs/super.c
+++ b/fs/orangefs/super.c
@@ -107,10 +107,8 @@ static struct inode *orangefs_alloc_inode(struct super_block *sb)
 	struct orangefs_inode_s *orangefs_inode;
 
 	orangefs_inode = kmem_cache_alloc(orangefs_inode_cache, GFP_KERNEL);
-	if (orangefs_inode = NULL) {
-		gossip_err("Failed to allocate orangefs_inode\n");
+	if (!orangefs_inode)
 		return NULL;
-	}
 
 	/*
 	 * We want to clear everything except for rw_semaphore and the
-- 
2.14.0

