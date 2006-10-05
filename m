From: Amol Lad <amol@verismonetworks.com>
Date: Thu, 05 Oct 2006 07:52:04 +0000
Subject: [KJ] [PATCH] ioremap balanced with iounmap for drivers/atm
Message-Id: <1160034004.19143.45.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158842563.28299.145.camel@amol.verismonetworks.com>
In-Reply-To: <1158842563.28299.145.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ioremap must be balanced by an iounmap and failing to do so can result
in a memory leak.

Tested (compilation only) to make sure the files are compiling without
any warning/error due to new changes

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 eni.c        |   13 +++++++++++--
 firestream.c |    6 ++++++
 2 files changed, 17 insertions(+), 2 deletions(-)
---
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/atm/eni.c linux-2.6.18/drivers/atm/eni.c
--- linux-2.6.18-orig/drivers/atm/eni.c	2006-09-21 10:15:31.000000000 +0530
+++ linux-2.6.18/drivers/atm/eni.c	2006-10-05 12:56:11.000000000 +0530
@@ -1746,6 +1746,7 @@ static int __devinit eni_do_init(struct 
 			printk(KERN_ERR KERN_ERR DEV_LABEL "(itf %d): bad "
 			    "magic - expected 0x%x, got 0x%x\n",dev->number,
 			    ENI155_MAGIC,(unsigned) readl(&eprom->magic));
+			iounmap(base);
 			return -EINVAL;
 		}
 	}
@@ -1773,17 +1774,25 @@ static int __devinit eni_do_init(struct 
 		printk(")\n");
 		printk(KERN_ERR DEV_LABEL "(itf %d): ERROR - wrong id 0x%x\n",
 		    dev->number,(unsigned) eni_in(MID_RES_ID_MCON));
+		iounmap(base);
 		return -EINVAL;
 	}
 	error = eni_dev->asic ? get_esi_asic(dev) : get_esi_fpga(dev,base);
-	if (error) return error;
+	if (error) {
+		iounmap(base);
+	   	return error;
+	}
 	for (i = 0; i < ESI_LEN; i++)
 		printk("%s%02X",i ? "-" : "",dev->esi[i]);
 	printk(")\n");
 	printk(KERN_NOTICE DEV_LABEL "(itf %d): %s,%s\n",dev->number,
 	    eni_in(MID_RES_ID_MCON) & 0x200 ? "ASIC" : "FPGA",
 	    media_name[eni_in(MID_RES_ID_MCON) & DAUGTHER_ID]);
-	return suni_init(dev);
+
+	error = suni_init(dev);
+	if (error)
+		iounmap(base);
+	return error;
 }
 
 
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/atm/firestream.c linux-2.6.18/drivers/atm/firestream.c
--- linux-2.6.18-orig/drivers/atm/firestream.c	2006-09-21 10:15:31.000000000 +0530
+++ linux-2.6.18/drivers/atm/firestream.c	2006-10-05 12:46:44.000000000 +0530
@@ -1699,6 +1699,7 @@ static int __devinit fs_init (struct fs_
 		/* This bit is documented as "RESERVED" */
 		if (isr & ISR_INIT_ERR) {
 			printk (KERN_ERR "Error initializing the FS... \n");
+			iounmap(dev->base);
 			return 1;
 		}
 		if (isr & ISR_INIT) {
@@ -1712,6 +1713,7 @@ static int __devinit fs_init (struct fs_
 
 	if (!to) {
 		printk (KERN_ERR "timeout initializing the FS... \n");
+		iounmap(dev->base);
 		return 1;
 	}
 
@@ -1792,6 +1794,7 @@ static int __devinit fs_init (struct fs_
 	if (!dev->atm_vccs) {
 		printk (KERN_WARNING "Couldn't allocate memory for VCC buffers. Woops!\n");
 		/* XXX Clean up..... */
+		iounmap(dev->base);
 		return 1;
 	}
 	memset (dev->atm_vccs, 0, dev->nchannels * sizeof (struct atm_vcc *));
@@ -1803,6 +1806,7 @@ static int __devinit fs_init (struct fs_
 	if (!dev->tx_inuse) {
 		printk (KERN_WARNING "Couldn't allocate memory for tx_inuse bits!\n");
 		/* XXX Clean up..... */
+		iounmap(dev->base);
 		return 1;
 	}
 	memset (dev->tx_inuse, 0, dev->nchannels / 8);
@@ -1832,6 +1836,7 @@ static int __devinit fs_init (struct fs_
 	if (request_irq (dev->irq, fs_irq, IRQF_SHARED, "firestream", dev)) {
 		printk (KERN_WARNING "couldn't get irq %d for firestream.\n", pci_dev->irq);
 		/* XXX undo all previous stuff... */
+		iounmap(dev->base);
 		return 1;
 	}
 	fs_dprintk (FS_DEBUG_INIT, "Grabbed irq %d for dev at %p.\n", dev->irq, dev);
@@ -2007,6 +2012,7 @@ static void __devexit firestream_remove_
 		for (i=0;i < FS_NR_RX_QUEUES;i++)
 			free_queue (dev, &dev->rx_rq[i]);
 
+		iounmap(dev->base);
 		fs_dprintk (FS_DEBUG_ALLOC, "Free fs-dev: %p\n", dev);
 		nxtdev = dev->next;
 		kfree (dev);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
