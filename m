From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 20 Oct 2004 18:53:01 +0000
Subject: [KJ] [RFT 2.6] intel-mch-agp.c: replace pci_find_device with
Message-Id: <17860000.1098298381@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91103874994209821=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: Hanna Linder <hannal@us.ibm.com>, greg@kroah.com, davej@codemonkey.org.uk

--===============91103874994209821==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away soon I have converted this file to use
pci_get_device instead. I have compile tested it. If anyone has this hardware
and could test it that would be great.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>
---

diff -Nrup linux-2.6.9cln/drivers/char/agp/intel-mch-agp.c linux-2.6.9patch3/drivers/char/agp/intel-mch-agp.c
--- linux-2.6.9cln/drivers/char/agp/intel-mch-agp.c	2004-10-18 16:35:52.000000000 -0700
+++ linux-2.6.9patch3/drivers/char/agp/intel-mch-agp.c	2004-10-18 17:23:22.000000000 -0700
@@ -470,9 +470,9 @@ static int find_i830(u16 device)
 {
 	struct pci_dev *i830_dev;
 
-	i830_dev = pci_find_device(PCI_VENDOR_ID_INTEL, device, NULL);
+	i830_dev = pci_get_device(PCI_VENDOR_ID_INTEL, device, NULL);
 	if (i830_dev && PCI_FUNC(i830_dev->devfn) != 0) {
-		i830_dev = pci_find_device(PCI_VENDOR_ID_INTEL,
+		i830_dev = pci_get_device(PCI_VENDOR_ID_INTEL,
 				device, i830_dev);
 	}
 
@@ -565,6 +565,7 @@ static void __devexit agp_intelmch_remov
 {
 	struct agp_bridge_data *bridge = pci_get_drvdata(pdev);
 
+	pci_dev_put(pdev);
 	agp_remove_bridge(bridge);
 	agp_put_bridge(bridge);
 }


--===============91103874994209821==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91103874994209821==--
