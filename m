From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 08 Nov 2018 12:11:06 +0000
Subject: [PATCH] md: remove set but not used variable 'bi_rdev'
Message-Id: <1541679066-147768-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Yue Haibing <yuehaibing@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/md/md.c: In function 'md_integrity_add_rdev':
drivers/md/md.c:2149:24: warning:
 variable 'bi_rdev' set but not used [-Wunused-but-set-variable]

It not used any more after commit
  1501efadc524 ("md/raid: only permit hot-add of compatible integrity profiles")

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/md/md.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 724def2..ee04495 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -2146,14 +2146,12 @@ int md_integrity_register(struct mddev *mddev)
  */
 int md_integrity_add_rdev(struct md_rdev *rdev, struct mddev *mddev)
 {
-	struct blk_integrity *bi_rdev;
 	struct blk_integrity *bi_mddev;
 	char name[BDEVNAME_SIZE];
 
 	if (!mddev->gendisk)
 		return 0;
 
-	bi_rdev = bdev_get_integrity(rdev->bdev);
 	bi_mddev = blk_get_integrity(mddev->gendisk);
 
 	if (!bi_mddev) /* nothing to do */
