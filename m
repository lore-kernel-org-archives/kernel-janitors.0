From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 12 Oct 2018 10:36:23 +0000
Subject: [PATCH -next] scsi: arcmsr: Remove set but not used variables 'id, lun'
Message-Id: <1539340583-117444-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/arcmsr/arcmsr_hba.c: In function 'arcmsr_drain_donequeue':
drivers/scsi/arcmsr/arcmsr_hba.c:1320:10: warning:
 variable 'lun' set but not used [-Wunused-but-set-variable]

drivers/scsi/arcmsr/arcmsr_hba.c:1320:6: warning:
 variable 'id' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit ae52e7f09ff5

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/arcmsr/arcmsr_hba.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index cc0be46..f53e1bc 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -1317,13 +1317,10 @@ static void arcmsr_report_ccb_state(struct AdapterControlBlock *acb,
 
 static void arcmsr_drain_donequeue(struct AdapterControlBlock *acb, struct CommandControlBlock *pCCB, bool error)
 {
-	int id, lun;
 	if ((pCCB->acb != acb) || (pCCB->startdone != ARCMSR_CCB_START)) {
 		if (pCCB->startdone = ARCMSR_CCB_ABORTED) {
 			struct scsi_cmnd *abortcmd = pCCB->pcmd;
 			if (abortcmd) {
-				id = abortcmd->device->id;
-				lun = abortcmd->device->lun;				
 				abortcmd->result |= DID_ABORT << 16;
 				arcmsr_ccb_complete(pCCB);
 				printk(KERN_NOTICE "arcmsr%d: pCCB ='0x%p' isr got aborted command \n",
