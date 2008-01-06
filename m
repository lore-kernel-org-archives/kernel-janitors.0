From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:03:00 +0000
Subject: [PATCH  2/33][SCSI] advansys: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030300.30002.13173.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@SteelEye.com
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org, linux-scsi@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert the typedef'ed 'Scsi_Cmnd' to 'struct scsi_cmnd'.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Last item before 'drivers/scsi/scsi_typedefs.h' can be removed.


diff --git a/drivers/scsi/advansys.c b/drivers/scsi/advansys.c
index 9dd3952..a9a8685 100644
--- a/drivers/scsi/advansys.c
+++ b/drivers/scsi/advansys.c
@@ -10920,7 +10920,7 @@ static int AdvExeScsiQueue(ADV_DVC_VAR *asc_dvc, ADV_SCSI_REQ_Q *scsiq)
 }
 
 /*
- * Execute a single 'Scsi_Cmnd'.
+ * Execute a single 'scsi_cmnd'.
  */
 static int asc_execute_scsi_cmnd(struct scsi_cmnd *scp)
 {
