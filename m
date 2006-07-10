From: Richard <h.vanberkum@chello.nl>
Date: Mon, 10 Jul 2006 23:41:34 +0000
Subject: [KJ] [PATCH] drivers/parisc/superio.c: check return values of
Message-Id: <20060711020442.GA17650@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Check return values of request region and act accordingly

Signed-off-by: Richard van Berkum <h.vanberkum at chello.nl> 

---

My second attempt to correct some request_region code. Any input is
welcome.

 drivers/parisc/superio.c |   31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)


--- linux-2.6/drivers/parisc/superio.c	2006-07-06 16:58:12.083348600 +0200
+++ mytree/drivers/parisc/superio.c	2006-07-11 03:02:04.444958048 +0200
@@ -189,9 +189,20 @@ superio_init(struct pci_dev *pcidev)
 	sio->acpi_base &= ~1;
 	printk(KERN_INFO PFX "ACPI at 0x%x\n", sio->acpi_base);
 
-	request_region (IC_PIC1, 0x1f, "pic1");
-	request_region (IC_PIC2, 0x1f, "pic2");
-	request_region (sio->acpi_base, 0x1f, "acpi");
+	if (!(request_region (IC_PIC1, 0x1f, "pic1"))) {
+		printk(KERN_ERR "can't get I/O %x\n", IC_PIC1);
+		goto err1;
+	}
+	
+	if(!(request_region (IC_PIC2, 0x1f, "pic2"))) {
+		printk(KERN_ERR "can't get I/O %x\n", IC_PIC2);
+		goto err2;
+	}
+	
+	if(!(request_region (sio->acpi_base, 0x1f, "acpi"))) {
+		printk(KERN_ERR "can't get I/O %x\n", sio->acpi_base);
+		goto err3;
+	}
 
 	/* Enable the legacy I/O function */
 	pci_read_config_word (pdev, PCI_COMMAND, &word);
@@ -276,10 +287,22 @@ superio_init(struct pci_dev *pcidev)
 
 		printk(KERN_ERR PFX "could not get irq\n");
 		BUG();
-		return;
+		
+		/*Free resources previously requested*/
+		goto err3;
 	}
 
 	sio->suckyio_irq_enabled = 1;
+
+	return;
+
+
+err3:	release_region(IC_PIC2, 0x1f);
+
+err2:	release_region(IC_PIC1, 0x1f);
+
+err1:	return; 
+
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_LIO, superio_init);
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
