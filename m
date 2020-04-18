From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 18 Apr 2020 07:10:57 +0000
Subject: [PATCH -next] scsi: bfa: Remove set but not used variable 'fchs'
Message-Id: <20200418071057.96699-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anil Gurumurthy <anil.gurumurthy@qlogic.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/bfa/bfa_svc.c: In function 'uf_recv':
drivers/scsi/bfa/bfa_svc.c:5520:17: warning:
 variable 'fchs' set but not used [-Wunused-but-set-variable]
  struct fchs_s *fchs;
                 ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/bfa/bfa_svc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/bfa/bfa_svc.c b/drivers/scsi/bfa/bfa_svc.c
index d8a9e40fa257..0b7d2e8f4a66 100644
--- a/drivers/scsi/bfa/bfa_svc.c
+++ b/drivers/scsi/bfa/bfa_svc.c
@@ -5517,7 +5517,6 @@ uf_recv(struct bfa_s *bfa, struct bfi_uf_frm_rcvd_s *m)
 	struct bfa_uf_s *uf = &ufm->uf_list[uf_tag];
 	struct bfa_uf_buf_s *uf_buf;
 	uint8_t *buf;
-	struct fchs_s *fchs;
 
 	uf_buf = (struct bfa_uf_buf_s *)
 			bfa_mem_get_dmabuf_kva(ufm, uf_tag, uf->pb_len);
@@ -5526,8 +5525,6 @@ uf_recv(struct bfa_s *bfa, struct bfi_uf_frm_rcvd_s *m)
 	m->frm_len = be16_to_cpu(m->frm_len);
 	m->xfr_len = be16_to_cpu(m->xfr_len);
 
-	fchs = (struct fchs_s *)uf_buf;
-
 	list_del(&uf->qe);	/* dequeue from posted queue */
 
 	uf->data_ptr = buf;
