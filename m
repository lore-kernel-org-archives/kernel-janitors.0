From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:32:24 +0000
Subject: [KJ] [Patch 2/12] BUG_ON() Conversion in fs/configfs/
Message-Id: <1138354344.7391.41.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20484628996390342=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20484628996390342==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/configfs/inode.c.orig	2006-01-27 01:24:58.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/configfs/inode.c	2006-01-27 01:25:10.000000000 +0100
@@ -105,8 +105,7 @@ const unsigned char * configfs_get_name(
 {
 	struct attribute * attr;
 
-	if (!sd || !sd->s_element)
-		BUG();
+	BUG_ON(!sd || !sd->s_element);
 
 	/* These always have a dentry, so use that */
 	if (sd->s_type & (CONFIGFS_DIR | CONFIGFS_ITEM_LINK))
--- linux-2.6.16-rc1-git4/fs/configfs/symlink.c.orig	2006-01-27 01:25:28.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/configfs/symlink.c	2006-01-27 01:25:46.000000000 +0100
@@ -162,8 +162,7 @@ int configfs_unlink(struct inode *dir, s
 	if (!(sd->s_type & CONFIGFS_ITEM_LINK))
 		goto out;
 
-	if (dentry->d_parent == configfs_sb->s_root)
-		BUG();
+	BUG_ON(dentry->d_parent == configfs_sb->s_root);
 
 	sl = sd->s_element;
 



--===============20484628996390342==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20484628996390342==--
