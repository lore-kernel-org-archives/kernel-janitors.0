From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jun 2017 07:56:53 +0000
Subject: [PATCH] ext4: don't free an error pointer
Message-Id: <20170630075652.gsvvzybinoee2biw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>
Cc: linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

"goto out;" calls brelse(bh); which will oops on this this path where
"bh" is an error pointer.

Fixes: 2851a40a5d71 ("ext4: xattr-in-inode support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Oops.  I wrote a bug report and a patch for this...  Probably we only
need the patch.


diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index ce12c3fb7e59..f7d6845e147b 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -1305,10 +1305,8 @@ static int ext4_xattr_inode_write(handle_t *handle, struct inode *ea_inode,
 		csize = (bufsize - wsize) > blocksize ? blocksize :
 								bufsize - wsize;
 		bh = ext4_getblk(handle, ea_inode, block, 0);
-		if (IS_ERR(bh)) {
-			ret = PTR_ERR(bh);
-			goto out;
-		}
+		if (IS_ERR(bh))
+			return PTR_ERR(bh);
 		ret = ext4_journal_get_write_access(handle, bh);
 		if (ret)
 			goto out;
