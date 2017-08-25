From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 19:37:26 +0000
Subject: [PATCH] SCSI-sd: Delete an error message for a failed memory allocation in sd_revalidate_disk()
Message-Id: <68431300-6ceb-0c61-a0cf-e6b7b20f6a45@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, "James E. J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 21:34:44 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/scsi/sd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index bea36adeee17..1f15c31e5a8a 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3067,11 +3067,8 @@ static int sd_revalidate_disk(struct gendisk *disk)
 		goto out;
 
 	buffer = kmalloc(SD_BUF_SIZE, GFP_KERNEL);
-	if (!buffer) {
-		sd_printk(KERN_WARNING, sdkp, "sd_revalidate_disk: Memory "
-			  "allocation failure.\n");
+	if (!buffer)
 		goto out;
-	}
 
 	sd_spinup_disk(sdkp);
 
-- 
2.14.0

