From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 17:51:39 +0000
Subject: [KJ] [PATCH 2.6] iSeries_pci.c replace pci_find_device with
Message-Id: <73910000.1097257899@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85795453086372175=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <70860000.1097257256@w-hlinder.beaverton.ibm.com>
In-Reply-To: <70860000.1097257256@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Hanna Linder <hannal@us.ibm.com>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, paulus@samba.org, anton@samba.org

--===============85795453086372175==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I've replaced it with pci_get_device and pci_dev_put.
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


--===============85795453086372175==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85795453086372175==--
