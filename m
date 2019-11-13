From: Colin King <colin.king@canonical.com>
Date: Wed, 13 Nov 2019 16:42:10 +0000
Subject: [PATCH] staging: exfat: fix indentation issue
Message-Id: <20191113164210.103586-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a declaration that requires indentation. Add in
the missing tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/exfat/exfat_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index ee3d64178069..853c6e4374a4 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -2304,7 +2304,7 @@ static int exfat_ioctl_volume_id(struct inode *dir)
 static long exfat_generic_ioctl(struct file *filp, unsigned int cmd,
 				unsigned long arg)
 {
-struct inode *inode = filp->f_path.dentry->d_inode;
+	struct inode *inode = filp->f_path.dentry->d_inode;
 #ifdef CONFIG_EXFAT_KERNEL_DEBUG
 	unsigned int flags;
 #endif /* CONFIG_EXFAT_KERNEL_DEBUG */
-- 
2.20.1
