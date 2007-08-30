From: Shaun Zinck <shaun.zinck@gmail.com>
Date: Thu, 30 Aug 2007 04:17:14 +0000
Subject: [PATCH] fs/jfs: use DIV_ROUND_UP where appropriate
Message-Id: <20070829231714.6ddfbd16@shaun>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shaggy@austin.ibm.com, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

This replaces some macros and code, which do the same thing as DIV_ROUND_UP
defined in kernel.h, to use the DIV_ROUND_UP macro.

Signed-off-by: Shaun Zinck <shaun.zinck@gmail.com>
---
diff --git a/fs/jfs/jfs_dtree.h b/fs/jfs/jfs_dtree.h
index 8561c6e..cdac2d5 100644
--- a/fs/jfs/jfs_dtree.h
+++ b/fs/jfs/jfs_dtree.h
@@ -74,7 +74,7 @@ struct idtentry {
 #define DTIHDRDATALEN	11
 
 /* compute number of slots for entry */
-#define	NDTINTERNAL(klen) ( ((4 + (klen)) + (15 - 1)) / 15 )
+#define	NDTINTERNAL(klen) (DIV_ROUND_UP((4 + (klen)), 15))
 
 
 /*
@@ -133,7 +133,7 @@ struct dir_table_slot {
 	( ((s64)((dts)->addr1)) << 32 | __le32_to_cpu((dts)->addr2) )
 
 /* compute number of slots for entry */
-#define	NDTLEAF_LEGACY(klen)	( ((2 + (klen)) + (15 - 1)) / 15 )
+#define	NDTLEAF_LEGACY(klen)	(DIV_ROUND_UP((2 + (klen)), 15))
 #define	NDTLEAF	NDTINTERNAL
 
 
diff --git a/fs/jfs/resize.c b/fs/jfs/resize.c
index 71984ee..7f24a0b 100644
--- a/fs/jfs/resize.c
+++ b/fs/jfs/resize.c
@@ -172,7 +172,7 @@ int jfs_extendfs(struct super_block *sb, s64 newLVSize, int newLogSize)
 	 */
 	t64 = ((newLVSize - newLogSize + BPERDMAP - 1) >> L2BPERDMAP)
 	    << L2BPERDMAP;
-	t32 = ((t64 + (BITSPERPAGE - 1)) / BITSPERPAGE) + 1 + 50;
+	t32 = DIV_ROUND_UP(t64, BITSPERPAGE) + 1 + 50;
 	newFSCKSize = t32 << sbi->l2nbperpage;
 	newFSCKAddress = newLogAddress - newFSCKSize;
 
