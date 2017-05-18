From: Colin King <colin.king@canonical.com>
Date: Thu, 18 May 2017 09:35:24 +0000
Subject: [PATCH] scsi: lpfc: make a couple of functions static
Message-Id: <20170518093524.13549-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

functions lpfc_nvmet_cleanup_io_context and lpfc_nvmet_setup_io_context
can be made static as they do not need to be in global scope.

Cleans up sparse warnings:
  "warning: symbol 'lpfc_nvmet_cleanup_io_context' was not declared.
   Should it be static?"
  "warning: symbol 'lpfc_nvmet_setup_io_context' was not declared.
   Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_nvmet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_nvmet.c b/drivers/scsi/lpfc/lpfc_nvmet.c
index f94294b77b7b..469958e3d50a 100644
--- a/drivers/scsi/lpfc/lpfc_nvmet.c
+++ b/drivers/scsi/lpfc/lpfc_nvmet.c
@@ -828,7 +828,7 @@ static struct nvmet_fc_target_template lpfc_tgttemplate = {
 	.target_priv_sz = sizeof(struct lpfc_nvmet_tgtport),
 };
 
-void
+static void
 lpfc_nvmet_cleanup_io_context(struct lpfc_hba *phba)
 {
 	struct lpfc_nvmet_ctxbuf *ctx_buf, *next_ctx_buf;
@@ -858,7 +858,7 @@ lpfc_nvmet_cleanup_io_context(struct lpfc_hba *phba)
 	}
 }
 
-int
+static int
 lpfc_nvmet_setup_io_context(struct lpfc_hba *phba)
 {
 	struct lpfc_nvmet_ctxbuf *ctx_buf;
-- 
2.11.0

