From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 20:17:19 +0000
Subject: [KJ] [PATCH 2.6] u3_iommu.c replace pci_find_device with
Message-Id: <78680000.1097266639@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34683044968123977=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <70860000.1097257256@w-hlinder.beaverton.ibm.com> <73910000.1097257899@w-hlinder.beaverton.ibm.com>
In-Reply-To: <73910000.1097257899@w-hlinder.beaverton.ibm.com>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Hanna Linder <hannal@us.ibm.com>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, paulus@samba.org, anton@samba.org

--===============34683044968123977==
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
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/u3_iommu.c linux-2.6.9-rc3-mm3patch2/arch/ppc64/kernel/u3_iommu.c
--- linux-2.6.9-rc3-mm3cln/arch/ppc64/kernel/u3_iommu.c	2004-09-29 20:05:52.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch2/arch/ppc64/kernel/u3_iommu.c	2004-10-08 13:10:06.883314632 -0700
@@ -290,7 +290,7 @@ void iommu_setup_u3(void)
 	/* We only have one iommu table on the mac for now, which makes
 	 * things simple. Setup all PCI devices to point to this table
 	 */
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		/* We must use pci_device_to_OF_node() to make sure that
 		 * we get the real "final" pointer to the device in the
 		 * pci_dev sysdata and not the temporary PHB one



--===============34683044968123977==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34683044968123977==--
