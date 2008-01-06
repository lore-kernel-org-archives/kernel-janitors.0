From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:02:55 +0000
Subject: [PATCH  1/33][SCSI] 3w-xxxx: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030255.30002.6527.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@SteelEye.com
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert the typedef'ed 'Scsi_Cmnd' to 'struct scsi_cmnd'.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Last item before 'drivers/scsi/scsi_typedefs.h' can be removed.


diff --git a/drivers/scsi/3w-xxxx.c b/drivers/scsi/3w-xxxx.c
index 59716eb..54374e3 100644
--- a/drivers/scsi/3w-xxxx.c
+++ b/drivers/scsi/3w-xxxx.c
@@ -1955,7 +1955,7 @@ static int tw_scsi_queue(struct scsi_cmnd *SCpnt, void (*done)(struct scsi_cmnd
 	if (test_bit(TW_IN_RESET, &tw_dev->flags))
 		return SCSI_MLQUEUE_HOST_BUSY;
 
-	/* Save done function into Scsi_Cmnd struct */
+	/* Save done function into scsi_cmnd struct */
 	SCpnt->scsi_done = done;
 		 
 	/* Queue the command and get a request id */
