From: Colin King <colin.king@canonical.com>
Date: Thu, 07 May 2020 20:31:11 +0000
Subject: [PATCH] scsi: lpfc: remove redundant initialization to variable rc
Message-Id: <20200507203111.64709-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_attr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index 1354c141d614..87ac8ac0f72a 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -4877,7 +4877,7 @@ lpfc_request_firmware_upgrade_store(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct lpfc_vport *vport = (struct lpfc_vport *)shost->hostdata;
 	struct lpfc_hba *phba = vport->phba;
-	int val = 0, rc = -EINVAL;
+	int val = 0, rc;
 
 	/* Sanity check on user data */
 	if (!isdigit(buf[0]))
-- 
2.25.1
