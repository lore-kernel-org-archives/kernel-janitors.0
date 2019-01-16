From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 16 Jan 2019 10:42:59 +0000
Subject: [PATCH v4] binderfs: fix error return code in binderfs_fill_super()
Message-Id: <1547635379-63581-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547635161-62311-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547635161-62311-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, christian@brauner.io
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code -ENOMEM from the new_inode() and
d_make_root() error handling cases instead of 0, as done elsewhere in
this function.

Fixes: 849d540ddfcd ("binderfs: implement "max" mount option")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Christian Brauner <christian@brauner.io>
---
v1 -> v2: move 'ret = -ENOMEM' out of if
v2 -> v3: use correct fixes commit
v3 -> v4: add reviewed-by
---
 drivers/android/binderfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 9518e2e..e4ff4c3 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -518,6 +518,7 @@ static int binderfs_fill_super(struct super_block *sb, void *data, int silent)
 
 	sb->s_fs_info = info;
 
+	ret = -ENOMEM;
 	inode = new_inode(sb);
 	if (!inode)
 		goto err_without_dentry;
