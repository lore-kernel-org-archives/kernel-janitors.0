From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 10:12:34 +0000
Subject: [patch] hostfs: freeing an ERR_PTR in hostfs_fill_sb_common()
Message-Id: <20160713101234.GG29468@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Dike <jdike@addtoit.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Richard Weinberger <richard@nod.at>, user-mode-linux-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We can't pass error pointers to kfree() or it causes an oops.

Fixes: 52b209f7b848 ('get rid of hostfs_read_inode()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
index 5c57654..90e46cd 100644
--- a/fs/hostfs/hostfs_kern.c
+++ b/fs/hostfs/hostfs_kern.c
@@ -959,10 +959,11 @@ static int hostfs_fill_sb_common(struct super_block *sb, void *d, int silent)
 
 	if (S_ISLNK(root_inode->i_mode)) {
 		char *name = follow_link(host_root_path);
-		if (IS_ERR(name))
+		if (IS_ERR(name)) {
 			err = PTR_ERR(name);
-		else
-			err = read_name(root_inode, name);
+			goto out_put;
+		}
+		err = read_name(root_inode, name);
 		kfree(name);
 		if (err)
 			goto out_put;
