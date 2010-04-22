From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 10:00:52 +0000
Subject: [patch] usb: testing the wrong variable in fs_create_by_name()
Message-Id: <20100422100052.GT29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Alessio Igor Bogani <abogani@texware.it>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here.  We should be testing "*dentry" which was just
assigned instead of "dentry".  This could result in dereferencing an
ERR_PTR inside either usbfs_mkdir() or usbfs_create().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/core/inode.c b/drivers/usb/core/inode.c
index 97b40ce..4a6366a 100644
--- a/drivers/usb/core/inode.c
+++ b/drivers/usb/core/inode.c
@@ -515,13 +515,13 @@ static int fs_create_by_name (const char *name, mode_t mode,
 	*dentry = NULL;
 	mutex_lock(&parent->d_inode->i_mutex);
 	*dentry = lookup_one_len(name, parent, strlen(name));
-	if (!IS_ERR(dentry)) {
+	if (!IS_ERR(*dentry)) {
 		if ((mode & S_IFMT) = S_IFDIR)
 			error = usbfs_mkdir (parent->d_inode, *dentry, mode);
 		else 
 			error = usbfs_create (parent->d_inode, *dentry, mode);
 	} else
-		error = PTR_ERR(dentry);
+		error = PTR_ERR(*dentry);
 	mutex_unlock(&parent->d_inode->i_mutex);
 
 	return error;
