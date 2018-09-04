From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 04 Sep 2018 03:31:07 +0000
Subject: [PATCH -next] scsi: libfc: remove set but not used variable 'rpriv'
Message-Id: <1536031867-65592-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/libfc/fc_fcp.c: In function 'fc_queuecommand':
drivers/scsi/libfc/fc_fcp.c:1875:30: warning:
 variable 'rpriv' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/libfc/fc_fcp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/libfc/fc_fcp.c b/drivers/scsi/libfc/fc_fcp.c
index 563247d..b1bd283 100644
--- a/drivers/scsi/libfc/fc_fcp.c
+++ b/drivers/scsi/libfc/fc_fcp.c
@@ -1872,7 +1872,6 @@ int fc_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *sc_cmd)
 	struct fc_lport *lport = shost_priv(shost);
 	struct fc_rport *rport = starget_to_rport(scsi_target(sc_cmd->device));
 	struct fc_fcp_pkt *fsp;
-	struct fc_rport_libfc_priv *rpriv;
 	int rval;
 	int rc = 0;
 	struct fc_stats *stats;
@@ -1894,8 +1893,6 @@ int fc_queuecommand(struct Scsi_Host *shost, struct scsi_cmnd *sc_cmd)
 		goto out;
 	}
 
-	rpriv = rport->dd_data;
-
 	if (!fc_fcp_lport_queue_ready(lport)) {
 		if (lport->qfull) {
 			if (fc_fcp_can_queue_ramp_down(lport))
