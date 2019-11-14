From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Nov 2019 18:00:07 +0000
Subject: [PATCH] scsi: arcmsr: fix indentation issues
Message-Id: <20191114180007.325856-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Ching Huang <ching2048@areca.com.tw>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a few statements that are indented incorrectly, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/arcmsr/arcmsr_hba.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 88053b15c363..db687ef8a99e 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -1400,7 +1400,7 @@ static void arcmsr_drain_donequeue(struct AdapterControlBlock *acb, struct Comma
 				, pCCB->acb
 				, pCCB->startdone
 				, atomic_read(&acb->ccboutstandingcount));
-		  return;
+		return;
 	}
 	arcmsr_report_ccb_state(acb, pCCB, error);
 }
@@ -3476,8 +3476,8 @@ static int arcmsr_hbaC_polling_ccbdone(struct AdapterControlBlock *acb,
 					, pCCB->pcmd->device->id
 					, (u32)pCCB->pcmd->device->lun
 					, pCCB);
-					pCCB->pcmd->result = DID_ABORT << 16;
-					arcmsr_ccb_complete(pCCB);
+				pCCB->pcmd->result = DID_ABORT << 16;
+				arcmsr_ccb_complete(pCCB);
 				continue;
 			}
 			printk(KERN_NOTICE "arcmsr%d: polling get an illegal ccb"
-- 
2.20.1
