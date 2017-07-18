From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Jul 2017 09:27:02 +0000
Subject: [PATCH] ext4: silence array overflow warning
Message-Id: <20170718092702.bpk2k5qjg4cz2mqk@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

I get a static checker warning:

    fs/ext4/ext4.h:3091 ext4_set_de_type()
    error: buffer overflow 'ext4_type_by_mode' 15 <= 15

It seems unlikely that we would hit this read overflow in real life, but
it's also simple enough to make the array 16 bytes instead of 15.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 9ebde0cd632e..fbaeb441bed3 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3074,7 +3074,7 @@ extern int ext4_handle_dirty_dirent_node(handle_t *handle,
 					 struct inode *inode,
 					 struct buffer_head *bh);
 #define S_SHIFT 12
-static const unsigned char ext4_type_by_mode[S_IFMT >> S_SHIFT] = {
+static const unsigned char ext4_type_by_mode[(S_IFMT >> S_SHIFT) + 1] = {
 	[S_IFREG >> S_SHIFT]	= EXT4_FT_REG_FILE,
 	[S_IFDIR >> S_SHIFT]	= EXT4_FT_DIR,
 	[S_IFCHR >> S_SHIFT]	= EXT4_FT_CHRDEV,
