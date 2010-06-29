From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:15:09 +0000
Subject: [PATCH 04/25] tty_io: remove casts from void*
Message-Id: <1277806510-30840-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Dave Young <hidave.darkstar@gmail.com>, Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/tty_io.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/char/tty_io.c b/drivers/char/tty_io.c
index d71f0fc..6ff6266 100644
--- a/drivers/char/tty_io.c
+++ b/drivers/char/tty_io.c
@@ -879,7 +879,7 @@ static ssize_t tty_read(struct file *file, char __user *buf, size_t count,
 	struct inode *inode;
 	struct tty_ldisc *ld;
 
-	tty = (struct tty_struct *)file->private_data;
+	tty = file->private_data;
 	inode = file->f_path.dentry->d_inode;
 	if (tty_paranoia_check(tty, inode, "tty_read"))
 		return -EIO;
@@ -1056,7 +1056,7 @@ static ssize_t tty_write(struct file *file, const char __user *buf,
 	ssize_t ret;
 	struct tty_ldisc *ld;
 
-	tty = (struct tty_struct *)file->private_data;
+	tty = file->private_data;
 	if (tty_paranoia_check(tty, inode, "tty_write"))
 		return -EIO;
 	if (!tty || !tty->ops->write ||
@@ -1508,7 +1508,7 @@ int tty_release(struct inode *inode, struct file *filp)
 	int	idx;
 	char	buf[64];
 
-	tty = (struct tty_struct *)filp->private_data;
+	tty = filp->private_data;
 	if (tty_paranoia_check(tty, inode, "tty_release_dev"))
 		return 0;
 
@@ -1915,7 +1915,7 @@ static unsigned int tty_poll(struct file *filp, poll_table *wait)
 	struct tty_ldisc *ld;
 	int ret = 0;
 
-	tty = (struct tty_struct *)filp->private_data;
+	tty = filp->private_data;
 	if (tty_paranoia_check(tty, filp->f_path.dentry->d_inode, "tty_poll"))
 		return 0;
 
@@ -1933,7 +1933,7 @@ static int tty_fasync(int fd, struct file *filp, int on)
 	int retval = 0;
 
 	lock_kernel();
-	tty = (struct tty_struct *)filp->private_data;
+	tty = filp->private_data;
 	if (tty_paranoia_check(tty, filp->f_path.dentry->d_inode, "tty_fasync"))
 		goto out;
 
@@ -2485,7 +2485,7 @@ long tty_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct tty_ldisc *ld;
 	struct inode *inode = file->f_dentry->d_inode;
 
-	tty = (struct tty_struct *)file->private_data;
+	tty = file->private_data;
 	if (tty_paranoia_check(tty, inode, "tty_ioctl"))
 		return -EINVAL;
 
-- 
1.7.0.4

