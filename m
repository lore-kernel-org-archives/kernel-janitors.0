From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:57:06 +0000
Subject: [PATCH] scsi: pm80xx: fix spelling mistake "to" -> "too"
Message-Id: <20200123005706.2834281-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180526144218.9891-1-colin.king@canonical.com>
In-Reply-To: <20180526144218.9891-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Wang <jinpu.wang@cloud.ionos.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pm8001_printk message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/pm8001/pm80xx_hwi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index 98dcdbd146d5..d1d95f1a2c6a 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -2377,7 +2377,7 @@ mpi_sata_completion(struct pm8001_hba_info *pm8001_ha, void *piomb)
 				ts->buf_valid_size = sizeof(*resp);
 			} else
 				PM8001_IO_DBG(pm8001_ha,
-					pm8001_printk("response to large\n"));
+					pm8001_printk("response too large\n"));
 		}
 		if (pm8001_dev)
 			pm8001_dev->running_req--;
-- 
2.24.0
