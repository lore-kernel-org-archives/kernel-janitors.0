From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Dec 2018 17:08:05 +0000
Subject: [PATCH][next] scsi: lpfc: replace snprintf with strscpy
Message-Id: <20181220170805.17802-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <jsmart2021@gmail.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Using snprintf without a format specifier is potentially risky if the
string phba->ModelDesc contains format specifiers. Replace this with
the safer and more efficient strscpy.

Cleans up clang warning:
drivers/scsi/lpfc/lpfc_scsi.c:4543:31: warning: format string is not a
string literal (potentially insecure) [-Wformat-security]

Fixes: 5021267af132 ("scsi: lpfc: Adding ability to reset chip via pci bus reset")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index b4f1a840b3b4..7b0cce3b42ed 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -4540,7 +4540,7 @@ lpfc_info(struct Scsi_Host *host)
 	memset(lpfcinfobuf, 0, sizeof(lpfcinfobuf));
 	if (phba && phba->pcidev){
 		/* Model Description */
-		scnprintf(tmp, sizeof(tmp), phba->ModelDesc);
+		strscpy(tmp, phba->ModelDesc, sizeof(tmp));
 		if (strlcat(lpfcinfobuf, tmp, sizeof(lpfcinfobuf)) > 		    sizeof(lpfcinfobuf))
 			goto buffer_done;
-- 
2.19.1
