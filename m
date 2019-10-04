From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Oct 2019 10:06:15 +0000
Subject: [PATCH] scsi: mpt3sas: Clean up some indenting
Message-Id: <20191004100615.GA823@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Cc: Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This line is indented too far so it's a bit confusing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/mpt3sas/mpt3sas_ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_ctl.c b/drivers/scsi/mpt3sas/mpt3sas_ctl.c
index 0c77f2209cec..6874cf017739 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_ctl.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_ctl.c
@@ -1821,7 +1821,7 @@ mpt3sas_enable_diag_buffer(struct MPT3SAS_ADAPTER *ioc, u8 bits_to_register)
 				     trace_buff_size>>10);
 				ioc_err(ioc,
 				    "Using zero Min Trace Buff Size\n");
-				    min_trace_buff_size = 0;
+				min_trace_buff_size = 0;
 			}
 
 			if (decr_trace_buff_size = 0) {
-- 
2.20.1
