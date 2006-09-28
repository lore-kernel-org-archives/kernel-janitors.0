From: Amol Lad <amol@verismonetworks.com>
Date: Thu, 28 Sep 2006 05:54:03 +0000
Subject: [KJ] [PATCH] ioremap balanced with iounmap for drivers/parisc
Message-Id: <1159422814.9310.17.camel@amol.verismonetworks.com>
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
 dino.c    |    4 +++-
 eisa.c    |    1 +
 iosapic.c |    1 +
 lba_pci.c |    7 ++++++-
 4 files changed, 11 insertions(+), 2 deletions(-)
---
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/parisc/dino.c linux-2.6.18/drivers/parisc/dino.c
--- linux-2.6.18-orig/drivers/parisc/dino.c	2006-09-21 10:15:38.000000000 +0530
+++ linux-2.6.18/drivers/parisc/dino.c	2006-09-28 10:14:07.000000000 +0530
@@ -1007,8 +1007,10 @@ static int __init dino_probe(struct pari
 		dino_bridge_init(dino_dev, name);
 	}
 
-	if (dino_common_init(dev, dino_dev, name))
+	if (dino_common_init(dev, dino_dev, name)) {
+		iounmap(dino_dev->hba.base_addr);
 		return 1;
+	}
 
 	dev->dev.platform_data = dino_dev;
 
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/parisc/eisa.c linux-2.6.18/drivers/parisc/eisa.c
--- linux-2.6.18-orig/drivers/parisc/eisa.c	2006-09-21 10:15:38.000000000 +0530
+++ linux-2.6.18/drivers/parisc/eisa.c	2006-09-28 10:14:49.000000000 +0530
@@ -381,6 +381,7 @@ static int __devinit eisa_probe(struct p
 		eisa_dev.root.dma_mask = 0xffffffff; /* wild guess */
 		if (eisa_root_register (&eisa_dev.root)) {
 			printk(KERN_ERR "EISA: Failed to register EISA root\n");
+			iounmap(eisa_eeprom_addr);
 			return -1;
 		}
 	}
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/parisc/iosapic.c linux-2.6.18/drivers/parisc/iosapic.c
--- linux-2.6.18-orig/drivers/parisc/iosapic.c	2006-09-21 10:15:38.000000000 +0530
+++ linux-2.6.18/drivers/parisc/iosapic.c	2006-09-28 10:15:30.000000000 +0530
@@ -887,6 +887,7 @@ void *iosapic_register(unsigned long hpa
 	vip = isi->isi_vector = (struct vector_info *)
 		kzalloc(sizeof(struct vector_info) * isi->isi_num_vectors, GFP_KERNEL);
 	if (vip = NULL) {
+		iounmap(isi->addr);
 		kfree(isi);
 		return NULL;
 	}
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/parisc/lba_pci.c linux-2.6.18/drivers/parisc/lba_pci.c
--- linux-2.6.18-orig/drivers/parisc/lba_pci.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18/drivers/parisc/lba_pci.c	2006-09-28 10:17:56.000000000 +0530
@@ -1574,6 +1574,7 @@ lba_driver_probe(struct parisc_device *d
 		cfg_ops = &mercury_cfg_ops;
 	} else {
 		printk(KERN_ERR "Unknown LBA found at 0x%lx\n", dev->hpa.start);
+		iounmap(addr);
 		return -ENODEV;
 	}
 
@@ -1589,6 +1590,7 @@ lba_driver_probe(struct parisc_device *d
 	lba_dev = kzalloc(sizeof(struct lba_device), GFP_KERNEL);
 	if (!lba_dev) {
 		printk(KERN_ERR "lba_init_chip - couldn't alloc lba_device\n");
+		iounmap(addr);
 		return(1);
 	}
 
@@ -1606,8 +1608,11 @@ lba_driver_probe(struct parisc_device *d
 	pcibios_register_hba(HBA_DATA(lba_dev));
 	spin_lock_init(&lba_dev->lba_lock);
 
-	if (lba_hw_init(lba_dev))
+	if (lba_hw_init(lba_dev)) {
+		iounmap(lba_dev->hba.base_addr);
+		lba_dev->hba.base_addr = NULL;
 		return(1);
+	}
 
 	/* ---------- Third : setup I/O Port and MMIO resources  --------- */
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
