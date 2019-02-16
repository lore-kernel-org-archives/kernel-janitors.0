From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 16 Feb 2019 07:39:06 +0000
Subject: [PATCH -next] scsi: qedi: Remove set but not used variable 'cls_sess'
Message-Id: <20190216073906.31264-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/qedi/qedi_fw.c: In function 'qedi_tmf_resp_work':
drivers/scsi/qedi/qedi_fw.c:158:28: warning:
 variable 'cls_sess' set but not used [-Wunused-but-set-variable]

drivers/scsi/qedi/qedi_fw.c: In function 'qedi_tmf_work':
drivers/scsi/qedi/qedi_fw.c:1370:28: warning:
 variable 'cls_sess' set but not used [-Wunused-but-set-variable]

It's never used since introduction.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/qedi/qedi_fw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/scsi/qedi/qedi_fw.c b/drivers/scsi/qedi/qedi_fw.c
index e2a995a6e8e7..651c3a6b74ed 100644
--- a/drivers/scsi/qedi/qedi_fw.c
+++ b/drivers/scsi/qedi/qedi_fw.c
@@ -155,12 +155,10 @@ static void qedi_tmf_resp_work(struct work_struct *work)
 	struct iscsi_conn *conn = qedi_conn->cls_conn->dd_data;
 	struct iscsi_session *session = conn->session;
 	struct iscsi_tm_rsp *resp_hdr_ptr;
-	struct iscsi_cls_session *cls_sess;
 	int rval = 0;
 
 	set_bit(QEDI_CONN_FW_CLEANUP, &qedi_conn->flags);
 	resp_hdr_ptr =  (struct iscsi_tm_rsp *)qedi_cmd->tmf_resp_buf;
-	cls_sess = iscsi_conn_to_session(qedi_conn->cls_conn);
 
 	iscsi_block_session(session->cls_session);
 	rval = qedi_cleanup_all_io(qedi, qedi_conn, qedi_cmd->task, true);
@@ -1367,7 +1365,6 @@ static void qedi_tmf_work(struct work_struct *work)
 	struct qedi_conn *qedi_conn = qedi_cmd->conn;
 	struct qedi_ctx *qedi = qedi_conn->qedi;
 	struct iscsi_conn *conn = qedi_conn->cls_conn->dd_data;
-	struct iscsi_cls_session *cls_sess;
 	struct qedi_work_map *list_work = NULL;
 	struct iscsi_task *mtask;
 	struct qedi_cmd *cmd;
@@ -1378,7 +1375,6 @@ static void qedi_tmf_work(struct work_struct *work)
 
 	mtask = qedi_cmd->task;
 	tmf_hdr = (struct iscsi_tm *)mtask->hdr;
-	cls_sess = iscsi_conn_to_session(qedi_conn->cls_conn);
 	set_bit(QEDI_CONN_FW_CLEANUP, &qedi_conn->flags);
 
 	ctask = iscsi_itt_to_task(conn, tmf_hdr->rtt);
