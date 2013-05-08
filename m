From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 May 2013 21:03:31 +0000
Subject: [patch] [SCSI] pm80xx: missing break statement in mpi_sata_completion()
Message-Id: <20130508210331.GA17961@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xjtuwjp@gmail.com
Cc: lindar_liu@usish.com, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch discovered a missing break statement here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index 670998a..6c0470e 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -2021,6 +2021,7 @@ mpi_sata_completion(struct pm8001_hba_info *pm8001_ha, void *piomb)
 		ts->resp = SAS_TASK_COMPLETE;
 		ts->stat = SAS_OPEN_REJECT;
 		ts->open_rej_reason = SAS_OREJ_RSVD_RETRY;
+		break;
 	default:
 		PM8001_IO_DBG(pm8001_ha,
 			pm8001_printk("Unknown status 0x%x\n", status));
