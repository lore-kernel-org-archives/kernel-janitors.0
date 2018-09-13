From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 13 Sep 2018 01:58:13 +0000
Subject: [PATCH -next] scsi: lpfc: Remove set but not used variable 'sgl_size'
Message-Id: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/lpfc/lpfc_nvme.c: In function 'lpfc_new_nvme_buf':
drivers/scsi/lpfc/lpfc_nvme.c:2238:24: warning:
 variable 'sgl_size' set but not used [-Wunused-but-set-variable]
  int bcnt, num_posted, sgl_size;
                        ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/lpfc/lpfc_nvme.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_nvme.c b/drivers/scsi/lpfc/lpfc_nvme.c
index 5438732..d86eb51 100644
--- a/drivers/scsi/lpfc/lpfc_nvme.c
+++ b/drivers/scsi/lpfc/lpfc_nvme.c
@@ -2235,13 +2235,11 @@
 	struct sli4_sge *sgl;
 	dma_addr_t pdma_phys_sgl;
 	uint16_t iotag, lxri = 0;
-	int bcnt, num_posted, sgl_size;
+	int bcnt, num_posted;
 	LIST_HEAD(prep_nblist);
 	LIST_HEAD(post_nblist);
 	LIST_HEAD(nvme_nblist);
 
-	sgl_size = phba->cfg_sg_dma_buf_size;
-
 	for (bcnt = 0; bcnt < num_to_alloc; bcnt++) {
 		lpfc_ncmd = kzalloc(sizeof(struct lpfc_nvme_buf), GFP_KERNEL);
 		if (!lpfc_ncmd)
