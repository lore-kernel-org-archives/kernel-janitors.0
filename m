From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 07 Oct 2004 23:10:06 +0000
Subject: [Kernel-janitors] [PATCH 2.6][8/12] pmac_pci.c replace
Message-Id: <31870000.1097190606@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75789459062469755=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, paulus@samba.org, benh@kernel.crashing.org

--===============75789459062469755==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a PPC system could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/ppc/platforms/pmac_pci.c linux-2.6.9-rc3-mm3patch/arch/ppc/platforms/pmac_pci.c
--- linux-2.6.9-rc3-mm3cln/arch/ppc/platforms/pmac_pci.c	2004-10-07 15:54:30.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch/arch/ppc/platforms/pmac_pci.c	2004-10-07 16:01:41.000000000 -0700
@@ -889,7 +889,7 @@ pcibios_fixup_OF_interrupts(void)
 	 * should find the device node and apply the interrupt
 	 * obtained from the OF device-tree
 	 */
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		struct device_node *node;
 		node = pci_device_to_OF_node(dev);
 		/* this is the node, see if it has interrupts */
@@ -989,7 +989,7 @@ pmac_pcibios_after_init(void)
 	 *
 	 * -- BenH
 	 */
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		if ((dev->class >> 16) == PCI_BASE_CLASS_STORAGE)
 			pci_enable_device(dev);
 	}


--===============75789459062469755==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75789459062469755==--
