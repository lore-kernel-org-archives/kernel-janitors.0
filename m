From: Hanna Linder <hannal@us.ibm.com>
Date: Mon, 04 Oct 2004 23:55:14 +0000
Subject: [Kernel-janitors] [PATCH 2.6] [3/12] gemini_pci.c replace
Message-Id: <307270000.1096934114@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68038363867443974=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, paulus@samba.org, benh@kernel.crashing.org

--===============68038363867443974==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away I have replaced this call with pci_get_device.
If someone with a PPC system could verify it I would appreciate it.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

----

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/gemini_pci.c linux-2.6.9-rc3-mm2patch/arch/ppc/platforms/gemini_pci.c
--- linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/gemini_pci.c	2004-09-29 20:04:25.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch/arch/ppc/platforms/gemini_pci.c	2004-10-04 16:49:59.270903688 -0700
@@ -15,7 +15,7 @@ void __init gemini_pcibios_fixup(void)
 	int i;
 	struct pci_dev *dev = NULL;
 	
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		for(i = 0; i < 6; i++) {
 			if (dev->resource[i].flags & IORESOURCE_IO) {
 				dev->resource[i].start |= (0xfe << 24);


--===============68038363867443974==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68038363867443974==--
