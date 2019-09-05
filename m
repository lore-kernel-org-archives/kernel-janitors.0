From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 05 Sep 2019 02:43:41 +0000
Subject: [PATCH -next] staging: exfat: Use kmemdup in exfat_symlink()
Message-Id: <20190905030047.88401-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/exfat/exfat_super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 5b5c2ca8c9aa..05fdecc3e9ea 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -2696,12 +2696,11 @@ static int exfat_symlink(struct inode *dir, struct dentry *dentry,
 	inode->i_mtime = inode->i_atime = inode->i_ctime = current_time(inode);
 	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
 
-	EXFAT_I(inode)->target = kmalloc(len+1, GFP_KERNEL);
+	EXFAT_I(inode)->target = kmemdup(target, len + 1, GFP_KERNEL);
 	if (!EXFAT_I(inode)->target) {
 		err = -ENOMEM;
 		goto out;
 	}
-	memcpy(EXFAT_I(inode)->target, target, len+1);
 
 	dentry->d_time = GET_IVERSION(dentry->d_parent->d_inode);
 	d_instantiate(dentry, inode);
