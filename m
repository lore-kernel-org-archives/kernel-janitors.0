From: JieunKim <jieun.kim4758@gmail.com>
Date: Sun, 09 Feb 2020 20:48:10 +0000
Subject: [PATCH] staging: exfat: Replace printk with pr_info
Message-Id: <20200209204810.9899-1-jieun.kim4758@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: valdis.kletnieks@vt.edu
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, JieunKim <jieun.kim4758@gmail.com>

pr_info is preferred to use than printk.
pr_info calls printk with KERN_INFO macros by itself.
---
 drivers/staging/exfat/exfat_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index b81d2a87b82e..3806036c0ef6 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -364,7 +364,7 @@ static int ffsMountVol(struct super_block *sb)
 	exfat_bdev_open(sb);
 
 	if (p_bd->sector_size < sb->s_blocksize) {
-		printk(KERN_INFO "EXFAT: mount failed - sector size %d less than blocksize %ld\n",
+		pr_info("EXFAT: mount failed - sector size %d less than blocksize %ld\n",
 		       p_bd->sector_size,  sb->s_blocksize);
 		ret = -EINVAL;
 		goto out;
-- 
2.17.1
