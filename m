From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 01 Oct 2004 18:10:54 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 pci_bus_cvlink.c] Replace
Message-Id: <112570000.1096654254@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============070444369228763931=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: greg@kroah.com, kernel-janitors@lists.osdl.org, Judith Lebzelter <judith@osdl.org>, davidm@hpl.hp.com, hannal@us.ibm.com, jbarnes@sgi.com

--===============070444369228763931==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away soon I have replaced the call with pci_get_device.
Judith, could you run these 3 ia64 ones through PLM, please? 

Thanks a lot.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc2-mm4cln/arch/ia64/sn/io/machvec/pci_bus_cvlink.c linux-2.6.9-rc2-mm4patch2/arch/ia64/sn/io/machvec/pci_bus_cvlink.c
--- linux-2.6.9-rc2-mm4cln/arch/ia64/sn/io/machvec/pci_bus_cvlink.c	2004-09-28 14:58:07.000000000 -0700
+++ linux-2.6.9-rc2-mm4patch2/arch/ia64/sn/io/machvec/pci_bus_cvlink.c	2004-09-30 16:56:57.454516072 -0700
@@ -904,7 +904,7 @@ sn_pci_init (void)
 	/*
 	 * Initialize the device vertex in the pci_dev struct.
 	 */
-	while ((pci_dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
+	while ((pci_dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
 		ret = sn_pci_fixup_slot(pci_dev);
 		if ( ret ) {
 			printk(KERN_WARNING


--===============070444369228763931==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============070444369228763931==--
