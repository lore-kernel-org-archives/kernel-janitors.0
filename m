From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 08 Nov 2018 02:14:43 +0000
Subject: [PATCH -next] btrfs: remove set but not used variable 'tree'
Message-Id: <1541643283-109411-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/btrfs/extent_io.c: In function 'end_extent_writepage':
fs/btrfs/extent_io.c:2406:25: warning:
 variable 'tree' set but not used [-Wunused-but-set-variable]

It not used any more after
commit 2922040236f9 ("btrfs: Remove extent_io_ops::writepage_end_io_hook")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/btrfs/extent_io.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 0f8f9c0..17a15cc 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2403,11 +2403,8 @@ static int bio_readpage_error(struct bio *failed_bio, u64 phy_offset,
 void end_extent_writepage(struct page *page, int err, u64 start, u64 end)
 {
 	int uptodate = (err = 0);
-	struct extent_io_tree *tree;
 	int ret = 0;
 
-	tree = &BTRFS_I(page->mapping->host)->io_tree;
-
 	btrfs_writepage_endio_finish_ordered(page, start, end, NULL, uptodate);
 
 	if (!uptodate) {
