From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 06:52:54 +0000
Subject: [Kernel-janitors] [PATCH -mm 5/9] pci_find_device to pci_get_device
Message-Id: <1095749574.3790.91.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43399158407236316=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43399158407236316==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use pci_get_device instead of pci_find_device as pci device returned
from pci_find_device can disappear at any momemt in time.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/sis900.c linux-2.6.9-rc2-mm1-dsf/drivers/net/sis900.c
--- linux-2.6.9-rc2-mm1/drivers/net/sis900.c	2004-09-20 22:35:32.000000000 -0700
+++ linux-2.6.9-rc2-mm1-dsf/drivers/net/sis900.c	2004-09-20 22:39:02.339946664 -0700
@@ -262,9 +262,9 @@ static int __devinit sis630e_get_mac_add
 	u8 reg;
 	int i;
 
-	isa_bridge = pci_find_device(PCI_VENDOR_ID_SI, 0x0008, isa_bridge);
+	isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0008, isa_bridge);
 	if (!isa_bridge) {
-		isa_bridge = pci_find_device(PCI_VENDOR_ID_SI, 0x0018, isa_bridge);
+		isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0018, isa_bridge);
 		if (!isa_bridge) {
 			printk("%s: Can not find ISA bridge\n", net_dev->name);
 			return 0;
@@ -279,6 +279,7 @@ static int __devinit sis630e_get_mac_add
 	}
 	pci_write_config_byte(isa_bridge, 0x48, reg & ~0x40);
 
+	pci_dev_put(isa_bridge);
 	return 1;
 }
 
@@ -485,9 +486,11 @@ static int __devinit sis900_probe (struc
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



--===============43399158407236316==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43399158407236316==--
