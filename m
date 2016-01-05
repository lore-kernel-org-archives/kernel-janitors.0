From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2016 09:57:19 +0000
Subject: [patch] ext4 crypto: unlock on error in ext4_set_encryption_metadata()
Message-Id: <20160105095719.GF23619@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing unlock if ext4_journal_start() fails.

Fixes: 374431bae296 ('ext4 crypto: add ioctls to allow backup of encryption metadata')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext4/crypto_key.c b/fs/ext4/crypto_key.c
index 6e6fbcb..21fdcea 100644
--- a/fs/ext4/crypto_key.c
+++ b/fs/ext4/crypto_key.c
@@ -372,8 +372,10 @@ int ext4_set_encryption_metadata(struct inode *inode,
 
 	handle = ext4_journal_start(inode, EXT4_HT_MISC,
 				    ext4_jbd2_credits_xattr(inode));
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
+	if (IS_ERR(handle)) {
+		res = PTR_ERR(handle);
+		goto errout;
+	}
 	res = ext4_xattr_set(inode, EXT4_XATTR_INDEX_ENCRYPTION,
 			     EXT4_XATTR_NAME_ENCRYPTION_CONTEXT, ctx,
 			     sizeof(struct ext4_encryption_context), 0);
