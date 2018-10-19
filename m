From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Oct 2018 12:12:57 +0000
Subject: [PATCH -next] scsi: qedf: remove set but not used variable 'fcport'
Message-Id: <1539951177-184754-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/qedf/qedf_main.c: In function 'qedf_eh_abort':
drivers/scsi/qedf/qedf_main.c:619:21: warning:
 variable 'fcport' set but not used [-Wunused-but-set-variable]
  struct qedf_rport *fcport;

It never used since introduction in
commit 61d8658b4a43 ("scsi: qedf: Add QLogic FastLinQ offload FCoE driver framework.")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/qedf/qedf_main.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.c
index d5a4f17..04f50a3 100644
--- a/drivers/scsi/qedf/qedf_main.c
+++ b/drivers/scsi/qedf/qedf_main.c
@@ -615,8 +615,6 @@ static u32 qedf_get_login_failures(void *cookie)
 static int qedf_eh_abort(struct scsi_cmnd *sc_cmd)
 {
 	struct fc_rport *rport = starget_to_rport(scsi_target(sc_cmd->device));
-	struct fc_rport_libfc_priv *rp = rport->dd_data;
-	struct qedf_rport *fcport;
 	struct fc_lport *lport;
 	struct qedf_ctx *qedf;
 	struct qedf_ioreq *io_req;
@@ -636,8 +634,6 @@ static int qedf_eh_abort(struct scsi_cmnd *sc_cmd)
 		goto out;
 	}
 
-	fcport = (struct qedf_rport *)&rp[1];
-
 	io_req = (struct qedf_ioreq *)sc_cmd->SCp.ptr;
 	if (!io_req) {
 		QEDF_ERR(&(qedf->dbg_ctx), "io_req is NULL.\n");
