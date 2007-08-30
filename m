From: Andi Drebes <lists-receive@programmierforen.de>
Date: Thu, 30 Aug 2007 15:37:48 +0000
Subject: [patch 3/3] fs/cramfs/inode.c: remove error variable
Message-Id: <200708301737.49018.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch removes a variable from fs/cramfs/inode.c that is just used to store
a return value which is immediately read afterwards.

Tested on an i386 box.
Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 350680f..42d2cf8 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -372,7 +372,7 @@ static int cramfs_readdir(struct file *filp, void *dirent, filldir_t filldir)
 		char *name;
 		ino_t ino;
 		mode_t mode;
-		int namelen, error;
+		int namelen;
 
 		mutex_lock(&read_mutex);
 		de = cramfs_read(sb, OFFSET(inode) + offset, sizeof(*de)+CRAMFS_MAXPATHLEN);
@@ -398,8 +398,7 @@ static int cramfs_readdir(struct file *filp, void *dirent, filldir_t filldir)
 				break;
 			namelen--;
 		}
-		error = filldir(dirent, buf, namelen, offset, ino, mode >> 12);
-		if (error)
+		if(filldir(dirent, buf, namelen, offset, ino, mode >> 12))
 			break;
 
 		offset = nextoffset;
