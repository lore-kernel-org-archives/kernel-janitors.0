From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 20:46:51 +0000
Subject: [KJ] [PATCH 2.6] fixups-dreamcast.c replace pci_find_device with
Message-Id: <80460000.1097268411@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============094125367114040959=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com

--===============094125367114040959==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I've replaced it with pci_get_device and pci_dev_put.
If someone with a Dreamcast system could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/sh/drivers/pci/fixups-dreamcast.c linux-2.6.9-rc3-mm3patch/arch/sh/drivers/pci/fixups-dreamcast.c
--- linux-2.6.9-rc3-mm3cln/arch/sh/drivers/pci/fixups-dreamcast.c	2004-09-29 20:05:41.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch/arch/sh/drivers/pci/fixups-dreamcast.c	2004-10-08 13:34:31.097720208 -0700
@@ -62,7 +62,7 @@ void __init pcibios_fixup_irqs(void)
 {
 	struct pci_dev *dev = 0;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		/*
 		 * The interrupt routing semantics here are quite trivial.
 		 *



--===============094125367114040959==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============094125367114040959==--
