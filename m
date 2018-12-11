From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 11 Dec 2018 08:21:22 +0000
Subject: [PATCH -next] scsi: lpfc: Remove set but not used variable 'maxch'
Message-Id: <1544516482-195043-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_nvmestat_data':
drivers/scsi/lpfc/lpfc_debugfs.c:780:14: warning:
 variable 'maxch' set but not used [-Wunused-but-set-variable]

debugfs display buffer has be limit to 32 in below for loop,
so this can be removed safely.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/lpfc/lpfc_debugfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_debugfs.c b/drivers/scsi/lpfc/lpfc_debugfs.c
index a58f0b3..fe446ac 100644
--- a/drivers/scsi/lpfc/lpfc_debugfs.c
+++ b/drivers/scsi/lpfc/lpfc_debugfs.c
@@ -777,7 +777,7 @@
 	struct lpfc_nvme_lport *lport;
 	uint64_t data1, data2, data3;
 	uint64_t tot, totin, totout;
-	int cnt, i, maxch;
+	int cnt, i;
 	int len = 0;
 
 	if (phba->nvmet_support) {
@@ -919,10 +919,6 @@
 				atomic_read(&lport->fc4NvmeLsRequests),
 				atomic_read(&lport->fc4NvmeLsCmpls));
 
-		if (phba->cfg_nvme_io_channel < 32)
-			maxch = phba->cfg_nvme_io_channel;
-		else
-			maxch = 32;
 		totin = 0;
 		totout = 0;
 		for (i = 0; i < phba->cfg_nvme_io_channel; i++) {
