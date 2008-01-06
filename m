From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:04:37 +0000
Subject: [PATCH 21/33][SCSI] mac_esp: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030437.30002.1410.sendpatchset@thinktank.campus.ltu.se>
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
Cleaned up checkpatch.pl-errors.


diff --git a/drivers/scsi/mac_esp.c b/drivers/scsi/mac_esp.c
index bcb4902..85f3d47 100644
--- a/drivers/scsi/mac_esp.c
+++ b/drivers/scsi/mac_esp.c
@@ -47,7 +47,7 @@ extern void esp_handle(struct NCR_ESP *esp);
 extern void mac_esp_intr(int irq, void *dev_id);
 
 static int  dma_bytes_sent(struct NCR_ESP * esp, int fifo_count);
-static int  dma_can_transfer(struct NCR_ESP * esp, Scsi_Cmnd *sp);
+static int  dma_can_transfer(struct NCR_ESP *esp, struct scsi_cmnd *sp);
 static void dma_dump_state(struct NCR_ESP * esp);
 static void dma_init_read(struct NCR_ESP * esp, char * vaddress, int length);
 static void dma_init_write(struct NCR_ESP * esp, char * vaddress, int length);
@@ -582,7 +582,7 @@ static int dma_bytes_sent(struct NCR_ESP * esp, int fifo_count)
  * is ever implemented. Returning 0 here will use PIO.
  */
 
-static int dma_can_transfer(struct NCR_ESP * esp, Scsi_Cmnd * sp)
+static int dma_can_transfer(struct NCR_ESP *esp, struct scsi_cmnd *sp)
 {
 	unsigned long sz = sp->SCp.this_residual;
 #if 0	/* no DMA yet; make conditional */
