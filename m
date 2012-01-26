From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Jan 2012 06:14:06 +0000
Subject: [patch] ext4: using PTR_ERR() on the wrong variable in ext4_ext_migrate()
Message-Id: <20120126061406.GB15856@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

"inode" is a valid pointer here.  "tmp_inode" was intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext4/migrate.c b/fs/ext4/migrate.c
index e7d6bb0..f39f80f 100644
--- a/fs/ext4/migrate.c
+++ b/fs/ext4/migrate.c
@@ -471,7 +471,7 @@ int ext4_ext_migrate(struct inode *inode)
 	tmp_inode = ext4_new_inode(handle, inode->i_sb->s_root->d_inode,
 				   S_IFREG, NULL, goal, owner);
 	if (IS_ERR(tmp_inode)) {
-		retval = PTR_ERR(inode);
+		retval = PTR_ERR(tmp_inode);
 		ext4_journal_stop(handle);
 		return retval;
 	}
