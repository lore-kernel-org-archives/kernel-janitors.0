From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 14 Sep 2018 10:41:44 +0000
Subject: [PATCH -next] scsi: lpfc: Remove set but not used variables 'fc_hdr' and 'hw_page_size'
Message-Id: <1536921704-43136-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/lpfc/lpfc_sli.c: In function 'lpfc_sli4_sp_handle_rcqe':
drivers/scsi/lpfc/lpfc_sli.c:13430:26: warning:
 variable 'fc_hdr' set but not used [-Wunused-but-set-variable]

drivers/scsi/lpfc/lpfc_sli.c: In function 'lpfc_cq_create':
drivers/scsi/lpfc/lpfc_sli.c:14852:11: warning:
 variable 'hw_page_size' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/lpfc/lpfc_sli.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index c378230..783a154 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -13427,7 +13427,6 @@ void lpfc_sli4_els_xri_abort_event_proc(struct lpfc_hba *phba)
 lpfc_sli4_sp_handle_rcqe(struct lpfc_hba *phba, struct lpfc_rcqe *rcqe)
 {
 	bool workposted = false;
-	struct fc_frame_header *fc_hdr;
 	struct lpfc_queue *hrq = phba->sli4_hba.hdr_rq;
 	struct lpfc_queue *drq = phba->sli4_hba.dat_rq;
 	struct lpfc_nvmet_tgtport *tgtp;
@@ -13464,9 +13463,6 @@ void lpfc_sli4_els_xri_abort_event_proc(struct lpfc_hba *phba)
 		hrq->RQ_buf_posted--;
 		memcpy(&dma_buf->cq_event.cqe.rcqe_cmpl, rcqe, sizeof(*rcqe));
 
-		/* If a NVME LS event (type 0x28), treat it as Fast path */
-		fc_hdr = (struct fc_frame_header *)dma_buf->hbuf.virt;
-
 		/* save off the frame for the word thread to process */
 		list_add_tail(&dma_buf->cq_event.list,
 			      &phba->sli4_hba.sp_queue_event);
@@ -14849,13 +14845,10 @@ struct lpfc_queue *
 	int rc, length, status = 0;
 	uint32_t shdr_status, shdr_add_status;
 	union lpfc_sli4_cfg_shdr *shdr;
-	uint32_t hw_page_size = phba->sli4_hba.pc_sli4_params.if_page_sz;
 
 	/* sanity check on queue memory */
 	if (!cq || !eq)
 		return -ENODEV;
-	if (!phba->sli4_hba.pc_sli4_params.supported)
-		hw_page_size = cq->page_size;
 
 	mbox = mempool_alloc(phba->mbox_mem_pool, GFP_KERNEL);
 	if (!mbox)
