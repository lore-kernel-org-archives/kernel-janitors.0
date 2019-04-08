From: Colin King <colin.king@canonical.com>
Date: Mon, 08 Apr 2019 08:20:14 +0000
Subject: [PATCH][next] scsi: qla2xxx: fix spelling mistake "alredy" -> "already"
Message-Id: <20190408082014.1354-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qla2xxx-upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a ql_log message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qla2xxx/qla_nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_nvme.c b/drivers/scsi/qla2xxx/qla_nvme.c
index 1ca63e80a7fe..3a6160ca9b4a 100644
--- a/drivers/scsi/qla2xxx/qla_nvme.c
+++ b/drivers/scsi/qla2xxx/qla_nvme.c
@@ -205,7 +205,7 @@ static void qla_nvme_abort_work(struct work_struct *work)
 	if (atomic_read(&sp->ref_count) = 0) {
 		WARN_ON(1);
 		ql_log(ql_log_info, fcport->vha, 0xffff,
-			"%s: command alredy aborted on sp: %p\n",
+			"%s: command already aborted on sp: %p\n",
 			__func__, sp);
 		return;
 	}
-- 
2.20.1
