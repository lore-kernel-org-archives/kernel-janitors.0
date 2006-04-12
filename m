From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 12 Apr 2006 14:58:34 +0000
Subject: [KJ] [Patch] cleanup inode->r_dev usage in
Message-Id: <1144853914.7840.10.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74706027571207345=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1144790741.13849.2.camel@alice>
In-Reply-To: <1144790741.13849.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============74706027571207345==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

imajor()/iminor() should be used instead of accessing r_dev
directly. This patch cleans up drivers/isdn/i4l/isdn_common.c

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.17-rc1-git5/drivers/isdn/i4l/isdn_common.c.orig	2006-04-12 13:51:12.000000000 +0200
+++ linux-2.6.17-rc1-git5/drivers/isdn/i4l/isdn_common.c	2006-04-12 13:52:19.000000000 +0200
@@ -1050,7 +1050,7 @@ isdn_info_update(void)
 static ssize_t
 isdn_read(struct file *file, char __user *buf, size_t count, loff_t * off)
 {
-	uint minor = MINOR(file->f_dentry->d_inode->i_rdev);
+	uint minor = iminor(file->f_dentry->d_inode);
 	int len = 0;
 	int drvidx;
 	int chidx;
@@ -1154,7 +1154,7 @@ isdn_read(struct file *file, char __user
 static ssize_t
 isdn_write(struct file *file, const char __user *buf, size_t count, loff_t * off)
 {
-	uint minor = MINOR(file->f_dentry->d_inode->i_rdev);
+	uint minor = iminor(file->f_dentry->d_inode);
 	int drvidx;
 	int chidx;
 	int retval;
@@ -1217,7 +1217,7 @@ static unsigned int
 isdn_poll(struct file *file, poll_table * wait)
 {
 	unsigned int mask = 0;
-	unsigned int minor = MINOR(file->f_dentry->d_inode->i_rdev);
+	unsigned int minor = iminor(file->f_dentry->d_inode);
 	int drvidx = isdn_minor2drv(minor - ISDN_MINOR_CTRL);
 
 	lock_kernel();
@@ -1258,7 +1258,7 @@ isdn_poll(struct file *file, poll_table 
 static int
 isdn_ioctl(struct inode *inode, struct file *file, uint cmd, ulong arg)
 {
-	uint minor = MINOR(inode->i_rdev);
+	uint minor = iminor(inode);
 	isdn_ctrl c;
 	int drvidx;
 	int chidx;
@@ -1709,7 +1709,7 @@ isdn_ioctl(struct inode *inode, struct f
 static int
 isdn_open(struct inode *ino, struct file *filep)
 {
-	uint minor = MINOR(ino->i_rdev);
+	uint minor = iminor(ino);
 	int drvidx;
 	int chidx;
 	int retval = -ENODEV;
@@ -1771,7 +1771,7 @@ isdn_open(struct inode *ino, struct file
 static int
 isdn_close(struct inode *ino, struct file *filep)
 {
-	uint minor = MINOR(ino->i_rdev);
+	uint minor = iminor(ino);
 
 	lock_kernel();
 	if (minor == ISDN_MINOR_STATUS) {



--===============74706027571207345==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74706027571207345==--
