From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 23:02:48 +0000
Subject: [KJ] [PATCH] fs/proc/base.c: fix sparse warnings
Message-Id: <200503100151.18446.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24671556264163907=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24671556264163907==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk4-sparse/fs/proc/base.c
===================================================================
--- linux-2.6.11-bk4-sparse.orig/fs/proc/base.c	2005-03-10 00:32:06.000000000 +0200
+++ linux-2.6.11-bk4-sparse/fs/proc/base.c	2005-03-10 00:32:11.000000000 +0200
@@ -702,7 +702,7 @@ static struct file_operations proc_mem_o
 	.open		= mem_open,
 };
 
-static ssize_t oom_adjust_read(struct file *file, char *buf,
+static ssize_t oom_adjust_read(struct file *file, char __user *buf,
 				size_t count, loff_t *ppos)
 {
 	struct task_struct *task = proc_task(file->f_dentry->d_inode);
@@ -722,7 +722,7 @@ static ssize_t oom_adjust_read(struct fi
 	return count;
 }
 
-static ssize_t oom_adjust_write(struct file *file, const char *buf,
+static ssize_t oom_adjust_write(struct file *file, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
 	struct task_struct *task = proc_task(file->f_dentry->d_inode);
@@ -748,8 +748,8 @@ static ssize_t oom_adjust_write(struct f
 }
 
 static struct file_operations proc_oom_adjust_operations = {
-	read:		oom_adjust_read,
-	write:		oom_adjust_write,
+	.read		= oom_adjust_read,
+	.write		= oom_adjust_write,
 };
 
 static struct inode_operations proc_mem_inode_operations = {

--===============24671556264163907==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24671556264163907==--
