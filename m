From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:04:57 +0000
Subject: [PATCH 25/33][SCSI] NCR53c406a: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030457.30002.98237.sendpatchset@thinktank.campus.ltu.se>
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
Cleaned up checkpatch.pl-errors (so no '> 80 lines'-warning).


diff --git a/drivers/scsi/NCR53c406a.c b/drivers/scsi/NCR53c406a.c
index 137d065..bdb2ca5 100644
--- a/drivers/scsi/NCR53c406a.c
+++ b/drivers/scsi/NCR53c406a.c
@@ -201,7 +201,7 @@ static int dma_chan;
 static int fast_pio = USE_FAST_PIO;
 #endif
 
-static Scsi_Cmnd *current_SC;
+static struct scsi_cmnd *current_SC;
 static char info_msg[256];
 
 /* ================================= */
@@ -693,7 +693,7 @@ static void wait_intr(void)
 }
 #endif
 
-static int NCR53c406a_queue(Scsi_Cmnd * SCpnt, void (*done) (Scsi_Cmnd *))
+static int NCR53c406a_queue(struct scsi_cmnd *SCpnt, void (*done) (struct scsi_cmnd *))
 {
 	int i;
 
@@ -726,7 +726,7 @@ static int NCR53c406a_queue(Scsi_Cmnd * SCpnt, void (*done) (Scsi_Cmnd *))
 	return 0;
 }
 
-static int NCR53c406a_host_reset(Scsi_Cmnd * SCpnt)
+static int NCR53c406a_host_reset(struct scsi_cmnd *SCpnt)
 {
 	DEB(printk("NCR53c406a_reset called\n"));
 
