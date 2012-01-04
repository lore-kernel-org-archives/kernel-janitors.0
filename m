From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jan 2012 07:25:22 +0000
Subject: [patch] procfs: update proc_show_options() to new API
Message-Id: <20120104072522.GG30978@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This needs to be updated to take a dentry pointer after 79744e695a "vfs:
switch ->show_options() to struct dentry *"

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/proc/inode.c b/fs/proc/inode.c
index e80cb5a..d839bfd 100644
--- a/fs/proc/inode.c
+++ b/fs/proc/inode.c
@@ -106,9 +106,9 @@ void __init proc_init_inodecache(void)
 					     init_once);
 }
 
-static int proc_show_options(struct seq_file *seq, struct vfsmount *vfs)
+static int proc_show_options(struct seq_file *seq, struct dentry *root)
 {
-	struct super_block *sb = vfs->mnt_sb;
+	struct super_block *sb = root->d_sb;
 	struct pid_namespace *pid = sb->s_fs_info;
 
 	if (pid->pid_gid)
