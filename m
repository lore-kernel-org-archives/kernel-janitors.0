From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Jan 2014 05:28:26 +0000
Subject: [patch] f2fs: checking for IS_ERR() instead of NULL
Message-Id: <20140109052825.GB1265@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

grab_cache_page_write_begin() returns NULL on error, it doesn't return
error pointers.

Fixes: e18c65b2ac91 ('f2fs: key functions to handle inline data')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 69a923e38f0c..e0d800a1d79f 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -131,8 +131,8 @@ int f2fs_convert_inline_data(struct inode *inode, pgoff_t to_size)
 		return 0;
 
 	page = grab_cache_page_write_begin(inode->i_mapping, 0, AOP_FLAG_NOFS);
-	if (IS_ERR(page))
-		return PTR_ERR(page);
+	if (!page)
+		return -ENOMEM;
 
 	err = __f2fs_convert_inline_data(inode, page);
 	f2fs_put_page(page, 1);
