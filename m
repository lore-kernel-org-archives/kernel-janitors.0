From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 17:40:19 +0000
Subject: [KJ] [PATCH 2.6] pSeries_iommu.c replace pci_find_device with
Message-Id: <70740000.1097257219@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============028374083718761822=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, paulus@samba.org, anton@samba.org

--===============028374083718761822==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a PPC64 system could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/iSeries_pci.c linux-2.6.9-rc3-mm3patch/arch/ppc64/kernel/iSeries_pci.c
--- linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/iSeries_pci.c	2004-09-29 20:05:52.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch/arch/ppc64/kernel/iSeries_pci.c	2004-10-08 10:20:56.576395832 -0700
@@ -216,8 +216,7 @@ void __init iSeries_pci_final_fixup(void
 	mf_displaySrc(0xC9000100);
 
 	printk("pcibios_final_fixup\n");
-	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))
-			!= NULL) {
+	for_each_pci_dev(pdev) {
 		node = find_Device_Node(pdev->bus->number, pdev->devfn);
 		printk("pci dev %p (%x.%x), node %p\n", pdev,
 		       pdev->bus->number, pdev->devfn, node);


--===============028374083718761822==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============028374083718761822==--
