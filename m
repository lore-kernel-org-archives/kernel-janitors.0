From: Hanna Linder <hannal@us.ibm.com>
Date: Mon, 04 Oct 2004 21:26:47 +0000
Subject: [Kernel-janitors] [PATCH 2.6] pci-hplj.c: replace pci_find_device
Message-Id: <281940000.1096925207@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4022049047194014=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, hannal@us.ibm.com, ralf@linux-mips.org

--===============4022049047194014==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



As pci_find_device is going away I have replaced this call with pci_get_device.
If  someone has access to an RM200 or RM300 and could test this I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>
---

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/mips/pci/pci-hplj.c linux-2.6.9-rc3-mm2patch/arch/mips/pci/pci-hplj.c
--- linux-2.6.9-rc3-mm2cln/arch/mips/pci/pci-hplj.c	2004-09-29 20:05:21.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch/arch/mips/pci/pci-hplj.c	2004-10-04 14:20:25.307153544 -0700
@@ -118,7 +118,7 @@ void __init pcibios_fixup_irqs(void)
 	struct pci_dev *dev = NULL;
 	int slot_num;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		slot_num = PCI_SLOT(dev->devfn);
 		switch (slot_num) {
 		case 2:



--===============4022049047194014==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4022049047194014==--
