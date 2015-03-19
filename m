From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Mar 2015 10:18:59 +0000
Subject: [patch] vfs: remove an unneeded condition in show_vfsstat()
Message-Id: <20150319101859.GB13330@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, "Dmitry V. Levin" <ldv@altlinux.org>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that "err" is always zero here.  This check is
not needed after we applied 9d4d65748a5c ('vfs: make mounts and
mountstats honor root dir like mountinfo does').

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
index 8db932d..97540a7 100644
--- a/fs/proc_namespace.c
+++ b/fs/proc_namespace.c
@@ -219,8 +219,7 @@ static int show_vfsstat(struct seq_file *m, struct vfsmount *mnt)
 	/* optional statistics */
 	if (sb->s_op->show_stats) {
 		seq_putc(m, ' ');
-		if (!err)
-			err = sb->s_op->show_stats(m, mnt_path.dentry);
+		err = sb->s_op->show_stats(m, mnt_path.dentry);
 	}
 
 	seq_putc(m, '\n');
