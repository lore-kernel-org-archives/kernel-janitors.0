From: Richard <h.vanberkum@chello.nl>
Date: Mon, 03 Jul 2006 22:52:52 +0000
Subject: [KJ] [PATCH] drivers/char/mxser.c: check request_region()
Message-Id: <44A9BD91.4010002@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Check return value of request_region and release already requested region if the
second fails

Signed-of-by: Richard van Berkum

--- janitor-2.6/drivers/char/mxser.c	2006-07-01 11:54:45.895077096 +0200
+++ mytree/drivers/char/mxser.c	2006-07-04 02:52:17.965040344 +0200
@@ -642,16 +642,24 @@ static int mxser_get_PCI_conf(int busnum
 	hwconf->board_type = board_type;
 	hwconf->ports = mxser_numports[board_type - 1];
 	ioaddress = pci_resource_start(pdev, 2);
-	request_region(pci_resource_start(pdev, 2), pci_resource_len(pdev, 2),
-			"mxser(IO)");
+	if(!(request_region(pci_resource_start(pdev, 2), pci_resource_len(pdev, 2),
+			"mxser(IO)"))){
+		printk(KERN_ERR "mxser: I/O ports already in use\n");
+		return (-EIO);
+	}
+

 	for (i = 0; i < hwconf->ports; i++)
 		hwconf->ioaddr[i] = ioaddress + 8 * i;

 	/* vector */
 	ioaddress = pci_resource_start(pdev, 3);
-	request_region(pci_resource_start(pdev, 3), pci_resource_len(pdev, 3),
-			"mxser(vector)");
+	if(!(request_region(pci_resource_start(pdev, 3), pci_resource_len(pdev, 3),
+			"mxser(vector)"))){
+		printk(KERN_ERR "mxser: I/O ports already in use\n");
+		goto out;
+	}
+	
 	hwconf->vector = ioaddress;

 	/* irq */
@@ -691,6 +699,10 @@ static int mxser_get_PCI_conf(int busnum
 		hwconf->baud_base[i] = 921600;
 	}
 	return 0;
+out:
+	release_region(pci_resource_start(pdev, 2), pci_resource_len(pdev, 2));
+	return (-EIO);
+
 }
 #endif

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
