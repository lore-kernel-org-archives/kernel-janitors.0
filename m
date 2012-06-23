From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 23 Jun 2012 09:14:46 +0000
Subject: [patch] hfs: copying wrong data in hfs_readdir()
Message-Id: <20120623091446.GA26923@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Miklos Szeredi <mszeredi@suse.cz>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that this is copying stack data when then intent was
to copy fd.key.  The way I have written it matches how hfsplus_readdir()
is implemented.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I tried to test this, but to reach the memcpy() you would need to make
one of the calls to filldir() fail and I don't know how to do that.  I
think that in the original code this would cause a crash when we call
hfs_find_exit()

diff --git a/fs/hfs/dir.c b/fs/hfs/dir.c
index 62fc14e..f637bd5 100644
--- a/fs/hfs/dir.c
+++ b/fs/hfs/dir.c
@@ -162,7 +162,7 @@ static int hfs_readdir(struct file *filp, void *dirent, filldir_t filldir)
 		rd->file = filp;
 		list_add(&rd->list, &HFS_I(inode)->open_dir_list);
 	}
-	memcpy(&rd->key, &fd.key, sizeof(struct hfs_cat_key));
+	memcpy(&rd->key, fd.key, sizeof(struct hfs_cat_key));
 out:
 	hfs_find_exit(&fd);
 	return err;
