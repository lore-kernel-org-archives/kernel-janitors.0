From: Amol Lad <amol@verismonetworks.com>
Date: Mon, 16 Oct 2006 06:54:19 +0000
Subject: [KJ] [PATCH] drivers/scsi/mca_53c9x.c: save_flags()/cli() removal
Message-Id: <1160981382.19143.416.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux kernel <linux-kernel@vger.kernel.org>, James.Bottomley@steeleye.com
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>

Replaced calls with save_flags()/cli() pair with
spi_lock_irqsave()/spin_unlock_irqrestore()

Tested:
1. compilation only 
2. Code review to verify that the change does not result in a recursive
locking

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
James,

Though I have done the review to check for recursive locking, can you
also have a look ?
---
--- linux-2.6.19-rc1-orig/drivers/scsi/mca_53c9x.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.19-rc1/drivers/scsi/mca_53c9x.c	2006-10-16 11:47:45.000000000 +0530
@@ -342,9 +342,8 @@ static void dma_init_read(struct NCR_ESP
 	unsigned long flags;
 
 
-	save_flags(flags);
-	cli();
-
+	spin_lock_irqsave(esp->ehost->host_lock, flags);
+	
 	mca_disable_dma(esp->dma);
 	mca_set_dma_mode(esp->dma, MCA_DMA_MODE_XFER | MCA_DMA_MODE_16 |
 	  MCA_DMA_MODE_IO);
@@ -352,7 +351,7 @@ static void dma_init_read(struct NCR_ESP
 	mca_set_dma_count(esp->dma, length / 2); /* !!! */
 	mca_enable_dma(esp->dma);
 
-	restore_flags(flags);
+	spin_unlock_irqrestore(esp->ehost->host_lock, flags);
 }
 
 static void dma_init_write(struct NCR_ESP *esp, __u32 addr, int length)
@@ -360,8 +359,7 @@ static void dma_init_write(struct NCR_ES
 	unsigned long flags;
 
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(esp->ehost->host_lock, flags);
 
 	mca_disable_dma(esp->dma);
 	mca_set_dma_mode(esp->dma, MCA_DMA_MODE_XFER | MCA_DMA_MODE_WRITE |
@@ -370,7 +368,7 @@ static void dma_init_write(struct NCR_ES
 	mca_set_dma_count(esp->dma, length / 2); /* !!! */
 	mca_enable_dma(esp->dma);
 
-	restore_flags(flags);
+	spin_unlock_irqrestore(esp->ehost->host_lock, flags);
 }
 
 static void dma_ints_off(struct NCR_ESP *esp)


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
