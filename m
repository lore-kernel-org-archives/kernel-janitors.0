From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 07 Oct 2004 23:43:36 +0000
Subject: [Kernel-janitors] [PATCH 2.6][12/12] sandpoint.c replace
Message-Id: <36050000.1097192616@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1827345683638677=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, paulus@samba.org, benh@kernel.crashing.org

--===============1827345683638677==
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
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/ppc/platforms/sandpoint.c linux-2.6.9-rc3-mm3patch3/arch/ppc/platforms/sandpoint.c
--- linux-2.6.9-rc3-mm3cln/arch/ppc/platforms/sandpoint.c	2004-09-29 20:06:04.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch3/arch/ppc/platforms/sandpoint.c	2004-10-07 16:36:52.946102904 -0700
@@ -531,7 +531,7 @@ static unsigned long	sandpoint_idedma_re
 static void
 sandpoint_ide_probe(void)
 {
-	struct pci_dev *pdev = pci_find_device(PCI_VENDOR_ID_WINBOND,
+	struct pci_dev *pdev = pci_get_device(PCI_VENDOR_ID_WINBOND,
 			PCI_DEVICE_ID_WINBOND_82C105, NULL);
 
 	if (pdev) {
@@ -540,6 +540,7 @@ sandpoint_ide_probe(void)
 		sandpoint_ide_ctl_regbase[0]=pdev->resource[1].start;
 		sandpoint_ide_ctl_regbase[1]=pdev->resource[3].start;
 		sandpoint_idedma_regbase=pdev->resource[4].start;
+		pci_dev_put(dev);
 	}
 
 	sandpoint_ide_ports_known = 1;


--===============1827345683638677==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1827345683638677==--
