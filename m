From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Feb 2017 14:09:14 +0000
Subject: [PATCH] scsi: lpfc: don't dereference dma_buf->iocbq before null check
Message-Id: <20170224140914.6011-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

dma_buf->iocbq is being dereferenced immediately before it is
being null checked, so we have a potential null pointer dereference
bug.  Fix this by only dereferencing it only once we have passed
a null check on the pointer.

Detected by CoverityScan, CID#1411652 ("Dereference before null check")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_mem.c b/drivers/scsi/lpfc/lpfc_mem.c
index c61d8d6..5986c79 100644
--- a/drivers/scsi/lpfc/lpfc_mem.c
+++ b/drivers/scsi/lpfc/lpfc_mem.c
@@ -646,7 +646,6 @@ lpfc_sli4_nvmet_alloc(struct lpfc_hba *phba)
 	}
 
 	dma_buf->iocbq = lpfc_sli_get_iocbq(phba);
-	dma_buf->iocbq->iocb_flag = LPFC_IO_NVMET;
 	if (!dma_buf->iocbq) {
 		kfree(dma_buf->context);
 		pci_pool_free(phba->lpfc_drb_pool, dma_buf->dbuf.virt,
@@ -658,6 +657,7 @@ lpfc_sli4_nvmet_alloc(struct lpfc_hba *phba)
 				"2621 Ran out of nvmet iocb/WQEs\n");
 		return NULL;
 	}
+	dma_buf->iocbq->iocb_flag = LPFC_IO_NVMET;
 	nvmewqe = dma_buf->iocbq;
 	wqe = (union lpfc_wqe128 *)&nvmewqe->wqe;
 	/* Initialize WQE */
-- 
2.10.2

