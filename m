From: Scott Feldman <sfeldma@pobox.com>
Date: Sun, 03 Oct 2004 06:19:51 +0000
Subject: [Kernel-janitors] [PATCH 4/6] janitor: net/sis900: pci_find_device
Message-Id: <1096784391.3819.161.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16041547413645496=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16041547413645496==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Replace pci_find_device with pci_get_device/pci_dev_put to plug
race with pci_find_device.  Compile tested.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

--- linux-2.6.9-rc3/drivers/net/sis900.c	2004-10-02 21:17:24.000000000 -0700
+++ linux-2.6.9-rc3-dsf/drivers/net/sis900.c	2004-10-02 21:29:07.000000000 -0700
@@ -262,13 +262,12 @@ static int __devinit sis630e_get_mac_add
 	u8 reg;
 	int i;
 
-	isa_bridge = pci_find_device(PCI_VENDOR_ID_SI, 0x0008, isa_bridge);
+	isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0008, isa_bridge);
+	if (!isa_bridge)
+		isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0018, isa_bridge);
 	if (!isa_bridge) {
-		isa_bridge = pci_find_device(PCI_VENDOR_ID_SI, 0x0018, isa_bridge);
-		if (!isa_bridge) {
-			printk("%s: Can not find ISA bridge\n", net_dev->name);
-			return 0;
-		}
+		printk("%s: Can not find ISA bridge\n", net_dev->name);
+		return 0;
 	}
 	pci_read_config_byte(isa_bridge, 0x48, &reg);
 	pci_write_config_byte(isa_bridge, 0x48, reg | 0x40);
@@ -278,6 +277,7 @@ static int __devinit sis630e_get_mac_add
 		((u8 *)(net_dev->dev_addr))[i] = inb(0x71); 
 	}
 	pci_write_config_byte(isa_bridge, 0x48, reg & ~0x40);
+	pci_dev_put(isa_bridge);
 
 	return 1;
 }
@@ -485,9 +485,11 @@ static int __devinit sis900_probe (struc
 	}
 
 	/* save our host bridge revision */
-	dev = pci_find_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_630, NULL);
-	if (dev)
+	dev = pci_get_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_630, NULL);
+	if (dev) {
 		pci_read_config_byte(dev, PCI_CLASS_REVISION, &sis_priv->host_bridge_rev);
+		pci_dev_put(dev);
+	}
 
 	/* print some information about our NIC */
 	printk(KERN_INFO "%s: %s at %#lx, IRQ %d, ", net_dev->name,



--===============16041547413645496==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16041547413645496==--
