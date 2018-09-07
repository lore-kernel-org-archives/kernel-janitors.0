From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Sep 2018 12:25:34 +0000
Subject: [PATCH] vfs: namespace: error pointer dereference in do_remount()
Message-Id: <20180907122534.ojogke2alt3ldbom@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to check if vfs_new_fs_context() returns an error pointer.

Fixes: fd0002870b45 ("vfs: Implement a filesystem superblock creation/configuration context")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/namespace.c b/fs/namespace.c
index a240e20093e0..841517520c08 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2384,6 +2384,8 @@ static int do_remount(struct path *path, int ms_flags, int sb_flags,
 	fc = vfs_new_fs_context(path->dentry->d_sb->s_type,
 				path->dentry, sb_flags, MS_RMT_MASK,
 				FS_CONTEXT_FOR_RECONFIGURE);
+	if (IS_ERR(fc))
+		return PTR_ERR(fc);
 
 	err = parse_monolithic_mount_data(fc, data, data_size);
 	if (err < 0)
