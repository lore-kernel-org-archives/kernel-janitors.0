From: Dan Carpenter <error27@gmail.com>
Date: Sat, 30 Jul 2011 08:25:57 +0000
Subject: [patch] ext4: add a kfree() on error i add_new_gdb()
Message-Id: <20110730082557.GB5575@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, "open list:EXT4 FILE SYSTEM" <linux-ext4@vger.kernel.org>, kernel-janitors@vger.kernel.org

We added some more error handling in b40971426a "ext4: add error
checking to calls to ext4_handle_dirty_metadata()".  But we need to
call kfree() as well to avoid a memory leak.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/ext4/resize.c b/fs/ext4/resize.c
index 6e3327d..71085df 100644
--- a/fs/ext4/resize.c
+++ b/fs/ext4/resize.c
@@ -517,6 +517,7 @@ static int add_new_gdb(handle_t *handle, struct inode *inode,
 	return err;
 
 exit_inode:
+	kfree(n_group_desc);
 	/* ext4_handle_release_buffer(handle, iloc.bh); */
 	brelse(iloc.bh);
 exit_dindj:
