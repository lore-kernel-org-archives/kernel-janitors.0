From: Scott Feldman <sfeldma@pobox.com>
Date: Sun, 03 Oct 2004 06:19:31 +0000
Subject: [Kernel-janitors] [PATCH 2/6] janitor: net/gt96100eth:
Message-Id: <1096784371.3819.157.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65809540603249483=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org, stevel@mvista.com, source@mvista.com, linux-mips@linux-mips.org

--===============65809540603249483==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Replace pci_find_device with pci_get_device/pci_dev_put to plug
race with pci_find_device.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

--- linux-2.6.9-rc3/drivers/net/gt96100eth.c	2004-10-02 21:17:24.000000000 -0700
+++ linux-2.6.9-rc3-dsf/drivers/net/gt96100eth.c	2004-10-02 21:23:57.000000000 -0700
@@ -617,9 +617,9 @@ static int gt96100_init_module(void)
 	/*
 	 * Stupid probe because this really isn't a PCI device
 	 */
-	if (!(pci = pci_find_device(PCI_VENDOR_ID_MARVELL,
+	if (!(pci = pci_get_device(PCI_VENDOR_ID_MARVELL,
 	                            PCI_DEVICE_ID_MARVELL_GT96100, NULL)) &&
-	    !(pci = pci_find_device(PCI_VENDOR_ID_MARVELL,
+	    !(pci = pci_get_device(PCI_VENDOR_ID_MARVELL,
 		                    PCI_DEVICE_ID_MARVELL_GT96100A, NULL))) {
 		printk(KERN_ERR __FILE__ ": GT96100 not found!\n");
 		return -ENODEV;
@@ -629,12 +629,14 @@ static int gt96100_init_module(void)
 	if (cpuConfig & (1<<12)) {
 		printk(KERN_ERR __FILE__
 		       ": must be in Big Endian mode!\n");
+		pci_dev_put(pci);
 		return -ENODEV;
 	}
 
 	for (i=0; i < NUM_INTERFACES; i++)
 		retval |= gt96100_probe1(pci, i);
 
+	pci_dev_put(pci);
 	return retval;
 }
 



--===============65809540603249483==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65809540603249483==--
