From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jul 2016 11:06:30 +0000
Subject: [patch] mtd: maps: sa1100-flash: potential NULL dereference
Message-Id: <20160715110629.GB9258@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Frans Klaver <fransklaver@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

We check for NULL but then dereference "info->mtd" on the next line.

Fixes: 72169755cf36 ('mtd: maps: sa1100-flash: show parent device in sysfs')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 142fc3d..784c6e1 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -230,8 +230,10 @@ static struct sa_info *sa1100_setup_mtd(struct platform_device *pdev,
 
 		info->mtd = mtd_concat_create(cdev, info->num_subdev,
 					      plat->name);
-		if (info->mtd = NULL)
+		if (info->mtd = NULL) {
 			ret = -ENXIO;
+			goto err;
+		}
 	}
 	info->mtd->dev.parent = &pdev->dev;
 
