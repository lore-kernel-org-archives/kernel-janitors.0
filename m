From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Feb 2014 08:58:54 +0000
Subject: [patch] ext3: remove unneeded check in ext3_ordered_writepage()
Message-Id: <20140221085854.GC13185@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

We already know "ret" is zero so there is no need to do:

		if (!ret)
			ret = err;

We can just assign ret directly instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext3/inode.c b/fs/ext3/inode.c
index 384b6ebb655f..491f022c476a 100644
--- a/fs/ext3/inode.c
+++ b/fs/ext3/inode.c
@@ -1673,12 +1673,9 @@ static int ext3_ordered_writepage(struct page *page,
 	 * block_write_full_page() succeeded.  Otherwise they are unmapped,
 	 * and generally junk.
 	 */
-	if (ret = 0) {
-		err = walk_page_buffers(handle, page_bufs, 0, PAGE_CACHE_SIZE,
+	if (ret = 0)
+		ret = walk_page_buffers(handle, page_bufs, 0, PAGE_CACHE_SIZE,
 					NULL, journal_dirty_data_fn);
-		if (!ret)
-			ret = err;
-	}
 	walk_page_buffers(handle, page_bufs, 0,
 			PAGE_CACHE_SIZE, NULL, bput_one);
 	err = ext3_journal_stop(handle);
