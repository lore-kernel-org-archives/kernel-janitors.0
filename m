From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 11 Dec 2015 16:03:26 +0000
Subject: [PATCH] logfs: constify logfs_block_ops structures
Message-Id: <1449849806-30429-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joern Engel <joern@logfs.org>
Cc: kernel-janitors@vger.kernel.org, Prasad Joshi <prasadjoshi.linux@gmail.com>, logfs@logfs.org, linux-kernel@vger.kernel.org

The logfs_block_ops structures are never modified, so declare them as
const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/logfs/logfs.h     |    4 ++--
 fs/logfs/readwrite.c |    4 ++--
 fs/logfs/segment.c   |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/logfs/logfs.h b/fs/logfs/logfs.h
index 23f961a..b710788 100644
--- a/fs/logfs/logfs.h
+++ b/fs/logfs/logfs.h
@@ -302,7 +302,7 @@ struct logfs_block {
 	struct inode *inode;
 	struct logfs_transaction *ta;
 	unsigned long alias_map[LOGFS_BLOCK_FACTOR / BITS_PER_LONG];
-	struct logfs_block_ops *ops;
+	const struct logfs_block_ops *ops;
 	int full;
 	int partial;
 	int reserved_bytes;
@@ -579,7 +579,7 @@ int logfs_exist_block(struct inode *inode, u64 bix);
 int get_page_reserve(struct inode *inode, struct page *page);
 void logfs_get_wblocks(struct super_block *sb, struct page *page, int lock);
 void logfs_put_wblocks(struct super_block *sb, struct page *page, int lock);
-extern struct logfs_block_ops indirect_block_ops;
+extern const struct logfs_block_ops indirect_block_ops;
 
 /* segment.c */
 int logfs_erase_segment(struct super_block *sb, u32 ofs, int ensure_erase);
diff --git a/fs/logfs/readwrite.c b/fs/logfs/readwrite.c
index 380d86e..20973c9 100644
--- a/fs/logfs/readwrite.c
+++ b/fs/logfs/readwrite.c
@@ -569,13 +569,13 @@ static void indirect_free_block(struct super_block *sb,
 }
 
 
-static struct logfs_block_ops inode_block_ops = {
+static const struct logfs_block_ops inode_block_ops = {
 	.write_block = inode_write_block,
 	.free_block = inode_free_block,
 	.write_alias = inode_write_alias,
 };
 
-struct logfs_block_ops indirect_block_ops = {
+const struct logfs_block_ops indirect_block_ops = {
 	.write_block = indirect_write_block,
 	.free_block = indirect_free_block,
 	.write_alias = indirect_write_alias,
diff --git a/fs/logfs/segment.c b/fs/logfs/segment.c
index 6de0fbf..d270e4b 100644
--- a/fs/logfs/segment.c
+++ b/fs/logfs/segment.c
@@ -197,7 +197,7 @@ static int btree_write_alias(struct super_block *sb, struct logfs_block *block,
 	return 0;
 }
 
-static struct logfs_block_ops btree_block_ops = {
+static const struct logfs_block_ops btree_block_ops = {
 	.write_block	= btree_write_block,
 	.free_block	= __free_block,
 	.write_alias	= btree_write_alias,

