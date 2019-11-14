From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Nov 2019 22:15:09 +0000
Subject: [PATCH][next] staging: exfat: fix spelling mistake "maont" -> "mount"
Message-Id: <20191114221509.10728-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a kernel info message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/exfat/exfat_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 23002aefc964..b0fcdbbe4579 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -364,7 +364,7 @@ static int ffsMountVol(struct super_block *sb)
 	exfat_bdev_open(sb);
 
 	if (p_bd->sector_size < sb->s_blocksize) {
-		printk(KERN_INFO "EXFAT: maont failed - sector size %d less than blocksize %ld\n",
+		printk(KERN_INFO "EXFAT: mount failed - sector size %d less than blocksize %ld\n",
 			p_bd->sector_size,  sb->s_blocksize);
 		ret = -EINVAL;
 		goto out;
-- 
2.20.1
