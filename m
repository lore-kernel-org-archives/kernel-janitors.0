From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 08 Nov 2018 12:15:47 +0000
Subject: [PATCH -next] scsi: qedi: remove set but not used variable 'conn'
Message-Id: <1541679347-156629-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/qedi/qedi_main.c: In function 'qedi_queue_cqe':
drivers/scsi/qedi/qedi_main.c:1105:21: warning:
 variable 'conn' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit
ace7f46ba5fd ("scsi: qedi: Add QLogic FastLinQ offload iSCSI driver framework.")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/qedi/qedi_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/qedi/qedi_main.c b/drivers/scsi/qedi/qedi_main.c
index 105b0e4..a2eb611 100644
--- a/drivers/scsi/qedi/qedi_main.c
+++ b/drivers/scsi/qedi/qedi_main.c
@@ -1102,7 +1102,6 @@ static int qedi_queue_cqe(struct qedi_ctx *qedi, union iscsi_cqe *cqe,
 {
 	struct qedi_work *qedi_work;
 	struct qedi_conn *q_conn;
-	struct iscsi_conn *conn;
 	struct qedi_cmd *qedi_cmd;
 	u32 iscsi_cid;
 	int rc = 0;
@@ -1115,7 +1114,6 @@ static int qedi_queue_cqe(struct qedi_ctx *qedi, union iscsi_cqe *cqe,
 			  iscsi_cid);
 		return -1;
 	}
-	conn = q_conn->cls_conn->dd_data;
 
 	switch (cqe->cqe_common.cqe_type) {
 	case ISCSI_CQE_TYPE_SOLICITED:
