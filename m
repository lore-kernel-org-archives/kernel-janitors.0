From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Nov 2018 16:53:29 +0000
Subject: [PATCH] ufs: clean up indentation issues, replace spaces with tabs
Message-Id: <20181123165329.24323-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Dushistov <dushistov@mail.ru>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a hunk of code where spaces are used for identations, and it
off by one in an editor. Clean this up by replacing them with tabs.
Also remove one blank line.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ufs/inode.c | 87 +++++++++++++++++++++++++-------------------------
 1 file changed, 43 insertions(+), 44 deletions(-)

diff --git a/fs/ufs/inode.c b/fs/ufs/inode.c
index c843ec858cf7..c4fb99eddff4 100644
--- a/fs/ufs/inode.c
+++ b/fs/ufs/inode.c
@@ -1066,52 +1066,51 @@ static int ufs_alloc_lastblock(struct inode *inode, loff_t size)
 
 	lastpage = ufs_get_locked_page(mapping, lastfrag >>
 				       (PAGE_SHIFT - inode->i_blkbits));
-       if (IS_ERR(lastpage)) {
-               err = -EIO;
-               goto out;
-       }
-
-       end = lastfrag & ((1 << (PAGE_SHIFT - inode->i_blkbits)) - 1);
-       bh = page_buffers(lastpage);
-       for (i = 0; i < end; ++i)
-               bh = bh->b_this_page;
-
-
-       err = ufs_getfrag_block(inode, lastfrag, bh, 1);
-
-       if (unlikely(err))
-	       goto out_unlock;
-
-       if (buffer_new(bh)) {
-	       clear_buffer_new(bh);
-	       clean_bdev_bh_alias(bh);
-	       /*
-		* we do not zeroize fragment, because of
-		* if it maped to hole, it already contains zeroes
-		*/
-	       set_buffer_uptodate(bh);
-	       mark_buffer_dirty(bh);
-	       set_page_dirty(lastpage);
-       }
-
-       if (lastfrag >= UFS_IND_FRAGMENT) {
-	       end = uspi->s_fpb - ufs_fragnum(lastfrag) - 1;
-	       phys64 = bh->b_blocknr + 1;
-	       for (i = 0; i < end; ++i) {
-		       bh = sb_getblk(sb, i + phys64);
-		       lock_buffer(bh);
-		       memset(bh->b_data, 0, sb->s_blocksize);
-		       set_buffer_uptodate(bh);
-		       mark_buffer_dirty(bh);
-		       unlock_buffer(bh);
-		       sync_dirty_buffer(bh);
-		       brelse(bh);
-	       }
-       }
+	if (IS_ERR(lastpage)) {
+		err = -EIO;
+		goto out;
+	}
+
+	end = lastfrag & ((1 << (PAGE_SHIFT - inode->i_blkbits)) - 1);
+	bh = page_buffers(lastpage);
+	for (i = 0; i < end; ++i)
+		bh = bh->b_this_page;
+
+	err = ufs_getfrag_block(inode, lastfrag, bh, 1);
+
+	if (unlikely(err))
+		goto out_unlock;
+
+	if (buffer_new(bh)) {
+		clear_buffer_new(bh);
+		clean_bdev_bh_alias(bh);
+		/*
+		 * we do not zeroize fragment, because of
+		 * if it maped to hole, it already contains zeroes
+		 */
+		set_buffer_uptodate(bh);
+		mark_buffer_dirty(bh);
+		set_page_dirty(lastpage);
+	}
+
+	if (lastfrag >= UFS_IND_FRAGMENT) {
+		end = uspi->s_fpb - ufs_fragnum(lastfrag) - 1;
+		phys64 = bh->b_blocknr + 1;
+		for (i = 0; i < end; ++i) {
+			bh = sb_getblk(sb, i + phys64);
+			lock_buffer(bh);
+			memset(bh->b_data, 0, sb->s_blocksize);
+			set_buffer_uptodate(bh);
+			mark_buffer_dirty(bh);
+			unlock_buffer(bh);
+			sync_dirty_buffer(bh);
+			brelse(bh);
+		}
+	}
 out_unlock:
-       ufs_put_locked_page(lastpage);
+	ufs_put_locked_page(lastpage);
 out:
-       return err;
+	return err;
 }
 
 static void ufs_truncate_blocks(struct inode *inode)
-- 
2.19.1
