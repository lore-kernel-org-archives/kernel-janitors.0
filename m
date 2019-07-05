From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jul 2019 19:15:31 +0000
Subject: [PATCH] nvme: One function call less in nvme_update_disk_info()
Message-Id: <38f864df-9c90-31a3-d78d-7aaf2d726e4f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 21:08:12 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/nvme/host/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index b2dd4e391f5c..73888195bdb2 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1650,10 +1650,7 @@ static void nvme_update_disk_info(struct gendisk *disk,
 	nvme_config_discard(disk, ns);
 	nvme_config_write_zeroes(disk, ns);

-	if (id->nsattr & (1 << 0))
-		set_disk_ro(disk, true);
-	else
-		set_disk_ro(disk, false);
+	set_disk_ro(disk, id->nsattr & (1 << 0) ? true : false);

 	blk_mq_unfreeze_queue(disk->queue);
 }
--
2.22.0
