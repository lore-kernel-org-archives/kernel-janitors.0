From: Colin King <colin.king@canonical.com>
Date: Wed, 03 May 2017 16:29:01 +0000
Subject: [PATCH] scsi: pmcraid: remove redundant check to see if request_size is less than zero
Message-Id: <20170503162901.3623-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The 2nd check to see if request_size is less than zero is redundant
because the first check takes error exit path on this condition. So,
since it is redundant, remove it.

Detected by CoverityScan, CID#146149 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/pmcraid.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index a4aadf5f4dc6..1cc814f1505a 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -3770,9 +3770,6 @@ static long pmcraid_ioctl_passthrough(
 			pmcraid_err("couldn't build passthrough ioadls\n");
 			goto out_free_cmd;
 		}
-	} else if (request_size < 0) {
-		rc = -EINVAL;
-		goto out_free_cmd;
 	}
 
 	/* If data is being written into the device, copy the data from user
-- 
2.11.0

