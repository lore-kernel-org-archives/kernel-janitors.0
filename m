From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 06 Oct 2004 20:23:28 +0000
Subject: [Kernel-janitors] [PATCH 2.6] [1/54] arch/i386/pci/i386.c: Use new
Message-Id: <3600000.1097094208@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15140268397812351=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: greg@kroah.com, hannal@us.ibm.com, kernel-janitors@lists.osdl.org, Christoph Hellwig <hch@infradead.org>

--===============15140268397812351==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As requested by Christoph Hellwig I've created a new macro called
for_each_pci_dev. It is a wrapper for this common use of pci_get/find_device:

(while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL))

This macro will return the pci_dev *for all pci devices.  Here is the first patch I 
used to test this macro with. Compiled and booted on my T23. There will be
53 more patches using this new macro.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/i386/pci/i386.c linux-2.6.9-rc3-mm2patch2/arch/i386/pci/i386.c
--- linux-2.6.9-rc3-mm2cln/arch/i386/pci/i386.c	2004-10-04 11:38:04.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch2/arch/i386/pci/i386.c	2004-10-06 12:25:50.449991552 -0700
@@ -124,7 +124,7 @@ static void __init pcibios_allocate_reso
 	u16 command;
 	struct resource *r, *pr;
 
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		pci_read_config_word(dev, PCI_COMMAND, &command);
 		for(idx = 0; idx < 6; idx++) {
 			r = &dev->resource[idx];
@@ -168,7 +168,7 @@ static int __init pcibios_assign_resourc
 	int idx;
 	struct resource *r;
 
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		int class = dev->class >> 8;
 
 		/* Don't touch classless devices and host bridges */




--===============15140268397812351==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15140268397812351==--
