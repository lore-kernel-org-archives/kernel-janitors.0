From: Yue Haibing <yuehaibing@huawei.com>
Date: Tue, 21 Aug 2018 01:33:42 +0000
Subject: [PATCH] ufs: remove set but not used variable 'usb3'
Message-Id: <1534815222-101634-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Dushistov <dushistov@mail.ru>
Cc: Yue Haibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/ufs/super.c: In function 'ufs_statfs':
fs/ufs/super.c:1409:32: warning:
 variable 'usb3' set but not used [-Wunused-but-set-variable]
  struct ufs_super_block_third *usb3;
                                ^

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 fs/ufs/super.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index a4e07e9..6a5db06 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -1406,11 +1406,9 @@ static int ufs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	struct super_block *sb = dentry->d_sb;
 	struct ufs_sb_private_info *uspi= UFS_SB(sb)->s_uspi;
 	unsigned  flags = UFS_SB(sb)->s_flags;
-	struct ufs_super_block_third *usb3;
 	u64 id = huge_encode_dev(sb->s_bdev->bd_dev);
 
 	mutex_lock(&UFS_SB(sb)->s_lock);
-	usb3 = ubh_get_usb_third(uspi);
 	
 	if ((flags & UFS_TYPE_MASK) = UFS_TYPE_UFS2)
 		buf->f_type = UFS2_MAGIC;
