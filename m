From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:03:46 +0000
Subject: [PATCH 11/33][SCSI] cyberstormII: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030346.30002.32267.sendpatchset@thinktank.campus.ltu.se>
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


diff --git a/drivers/scsi/cyberstormII.c b/drivers/scsi/cyberstormII.c
index e336e85..e1d9c56 100644
--- a/drivers/scsi/cyberstormII.c
+++ b/drivers/scsi/cyberstormII.c
@@ -62,7 +62,7 @@ struct cyberII_dma_registers {
 #define CYBERII_DMA_LED    0x02	/* HD led control 1 = on */
 
 static int  dma_bytes_sent(struct NCR_ESP *esp, int fifo_count);
-static int  dma_can_transfer(struct NCR_ESP *esp, Scsi_Cmnd *sp);
+static int  dma_can_transfer(struct NCR_ESP *esp, struct scsi_cmnd *sp);
 static void dma_dump_state(struct NCR_ESP *esp);
 static void dma_init_read(struct NCR_ESP *esp, __u32 addr, int length);
 static void dma_init_write(struct NCR_ESP *esp, __u32 addr, int length);
@@ -183,7 +183,7 @@ static int dma_bytes_sent(struct NCR_ESP *esp, int fifo_count)
 	return fifo_count;
 }
 
-static int dma_can_transfer(struct NCR_ESP *esp, Scsi_Cmnd *sp)
+static int dma_can_transfer(struct NCR_ESP *esp, struct scsi_cmnd *sp)
 {
 	/* I don't think there's any limit on the CyberDMA. So we use what
 	 * the ESP chip can handle (24 bit).
