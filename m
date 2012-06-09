From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Jun 2012 09:11:29 +0000
Subject: [patch] eCryptfs: fix ecryptfs_privileged_open() for read only files
Message-Id: <20120609091129.GD877@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The intent here is to handle read only opens differently.  For example,
if we don't want to create the file if it doesn't exist.  The problem
here is that O_RDONLY is 0 and if (x & 0) {... is always false.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker bug, and I am not very familiar with eCryptfs.
Please review carefully.

diff --git a/fs/ecryptfs/kthread.c b/fs/ecryptfs/kthread.c
index 69f994a..d01b364 100644
--- a/fs/ecryptfs/kthread.c
+++ b/fs/ecryptfs/kthread.c
@@ -149,7 +149,7 @@ int ecryptfs_privileged_open(struct file **lower_file,
 	(*lower_file) = dentry_open(lower_dentry, lower_mnt, flags, cred);
 	if (!IS_ERR(*lower_file))
 		goto out;
-	if (flags & O_RDONLY) {
+	if (!(flags & O_RDWR)) {
 		rc = PTR_ERR((*lower_file));
 		goto out;
 	}
