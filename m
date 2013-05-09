From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 May 2013 12:48:13 +0000
Subject: [patch] [SCSI] pm80xx: remove unneeded NULL check
Message-Id: <20130509124813.GA5132@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <518b863d.vBepQb4eXhQYEt/W%fengguang.wu@intel.com>
In-Reply-To: <518b863d.vBepQb4eXhQYEt/W%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xjtuwjp@gmail.com, Anand Kumar S <AnandKumar.Santhanam@pmcs.com>
Cc: lindar_liu@usish.com, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com

Coccinelle complains about the inconsistent NULL checking on "t".  It
turns out the check isn't needed because we verified that "t" is
non-NULL at the start of the function.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/pm8001/pm8001_hwi.c b/drivers/scsi/pm8001/pm8001_hwi.c
index 69dd49c..683df42 100644
--- a/drivers/scsi/pm8001/pm8001_hwi.c
+++ b/drivers/scsi/pm8001/pm8001_hwi.c
@@ -3740,7 +3740,7 @@ int pm8001_mpi_task_abort_resp(struct pm8001_hba_info *pm8001_ha, void *piomb)
 	pm8001_ccb_task_free(pm8001_ha, t, ccb, tag);
 	mb();
 
-	if ((pm8001_dev->id & NCQ_ABORT_ALL_FLAG) && t)	{
+	if (pm8001_dev->id & NCQ_ABORT_ALL_FLAG) {
 		pm8001_tag_free(pm8001_ha, tag);
 		sas_free_task(t);
 		/* clear the flag */
