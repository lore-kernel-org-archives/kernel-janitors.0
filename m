From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 12 Apr 2006 14:58:37 +0000
Subject: [KJ] [Patch] cleanup inode->r_dev usage in arch/mips
Message-Id: <1144853917.7840.12.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95994116128662599=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1144790741.13849.2.camel@alice>
In-Reply-To: <1144790741.13849.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============95994116128662599==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

imajor()/iminor() should be used instead of accessing r_dev
directly. This patch cleans up arch/mips

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.17-rc1-git5/arch/mips/kernel/rtlx.c.orig	2006-04-12 13:47:29.000000000 +0200
+++ linux-2.6.17-rc1-git5/arch/mips/kernel/rtlx.c	2006-04-12 13:48:31.000000000 +0200
@@ -122,7 +122,7 @@ static int rtlx_open(struct inode *inode
 	struct rtlx_channel *chan;
 
 	/* assume only 1 device at the mo. */
-	minor = MINOR(inode->i_rdev);
+	minor = iminor(inode);
 
 	if (rtlx == NULL) {
 		struct rtlx_info **p;
@@ -151,7 +151,7 @@ static int rtlx_open(struct inode *inode
 
 static int rtlx_release(struct inode *inode, struct file *filp)
 {
-	int minor = MINOR(inode->i_rdev);
+	int minor = iminor(inode);
 
 	clear_bit(RTLX_STATE_OPENED, &rtlx->channel[minor].lx_state);
 	smp_mb__after_clear_bit();
@@ -165,7 +165,7 @@ static unsigned int rtlx_poll(struct fil
 	unsigned int mask = 0;
 	struct rtlx_channel *chan;
 
-	minor = MINOR(file->f_dentry->d_inode->i_rdev);
+	minor = iminor(file->f_dentry->d_inode);
 	chan = &rtlx->channel[minor];
 
 	poll_wait(file, &channel_wqs[minor].rt_queue, wait);
@@ -191,7 +191,7 @@ static ssize_t rtlx_read(struct file *fi
 	struct rtlx_channel *lx;
 	DECLARE_WAITQUEUE(wait, current);
 
-	minor = MINOR(file->f_dentry->d_inode->i_rdev);
+	minor = iminor(file->f_dentry->d_inode);
 	lx = &rtlx->channel[minor];
 
 	/* data available? */
@@ -251,7 +251,7 @@ static ssize_t rtlx_write(struct file *f
 	size_t fl;
 	DECLARE_WAITQUEUE(wait, current);
 
-	minor = MINOR(file->f_dentry->d_inode->i_rdev);
+	minor = iminor(file->f_dentry->d_inode);
 	rt = &rtlx->channel[minor];
 
 	/* any space left... */
--- linux-2.6.17-rc1-git5/arch/mips/kernel/vpe.c.orig	2006-04-12 13:48:38.000000000 +0200
+++ linux-2.6.17-rc1-git5/arch/mips/kernel/vpe.c	2006-04-12 13:49:11.000000000 +0200
@@ -941,7 +941,7 @@ static int vpe_open(struct inode *inode,
 	struct vpe *v;
 
 	/* assume only 1 device at the mo. */
-	if ((minor = MINOR(inode->i_rdev)) != 1) {
+	if ((minor = iminor(inode)) != 1) {
 		printk(KERN_WARNING "VPE: only vpe1 is supported\n");
 		return -ENODEV;
 	}
@@ -995,7 +995,7 @@ static int vpe_release(struct inode *ino
 	struct vpe *v;
 	Elf_Ehdr *hdr;
 
-	minor = MINOR(inode->i_rdev);
+	minor = iminor(inode);
 	if ((v = get_vpe(minor)) == NULL)
 		return -ENODEV;
 
@@ -1028,7 +1028,7 @@ static ssize_t vpe_write(struct file *fi
 	size_t ret = count;
 	struct vpe *v;
 
-	minor = MINOR(file->f_dentry->d_inode->i_rdev);
+	minor = iminor(file->f_dentry->d_inode);
 	if ((v = get_vpe(minor)) == NULL)
 		return -ENODEV;
 



--===============95994116128662599==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95994116128662599==--
