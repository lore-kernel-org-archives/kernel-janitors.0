From: Dan Carpenter <error27@gmail.com>
Date: Mon, 25 Oct 2010 04:53:27 +0000
Subject: [patch] hfsplus: fix double lock typo in ioctl
Message-Id: <20101025045326.GW5985@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@tuxera.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This was supposed to be a mutex_unlock() instead of a mutex_lock().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/hfsplus/ioctl.c b/fs/hfsplus/ioctl.c
index 5b4667e..40a85a3 100644
--- a/fs/hfsplus/ioctl.c
+++ b/fs/hfsplus/ioctl.c
@@ -92,7 +92,7 @@ static int hfsplus_ioctl_setflags(struct file *file, int __user *user_flags)
 	mark_inode_dirty(inode);
 
 out_unlock_inode:
-	mutex_lock(&inode->i_mutex);
+	mutex_unlock(&inode->i_mutex);
 out_drop_write:
 	mnt_drop_write(file->f_path.mnt);
 out:
