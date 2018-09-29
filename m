From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 29 Sep 2018 13:53:07 +0000
Subject: [PATCH -next] scsi: lpfc: Remove set but not used variable 'psli'
Message-Id: <1538229187-17246-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/lpfc/lpfc_hbadisc.c: In function 'lpfc_free_tx':
drivers/scsi/lpfc/lpfc_hbadisc.c:5431:19: warning:
 variable 'psli' set but not used [-Wunused-but-set-variable]

Since commit 895427bd012c ("scsi: lpfc: NVME Initiator: Base modifications")
'psli' is not used any more.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/lpfc/lpfc_hbadisc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadisc.c
index f9a038ec..f4deb86 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -5428,12 +5428,10 @@ struct lpfc_nodelist *
 lpfc_free_tx(struct lpfc_hba *phba, struct lpfc_nodelist *ndlp)
 {
 	LIST_HEAD(completions);
-	struct lpfc_sli *psli;
 	IOCB_t     *icmd;
 	struct lpfc_iocbq    *iocb, *next_iocb;
 	struct lpfc_sli_ring *pring;
 
-	psli = &phba->sli;
 	pring = lpfc_phba_elsring(phba);
 	if (unlikely(!pring))
 		return;
