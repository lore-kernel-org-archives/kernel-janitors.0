From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Feb 2018 14:03:16 +0000
Subject: [PATCH] scsi: qedf: remove redundant initialization of 'fcport'
Message-Id: <20180206140316.31453-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QLogic-Storage-Upstream@cavium.com, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer fcport is initialized with a value that is never read, it is
re-assigned a new value later on, hence the initialization is redundant
and can be removed.

Cleans up clang warning:
drivers/scsi/qedf/qedf_io.c:920:21: warning: Value stored to 'fcport'
during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qedf/qedf_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qedf/qedf_io.c b/drivers/scsi/qedf/qedf_io.c
index b15e69586a36..50a50c4249d0 100644
--- a/drivers/scsi/qedf/qedf_io.c
+++ b/drivers/scsi/qedf/qedf_io.c
@@ -917,7 +917,7 @@ qedf_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *sc_cmd)
 	struct qedf_ctx *qedf = lport_priv(lport);
 	struct fc_rport *rport = starget_to_rport(scsi_target(sc_cmd->device));
 	struct fc_rport_libfc_priv *rp = rport->dd_data;
-	struct qedf_rport *fcport = rport->dd_data;
+	struct qedf_rport *fcport;
 	struct qedf_ioreq *io_req;
 	int rc = 0;
 	int rval;
-- 
2.15.1

