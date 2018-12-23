From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Dec 2018 08:56:59 +0000
Subject: [PATCH 04/20] scsi: lpfc: lpfc_scsi: drop useless LIST_HEAD
Message-Id: <1545555435-24576-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>
Cc: kernel-janitors@vger.kernel.org, Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

Drop LIST_HEAD where the variable it declares is never used.

These were introduced in 8a9d2e8003040 ("[SCSI] lpfc 8.3.31:
Correct handling of SLI4-port XRI resource-provisioning profile
change"), but were not even used at that time.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
@@
- LIST_HEAD(x);
  ... when != x
// </smpl>

Fixes: 8a9d2e8003040 ("[SCSI] lpfc 8.3.31: Correct handling of SLI4-port XRI resource-provisioning profile change")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Successfully 0-day tested on 151 configurations.

 drivers/scsi/lpfc/lpfc_scsi.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index b4f1a840b3b4..dd415d783593 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -805,9 +805,7 @@ lpfc_new_scsi_buf_s4(struct lpfc_vport *vport, int num_to_alloc)
 	dma_addr_t pdma_phys_bpl;
 	uint16_t iotag, lxri = 0;
 	int bcnt, num_posted, sgl_size;
-	LIST_HEAD(prep_sblist);
 	LIST_HEAD(post_sblist);
-	LIST_HEAD(scsi_sblist);
 
 	sgl_size = phba->cfg_sg_dma_buf_size -
 		(sizeof(struct fcp_cmnd) + sizeof(struct fcp_rsp));
