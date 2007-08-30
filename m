From: Andi Drebes <lists-receive@programmierforen.de>
Date: Thu, 30 Aug 2007 15:35:24 +0000
Subject: [patch 2/3] fs/cramfs/inode.c: replace hardcoded value with preprocessor constant
Message-Id: <200708301735.24734.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch removes the hardcoded value 256 in fs/cramfs/inode.c and replaces
it with CRAMFS_MAXPATHLEN.

Tested on an i386 box.
Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 5286f4e..ca6a4b5 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -361,7 +361,7 @@ static int cramfs_readdir(struct file *filp, void *dirent, filldir_t filldir)
 	if (offset & 3)
 		return -EINVAL;
 
-	buf = kmalloc(256, GFP_KERNEL);
+	buf = kmalloc(CRAMFS_MAXPATHLEN, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -375,7 +375,7 @@ static int cramfs_readdir(struct file *filp, void *dirent, filldir_t filldir)
 		int namelen, error;
 
 		mutex_lock(&read_mutex);
-		de = cramfs_read(sb, OFFSET(inode) + offset, sizeof(*de)+256);
+		de = cramfs_read(sb, OFFSET(inode) + offset, sizeof(*de)+CRAMFS_MAXPATHLEN);
 		name = (char *)(de+1);
 
 		/*
@@ -425,7 +425,7 @@ static struct dentry * cramfs_lookup(struct inode *dir, struct dentry *dentry, s
 		char *name;
 		int namelen, retval;
 
-		de = cramfs_read(dir->i_sb, OFFSET(dir) + offset, sizeof(*de)+256);
+		de = cramfs_read(dir->i_sb, OFFSET(dir) + offset, sizeof(*de)+CRAMFS_MAXPATHLEN);
 		name = (char *)(de+1);
 
 		/* Try to take advantage of sorted directories */
