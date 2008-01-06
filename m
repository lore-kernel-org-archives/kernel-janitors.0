From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:04:42 +0000
Subject: [PATCH 22/33][SCSI] mca_53c9x: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030442.30002.81459.sendpatchset@thinktank.campus.ltu.se>
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


diff --git a/drivers/scsi/mca_53c9x.c b/drivers/scsi/mca_53c9x.c
index d693d0f..5dbc259 100644
--- a/drivers/scsi/mca_53c9x.c
+++ b/drivers/scsi/mca_53c9x.c
@@ -77,7 +77,7 @@
                         }
 
 static int  dma_bytes_sent(struct NCR_ESP *, int);
-static int  dma_can_transfer(struct NCR_ESP *, Scsi_Cmnd *);
+static int  dma_can_transfer(struct NCR_ESP *, struct scsi_cmnd *);
 static void dma_dump_state(struct NCR_ESP *);
 static void dma_init_read(struct NCR_ESP *, __u32, int);
 static void dma_init_write(struct NCR_ESP *, __u32, int);
@@ -313,7 +313,7 @@ static int dma_bytes_sent(struct NCR_ESP *esp, int fifo_count)
 	return fifo_count;
 }
 
-static int dma_can_transfer(struct NCR_ESP *esp, Scsi_Cmnd *sp)
+static int dma_can_transfer(struct NCR_ESP *esp, struct scsi_cmnd *sp)
 {
 	/* 
 	 * The MCA dma channels can only do up to 128K bytes at a time.
