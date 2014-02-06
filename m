From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Feb 2014 12:45:50 +0000
Subject: [patch] ext4: remove an unneeded check in mext_page_mkuptodate()
Message-Id: <20140206124549.GA16998@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

"err" is zero here, there is no need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext4/move_extent.c b/fs/ext4/move_extent.c
index 773b503bd18c..f39a88abe32c 100644
--- a/fs/ext4/move_extent.c
+++ b/fs/ext4/move_extent.c
@@ -861,8 +861,7 @@ mext_page_mkuptodate(struct page *page, unsigned from, unsigned to)
 			}
 			if (!buffer_mapped(bh)) {
 				zero_user(page, block_start, blocksize);
-				if (!err)
-					set_buffer_uptodate(bh);
+				set_buffer_uptodate(bh);
 				continue;
 			}
 		}
