From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2020 14:03:11 +0000
Subject: [PATCH] scsi: mpt3sas: Signedness bug in _base_get_diag_triggers()
Message-Id: <X9DZH37bYPHwSQRP@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>
Cc: Sreekanth Reddy <sreekanth.reddy@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The "trigger_flags" variable needs to be signed for the error checking
to work.

Fixes: 5767aaffbb8b ("scsi: mpt3sas: Add persistent trigger pages support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/mpt3sas/mpt3sas_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/mpt3sas_base.c
index 969baf4cd3f5..6e23dc3209fe 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@ -5034,7 +5034,7 @@ _base_check_for_trigger_pages_support(struct MPT3SAS_ADAPTER *ioc)
 static void
 _base_get_diag_triggers(struct MPT3SAS_ADAPTER *ioc)
 {
-	u16 trigger_flags;
+	int trigger_flags;
 
 	/*
 	 * Default setting of master trigger.
-- 
2.29.2
