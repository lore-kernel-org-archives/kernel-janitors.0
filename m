From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 22:53:08 +0000
Subject: [KJ] [RFT 2.6] ret_mb_a_pci.c replace pci_find_device with
Message-Id: <87080000.1097275988@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============06332155045922927=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, uclinux-v850@lsi.nec.co.jp

--===============06332155045922927==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a v850 system could test it I would appreciate it.
Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/v850/kernel/rte_mb_a_pci.c linux-2.6.9-rc3-mm3patch/arch/v850/kernel/rte_mb_a_pci.c
--- linux-2.6.9-rc3-mm3cln/arch/v850/kernel/rte_mb_a_pci.c	2004-09-29 20:04:23.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch/arch/v850/kernel/rte_mb_a_pci.c	2004-10-08 15:39:44.793464832 -0700
@@ -254,7 +254,7 @@ static void __devinit pcibios_assign_res
 	struct pci_dev *dev = NULL;
 	struct resource *r;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		unsigned di_num;
 		unsigned class = dev->class >> 8;
 


--===============06332155045922927==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============06332155045922927==--
