From: Andi Drebes <lists-receive@programmierforen.de>
Date: Thu, 30 Aug 2007 15:33:54 +0000
Subject: [patch 1/3] fs/cramfs/inode.c: remove unused variable
Message-Id: <200708301733.55094.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch removes a variable that is never read.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 34c9b91..5286f4e 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -148,7 +148,7 @@ static void *cramfs_read(struct super_block *sb, unsigned int offset, unsigned i
 {
 	struct address_space *mapping = sb->s_bdev->bd_inode->i_mapping;
 	struct page *pages[BLKS_PER_BUF];
-	unsigned i, blocknr, buffer, unread;
+	unsigned i, blocknr, buffer;
 	unsigned long devsize;
 	char *data;
 
@@ -175,7 +175,6 @@ static void *cramfs_read(struct super_block *sb, unsigned int offset, unsigned i
 	devsize = mapping->host->i_size >> PAGE_CACHE_SHIFT;
 
 	/* Ok, read in BLKS_PER_BUF pages completely first. */
-	unread = 0;
 	for (i = 0; i < BLKS_PER_BUF; i++) {
 		struct page *page = NULL;
 
