From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 23 Sep 2004 22:28:41 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm2] Change irq.c driver to use
Message-Id: <2800000.1095978521@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74285628825545291=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2480000.1095978400@w-hlinder.beaverton.ibm.com>
In-Reply-To: <2480000.1095978400@w-hlinder.beaverton.ibm.com>
To: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org
Cc: greg@kroah.com, hannal@us.ibm.com, hpa@zytor.com, davej@codemonkey.org.uk

--===============74285628825545291==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


This code previously used the pci_get_device function only to find out if the
device was present, it did not use the pci_dev* that was returned. That was
what the new pci_dev_present function was created for.  I was able to compile
and boot this code to show it did not break anything.

Please consider for inclusion.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>
---
diff -Nrup linux-2.6.9-rc2-mm2cln/arch/i386/pci/irq.c linux-2.6.9-rc2-mm2patch2/arch/i386/pci/irq.c
--- linux-2.6.9-rc2-mm2cln/arch/i386/pci/irq.c	2004-09-23 11:48:52.000000000 -0700
+++ linux-2.6.9-rc2-mm2patch2/arch/i386/pci/irq.c	2004-09-23 14:20:41.376755760 -0700
@@ -455,18 +455,15 @@ static int pirq_bios_set(struct pci_dev 
 
 static __init int intel_router_probe(struct irq_router *r, struct pci_dev *router, u16 device)
 {
-	struct pci_dev *dev1, *dev2;
-
+	int ret1, ret2 = -1;
+	
 	/* 440GX has a proprietary PIRQ router -- don't use it */
-	dev1 = pci_get_device(PCI_VENDOR_ID_INTEL,
+	ret1 = pci_dev_present(PCI_VENDOR_ID_INTEL,
 				PCI_DEVICE_ID_INTEL_82443GX_0, NULL);
-	dev2 = pci_get_device(PCI_VENDOR_ID_INTEL,
+	ret2 = pci_dev_present(PCI_VENDOR_ID_INTEL,
 				PCI_DEVICE_ID_INTEL_82443GX_2, NULL);
-	if ((dev1 != NULL) || (dev2 != NULL)) {
-		pci_dev_put(dev1);
-		pci_dev_put(dev2);
+	if (ret1 || ret2) 
 		return 0;
-	}
 
 	switch(device)
 	{




--===============74285628825545291==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74285628825545291==--
