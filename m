From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 07:48:29 +0000
Subject: [PATCH v2 10/15] lpfc: Remove unnessary cast
Message-Id: <1429775314-4171-11-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

kzalloc() returns a void pointer - no need to cast it in
drivers/scsi/lpfc/lpfc_init.c::lpfc_sli_driver_resource_setup()

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/scsi/lpfc/lpfc_init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index e8c8c1e..30b72da 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -4975,8 +4975,7 @@ lpfc_sli_driver_resource_setup(struct lpfc_hba *phba)
 	}
 
 	if (!phba->sli.ring)
-		phba->sli.ring = (struct lpfc_sli_ring *)
-			kzalloc(LPFC_SLI3_MAX_RING *
+		phba->sli.ring = kzalloc(LPFC_SLI3_MAX_RING *
 			sizeof(struct lpfc_sli_ring), GFP_KERNEL);
 	if (!phba->sli.ring)
 		return -ENOMEM;
-- 
2.1.0

