From: Shaun Laing <shaun@XResource.ca>
Date: Thu, 01 Aug 2013 17:44:15 +0000
Subject: [patch] staging: comedi: gsc_hpdi plx9080: Resolve sparse "different base types" warnings.
Message-Id: <201308011744.r71HiFtV077932@rivendell.pollux.laing>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,

Do you see anything wrong with submitting this patch?  My primary concern is
mixing the functional changes with the aesthetic changes.

Thanks.

* Resolves sparse warnings of the form 
	"warning: incorrect type in assignment (different base types)".
* Adds byte swapping to DEBUG_PRINT statements.
* Removes some spaces to elimite "checkpatch" warnings.

Signed-off-by: Shaun Laing <shaun@xresource.ca>
---
diff --git a/drivers/staging/comedi/drivers/gsc_hpdi.c b/drivers/staging/comedi/drivers/gsc_hpdi.c
index cdcc8f4..ca96af1 100644
--- a/drivers/staging/comedi/drivers/gsc_hpdi.c
+++ b/drivers/staging/comedi/drivers/gsc_hpdi.c
@@ -437,18 +437,18 @@ static int setup_dma_descriptors(struct comedi_device *dev,
 
 		DEBUG_PRINT(" desc %i\n", i);
 		DEBUG_PRINT(" start addr virt 0x%p, phys 0x%lx\n",
-			    devpriv->desc_dio_buffer[i],
-			    (unsigned long)devpriv->dma_desc[i].
-			    pci_start_addr);
+			devpriv->desc_dio_buffer[i],
+			(unsigned long)le32_to_cpu(devpriv->dma_desc[i].
+			pci_start_addr));
 		DEBUG_PRINT(" next 0x%lx\n",
-			    (unsigned long)devpriv->dma_desc[i].next);
+			(unsigned long)le32_to_cpu(devpriv->dma_desc[i].next));
 	}
 	devpriv->num_dma_descriptors = i;
 	/*  fix last descriptor to point back to first */
 	devpriv->dma_desc[i - 1].next  	    cpu_to_le32(devpriv->dma_desc_phys_addr | next_bits);
 	DEBUG_PRINT(" desc %i next fixup 0x%lx\n", i - 1,
-		    (unsigned long)devpriv->dma_desc[i - 1].next);
+		    (unsigned long)le32_to_cpu(devpriv->dma_desc[i - 1].next));
 
 	devpriv->block_size = transfer_size;
 
@@ -795,8 +795,8 @@ static void drain_dma_buffers(struct comedi_device *dev, unsigned int channel)
 		devpriv->dma_desc_index %= devpriv->num_dma_descriptors;
 
 		DEBUG_PRINT("next desc addr 0x%lx\n", (unsigned long)
-			    devpriv->dma_desc[devpriv->dma_desc_index].
-			    next);
+			le32_to_cpu(devpriv->dma_desc[devpriv->dma_desc_index].
+			next));
 		DEBUG_PRINT("pci addr reg 0x%x\n", next_transfer_addr);
 	}
 	/*  XXX check for buffer overrun somehow */
diff --git a/drivers/staging/comedi/drivers/plx9080.h b/drivers/staging/comedi/drivers/plx9080.h
index 0d254a1..dda878b 100644
--- a/drivers/staging/comedi/drivers/plx9080.h
+++ b/drivers/staging/comedi/drivers/plx9080.h
@@ -29,13 +29,13 @@
 
 /*  descriptor block used for chained dma transfers */
 struct plx_dma_desc {
-	volatile uint32_t pci_start_addr;
-	volatile uint32_t local_start_addr;
+	volatile __le32 pci_start_addr;
+	volatile __le32 local_start_addr;
 	/* transfer_size is in bytes, only first 23 bits of register are used */
-	volatile uint32_t transfer_size;
+	volatile __le32 transfer_size;
 	/* address of next descriptor (quad word aligned), plus some
 	 * additional bits (see PLX_DMA0_DESCRIPTOR_REG) */
-	volatile uint32_t next;
+	volatile __le32 next;
 };
 
 /**********************************************************************
