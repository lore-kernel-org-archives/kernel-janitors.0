From: Colin King <colin.king@canonical.com>
Date: Mon, 05 Jun 2017 17:29:58 +0000
Subject: [PATCH][scsi-next] scsi: qla2xxx: remove redundant null check on tgt
Message-Id: <20170605172958.12844-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qla2xxx-upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An earlier commit ed7fb808477b846bb2 ("scsi: qla2xxx: Remove
redundant wait when target is stopped.") removed a null check
on ha->tgt.tgt_ops and replaced it with a new check that null
checked tgt, thus making the subsequent null check on tgt
totally redundant. Remove it.

Detected by CoverityScan, CID#1440452 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qla2xxx/qla_target.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/scsi/qla2xxx/qla_target.c b/drivers/scsi/qla2xxx/qla_target.c
index cb33ca87ca37..3594a76f6155 100644
--- a/drivers/scsi/qla2xxx/qla_target.c
+++ b/drivers/scsi/qla2xxx/qla_target.c
@@ -5519,12 +5519,6 @@ void qlt_async_event(uint16_t code, struct scsi_qla_host *vha,
 	if (!tgt || tgt->tgt_stop || tgt->tgt_stopped)
 		return;
 
-	if (unlikely(tgt = NULL)) {
-		ql_dbg(ql_dbg_tgt, vha, 0xe03a,
-		    "ASYNC EVENT %#x, but no tgt (ha %p)\n", code, ha);
-		return;
-	}
-
 	if (((code = MBA_POINT_TO_POINT) || (code = MBA_CHG_IN_CONNECTION)) &&
 	    IS_QLA2100(ha))
 		return;
-- 
2.11.0

