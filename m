From: James Smart <jsmart2021@gmail.com>
Date: Wed, 20 May 2020 18:59:29 +0000
Subject: [PATCH 3/3] lpfc: Fix return value in __lpfc_nvme_ls_abort
Message-Id: <20200520185929.48779-4-jsmart2021@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520185929.48779-1-jsmart2021@gmail.com>
In-Reply-To: <20200520185929.48779-1-jsmart2021@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-nvme@lists.infradead.org
Cc: axboe@kernel.dk, James Smart <jsmart2021@gmail.com>, Dick Kennedy <dick.kennedy@broadcom.com>, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com, kernel-janitors@vger.kernel.org, hch@infradead.org, paul.ely@broadcom.com, hare@suse.de, dan.carpenter@oracle.com

A static checker reported the following issue:
  drivers/scsi/lpfc/lpfc_nvmet.c:1366 lpfc_nvmet_ls_abort()
  warn: 'ret' can be either negative or positive

The comment indicates a non-zero value indicates error in the
form of -Exxx, but the code is returning "1".

Fix the code to return -EINVAL to be compliant to comment.

Fixes: e96a22b0b7c2 ("lpfc: Refactor Send LS Abort support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dick Kennedy <dick.kennedy@broadcom.com>
Signed-off-by: James Smart <jsmart2021@gmail.com>
---
 drivers/scsi/lpfc/lpfc_nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_nvme.c b/drivers/scsi/lpfc/lpfc_nvme.c
index 21bbccf0dc31..b46ba70f78da 100644
--- a/drivers/scsi/lpfc/lpfc_nvme.c
+++ b/drivers/scsi/lpfc/lpfc_nvme.c
@@ -895,7 +895,7 @@ __lpfc_nvme_ls_abort(struct lpfc_vport *vport, struct lpfc_nodelist *ndlp,
 	lpfc_printf_vlog(vport, KERN_INFO, LOG_NVME_DISC | LOG_NVME_ABTS,
 			 "6213 NVMEx LS REQ Abort: Unable to locate req x%p\n",
 			 pnvme_lsreq);
-	return 1;
+	return -EINVAL;
 }
 
 static int
-- 
2.26.1
