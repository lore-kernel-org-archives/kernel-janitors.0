From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 06:52:46 +0000
Subject: [Kernel-janitors] [PATCH -mm 3/9] pci_find_device to pci_get_device
Message-Id: <1095749566.3790.87.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51067825638530762=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51067825638530762==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use pci_get_device instead of pci_find_device as pci device returned
from pci_find_device can disappear at any momemt in time.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/gt96100eth.c linux-2.6.9-rc2-mm1-dsf/drivers/net/gt96100eth.c
--- linux-2.6.9-rc2-mm1/drivers/net/gt96100eth.c	2004-09-20 22:35:32.000000000 -0700
+++ linux-2.6.9-rc2-mm1-dsf/drivers/net/gt96100eth.c	2004-09-20 22:39:02.320949552 -0700
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
 



--===============51067825638530762==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51067825638530762==--
