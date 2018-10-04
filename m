From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 04 Oct 2018 10:51:02 +0000
Subject: [PATCH -next] scsi: lpfc: Remove set but not used variables 'tgtp'
Message-Id: <1538650262-104577-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_nodelist_data':
drivers/scsi/lpfc/lpfc_debugfs.c:553:29: warning:
 variable 'tgtp' set but not used [-Wunused-but-set-variable]

It never used since 2b65e18202fd ("scsi: lpfc: NVME Target: Add debugfs support")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/lpfc/lpfc_debugfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_debugfs.c b/drivers/scsi/lpfc/lpfc_debugfs.c
index aec5b10..0c8005b 100644
--- a/drivers/scsi/lpfc/lpfc_debugfs.c
+++ b/drivers/scsi/lpfc/lpfc_debugfs.c
@@ -550,7 +550,6 @@
 	struct lpfc_nodelist *ndlp;
 	unsigned char *statep;
 	struct nvme_fc_local_port *localport;
-	struct lpfc_nvmet_tgtport *tgtp;
 	struct nvme_fc_remote_port *nrport = NULL;
 	struct lpfc_nvme_rport *rport;
 
@@ -654,7 +653,6 @@
 			"\nOutstanding IO x%x\n",  outio);
 
 	if (phba->nvmet_support && phba->targetport && (vport = phba->pport)) {
-		tgtp = (struct lpfc_nvmet_tgtport *)phba->targetport->private;
 		len += snprintf(buf + len, size - len,
 				"\nNVME Targetport Entry ...\n");
