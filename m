From: Colin King <colin.king@canonical.com>
Date: Sat, 20 Jan 2018 22:09:34 +0000
Subject: [PATCH] mtd: block2mtd: remove redundant initialization of 'bdev'
Message-Id: <20180120220934.21992-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer bdev is being initialized however this value is never
read as bdev is assigned an updated value from the returned
call to blkdev_get_by_path.  Remove the redundant assignment.

Cleans up clang warning:
drivers/mtd/devices/block2mtd.c:228:23: warning: Value stored to
'bdev' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/devices/block2mtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 62fd6905c648..bb0734600a07 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -225,7 +225,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 	int i;
 #endif
 	const fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
-	struct block_device *bdev = ERR_PTR(-ENODEV);
+	struct block_device *bdev;
 	struct block2mtd_dev *dev;
 	char *name;
 
-- 
2.15.1

