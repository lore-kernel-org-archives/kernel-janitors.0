From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 22 Feb 2006 10:18:15 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/sysfs
Message-Id: <1140603496.14898.20.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38622223232460184=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38622223232460184==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this converts fs/sysfs to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/sysfs/file.c.orig	2006-02-22 10:54:07.000000000 +0100
+++ linux-2.6.16-rc4/fs/sysfs/file.c	2006-02-22 10:54:20.000000000 +0100
@@ -301,9 +301,8 @@ static int check_perm(struct inode * ino
 	/* No error? Great, allocate a buffer for the file, and store it
 	 * it in file->private_data for easy access.
 	 */
-	buffer = kmalloc(sizeof(struct sysfs_buffer),GFP_KERNEL);
+	buffer = kzalloc(sizeof(struct sysfs_buffer),GFP_KERNEL);
 	if (buffer) {
-		memset(buffer,0,sizeof(struct sysfs_buffer));
 		init_MUTEX(&buffer->sem);
 		buffer->needs_read_fill = 1;
 		buffer->ops = ops;
--- linux-2.6.16-rc4/fs/sysfs/inode.c.orig	2006-02-22 10:54:35.000000000 +0100
+++ linux-2.6.16-rc4/fs/sysfs/inode.c	2006-02-22 10:54:47.000000000 +0100
@@ -54,11 +54,10 @@ int sysfs_setattr(struct dentry * dentry
 
 	if (!sd_iattr) {
 		/* setting attributes for the first time, allocate now */
-		sd_iattr = kmalloc(sizeof(struct iattr), GFP_KERNEL);
+		sd_iattr = kzalloc(sizeof(struct iattr), GFP_KERNEL);
 		if (!sd_iattr)
 			return -ENOMEM;
 		/* assign default attributes */
-		memset(sd_iattr, 0, sizeof(struct iattr));
 		sd_iattr->ia_mode = sd->s_mode;
 		sd_iattr->ia_uid = 0;
 		sd_iattr->ia_gid = 0;



--===============38622223232460184==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38622223232460184==--
