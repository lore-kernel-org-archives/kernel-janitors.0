From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Jan 2012 08:41:09 +0000
Subject: [patch] ext4: remove an unneeded NULL check
Message-Id: <20120124084109.GC29097@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

We dereference "bh" unconditionally a couple lines down to find
"by->b_size".  This function is never called with a NULL "bh" so I have
removed the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 164c560..a4a0234 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -91,17 +91,17 @@ int __ext4_check_dir_entry(const char *function, unsigned int line,
 		return 0;
 
 	if (filp)
-		ext4_error_file(filp, function, line, bh ? bh->b_blocknr : 0,
+		ext4_error_file(filp, function, line, bh->b_blocknr,
 				"bad entry in directory: %s - offset=%u(%u), "
 				"inode=%u, rec_len=%d, name_len=%d",
-				error_msg, (unsigned) (offset%bh->b_size),
+				error_msg, (unsigned) (offset % bh->b_size),
 				offset, le32_to_cpu(de->inode),
 				rlen, de->name_len);
 	else
-		ext4_error_inode(dir, function, line, bh ? bh->b_blocknr : 0,
+		ext4_error_inode(dir, function, line, bh->b_blocknr,
 				"bad entry in directory: %s - offset=%u(%u), "
 				"inode=%u, rec_len=%d, name_len=%d",
-				error_msg, (unsigned) (offset%bh->b_size),
+				error_msg, (unsigned) (offset % bh->b_size),
 				offset, le32_to_cpu(de->inode),
 				rlen, de->name_len);
 
