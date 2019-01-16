From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 16 Jan 2019 02:55:39 +0000
Subject: [PATCH -next] binderfs: fix error return code in binderfs_fill_super()
Message-Id: <1547607664-5612-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, christian@brauner.io
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code -ENOMEM from the new_inode() and
d_make_root() error handling cases instead of 0, as done elsewhere in
this function.

Fixes: 3ad20fe393b3 ("binder: implement binderfs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/android/binderfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 9518e2e..2bf4b2b 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -519,8 +519,10 @@ static int binderfs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_fs_info = info;
 
 	inode = new_inode(sb);
-	if (!inode)
+	if (!inode) {
+		ret = -ENOMEM;
 		goto err_without_dentry;
+	}
 
 	inode->i_ino = FIRST_INODE;
 	inode->i_fop = &simple_dir_operations;
@@ -530,8 +532,10 @@ static int binderfs_fill_super(struct super_block *sb, void *data, int silent)
 	set_nlink(inode, 2);
 
 	sb->s_root = d_make_root(inode);
-	if (!sb->s_root)
+	if (!sb->s_root) {
+		ret = -ENOMEM;
 		goto err_without_dentry;
+	}
 
 	ret = binderfs_binder_ctl_create(sb);
 	if (ret)
