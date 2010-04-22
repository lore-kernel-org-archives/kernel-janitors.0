From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 10:05:35 +0000
Subject: [patch] security: testing the wrong variable in create_by_name()
Message-Id: <20100422100506.GU29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Morris <jmorris@namei.org>
Cc: Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-security-module@vger.kernel.org

There is a typo here.  We should be testing "*dentry" instead of
"dentry".  If "*dentry" is an ERR_PTR, it gets dereferenced in either
mkdir() or create() which would cause an OOPs.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/inode.c b/security/inode.c
index c3a7938..1c812e8 100644
--- a/security/inode.c
+++ b/security/inode.c
@@ -161,13 +161,13 @@ static int create_by_name(const char *name, mode_t mode,
 
 	mutex_lock(&parent->d_inode->i_mutex);
 	*dentry = lookup_one_len(name, parent, strlen(name));
-	if (!IS_ERR(dentry)) {
+	if (!IS_ERR(*dentry)) {
 		if ((mode & S_IFMT) = S_IFDIR)
 			error = mkdir(parent->d_inode, *dentry, mode);
 		else
 			error = create(parent->d_inode, *dentry, mode);
 	} else
-		error = PTR_ERR(dentry);
+		error = PTR_ERR(*dentry);
 	mutex_unlock(&parent->d_inode->i_mutex);
 
 	return error;
