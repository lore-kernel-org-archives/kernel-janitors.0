From: Hanna Linder <hannal@us.ibm.com>
Date: Mon, 04 Oct 2004 22:58:01 +0000
Subject: [Kernel-janitors] [PATCH 2.6][1/12] arch/ppc/kernel/pci.c replace
Message-Id: <298570000.1096930681@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27040213730151175=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, hannal@us.ibm.com, paulus@samba.org, benh@kernel.crashing.org

--===============27040213730151175==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I have replaced this call with pci_get_device.
If someone with a PPC system could verify it I would appreciate it. This is the only
one in ppc/kernel all the others are under ppc/platform. There will be 12 total.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/ppc/kernel/pci.c linux-2.6.9-rc3-mm2patch/arch/ppc/kernel/pci.c
--- linux-2.6.9-rc3-mm2cln/arch/ppc/kernel/pci.c	2004-10-04 11:38:04.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch/arch/ppc/kernel/pci.c	2004-10-04 14:36:09.000000000 -0700
@@ -503,7 +503,7 @@ pcibios_allocate_resources(int pass)
 	u16 command;
 	struct resource *r;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		pci_read_config_word(dev, PCI_COMMAND, &command);
 		for (idx = 0; idx < 6; idx++) {
 			r = &dev->resource[idx];
@@ -540,7 +540,7 @@ pcibios_assign_resources(void)
 	int idx;
 	struct resource *r;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		int class = dev->class >> 8;
 
 		/* Don't touch classless devices and host bridges */
@@ -866,7 +866,7 @@ pci_device_from_OF_node(struct device_no
 	 */
 	if (!pci_to_OF_bus_map)
 		return 0;
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		if (pci_to_OF_bus_map[dev->bus->number] != *bus)
 			continue;
 		if (dev->devfn != *devfn)


--===============27040213730151175==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27040213730151175==--
