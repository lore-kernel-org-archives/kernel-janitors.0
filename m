From: Artemiy Volkov <artemiyv@acm.org>
Date: Tue, 22 Jul 2014 17:58:35 +0000
Subject: [PATCH 3/5] ext2: dir.c: Merge string literals on adjacent lines
Message-Id: <1406051917-3823-4-git-send-email-artemiyv@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch joins lines and merges quoted strings in dir.c, for use of grep-ability.

Signed-off-by: Artemiy Volkov <artemiyv@acm.org>
---
 fs/ext2/dir.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/ext2/dir.c b/fs/ext2/dir.c
index 6e1d4ab..6ab6a68 100644
--- a/fs/ext2/dir.c
+++ b/fs/ext2/dir.c
@@ -160,8 +160,8 @@ out:
 Ebadsize:
 	if (!quiet)
 		ext2_error(sb, __func__,
-			"size of directory #%lu is not a multiple "
-			"of chunk size", dir->i_ino);
+			"size of directory #%lu is not a multiple of chunk size",
+			dir->i_ino);
 	goto fail;
 Eshort:
 	error = "rec_len is smaller than minimal";
@@ -179,8 +179,8 @@ Einumber:
 	error = "inode out of bounds";
 bad_entry:
 	if (!quiet)
-		ext2_error(sb, __func__, "bad entry in directory #%lu: : %s - "
-			"offset=%lu, inode=%lu, rec_len=%d, name_len=%d",
+		ext2_error(sb, __func__,
+			"bad entry in directory #%lu: : %s - offset=%lu, inode=%lu, rec_len=%d, name_len=%d",
 			dir->i_ino, error, (page->index<<PAGE_CACHE_SHIFT)+offs,
 			(unsigned long) le32_to_cpu(p->inode),
 			rec_len, p->name_len);
@@ -189,8 +189,7 @@ Eend:
 	if (!quiet) {
 		p = (ext2_dirent *)(kaddr + offs);
 		ext2_error(sb, "ext2_check_page",
-			"entry in directory #%lu spans the page boundary"
-			"offset=%lu, inode=%lu",
+			"entry in directory #%lu spans the page boundary offset=%lu, inode=%lu",
 			dir->i_ino, (page->index<<PAGE_CACHE_SHIFT)+offs,
 			(unsigned long) le32_to_cpu(p->inode));
 	}
-- 
1.9.1

