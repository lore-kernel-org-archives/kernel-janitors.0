From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Dec 2018 23:33:18 +0000
Subject: [PATCH][scsi-next] scsi: qla2xxx: remove unused variable status
Message-Id: <20181210233318.12779-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170605172958.12844-1-colin.king@canonical.com>
In-Reply-To: <20170605172958.12844-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: qla2xxx-upstream@qlogic.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'status' is declared but not used, remove it.

Cleans up warning:
warning: unused variable ‘status’ [-Wunused-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qla2xxx/qla_os.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index 63c47bc7ae59..db331cb5ba3c 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -1788,7 +1788,7 @@ static void qla2x00_abort_srb(struct qla_qpair *qp, srb_t *sp, const int res,
 static void
 __qla2x00_abort_all_cmds(struct qla_qpair *qp, int res)
 {
-	int cnt, status;
+	int cnt;
 	unsigned long flags;
 	srb_t *sp;
 	scsi_qla_host_t *vha = qp->vha;
-- 
2.19.1
