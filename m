From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:05:33 +0000
Subject: [PATCH 32/33][SCSI] wd7000: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030533.30002.94433.sendpatchset@thinktank.campus.ltu.se>
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
Cleaned up checkpatch.pl-error.


diff --git a/drivers/scsi/wd7000.c b/drivers/scsi/wd7000.c
index 03cd44f..185e1b5 100644
--- a/drivers/scsi/wd7000.c
+++ b/drivers/scsi/wd7000.c
@@ -1567,7 +1567,7 @@ static int wd7000_release(struct Scsi_Host *shost)
 /*
  *  I have absolutely NO idea how to do an abort with the WD7000...
  */
-static int wd7000_abort(Scsi_Cmnd * SCpnt)
+static int wd7000_abort(struct scsi_cmnd *SCpnt)
 {
 	Adapter *host = (Adapter *) SCpnt->device->host->hostdata;
 
