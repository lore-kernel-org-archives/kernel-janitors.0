From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Dec 2016 11:21:06 +0000
Subject: [patch] ext4: return -ENOMEM instead of success
Message-Id: <20161207112106.GB5507@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>, Tao Ma <boyu.mt@taobao.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

We should set the error code if kzalloc() fails.

Fixes: 67cf5b09a46f ("ext4: add the basic function for inline data support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index 9b67f75bdcf7..437df6a1a841 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -341,8 +341,10 @@ static int ext4_update_inline_data(handle_t *handle, struct inode *inode,
 
 	len -= EXT4_MIN_INLINE_DATA_SIZE;
 	value = kzalloc(len, GFP_NOFS);
-	if (!value)
+	if (!value) {
+		error = -ENOMEM;
 		goto out;
+	}
 
 	error = ext4_xattr_ibody_get(inode, i.name_index, i.name,
 				     value, len);
