From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 11:02:58 +0000
Subject: [PATCH] cxlflash: remove an unnecessary NULL check
Message-Id: <20200605110258.GD978434@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Manoj N. Kumar" <manoj@linux.ibm.com>, "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>
Cc: Uma Krishnan <ukrishn@linux.ibm.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "cmd" pointer was already dereferenced a couple lines earlier so
this NULL check is too late.  Fortunately, the pointer can never be NULL
and the check can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/cxlflash/main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/cxlflash/main.c b/drivers/scsi/cxlflash/main.c
index fcc5aa9f60147..94250ebe9e803 100644
--- a/drivers/scsi/cxlflash/main.c
+++ b/drivers/scsi/cxlflash/main.c
@@ -47,9 +47,6 @@ static void process_cmd_err(struct afu_cmd *cmd, struct scsi_cmnd *scp)
 	struct sisl_ioasa *ioasa;
 	u32 resid;
 
-	if (unlikely(!cmd))
-		return;
-
 	ioasa = &(cmd->sa);
 
 	if (ioasa->rc.flags & SISL_RC_FLAGS_UNDERRUN) {
-- 
2.26.2
