From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 08 Nov 2018 02:15:15 +0000
Subject: [PATCH -next] btrfs: compression: remove set but not used variable 'tree'
Message-Id: <1541643315-109723-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/btrfs/compression.c: In function 'end_compressed_bio_write':
fs/btrfs/compression.c:232:25: warning:
 variable 'tree' set but not used [-Wunused-but-set-variable]

It not used any more after
commit 2922040236f9 ("btrfs: Remove extent_io_ops::writepage_end_io_hook")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/btrfs/compression.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index bde8d04..088570c 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -229,7 +229,6 @@ static noinline void end_compressed_writeback(struct inode *inode,
  */
 static void end_compressed_bio_write(struct bio *bio)
 {
-	struct extent_io_tree *tree;
 	struct compressed_bio *cb = bio->bi_private;
 	struct inode *inode;
 	struct page *page;
@@ -248,7 +247,6 @@ static void end_compressed_bio_write(struct bio *bio)
 	 * call back into the FS and do all the end_io operations
 	 */
 	inode = cb->inode;
-	tree = &BTRFS_I(inode)->io_tree;
 	cb->compressed_pages[0]->mapping = cb->inode->i_mapping;
 	btrfs_writepage_endio_finish_ordered(cb->compressed_pages[0],
 			cb->start, cb->start + cb->len - 1, NULL,
