From: Hanna Linder <hannal@us.ibm.com>
Date: Mon, 04 Oct 2004 23:21:12 +0000
Subject: [Kernel-janitors] [PATCH 2.6] [2/12] chrp_pci.c replace
Message-Id: <303220000.1096932072@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80317640404686053=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, paulus@samba.org, benh@kernel.crashing.org

--===============80317640404686053==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I have replaced this call with pci_get_device.
If someone with a PPC system could verify it I would appreciate it.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

----
diff -Nrup linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/chrp_pci.c linux-2.6.9-rc3-mm2patch/arch/ppc/platforms/chrp_pci.c
--- linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/chrp_pci.c	2004-09-29 20:06:04.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch/arch/ppc/platforms/chrp_pci.c	2004-10-04 16:07:45.279128992 -0700
@@ -158,7 +158,7 @@ chrp_pcibios_fixup(void)
 	struct device_node *np;
 
 	/* PCI interrupts are controlled by the OpenPIC */
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		np = pci_device_to_OF_node(dev);
 		if ((np != 0) && (np->n_intrs > 0) && (np->intrs[0].line != 0))
 			dev->irq = np->intrs[0].line;



--===============80317640404686053==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80317640404686053==--
