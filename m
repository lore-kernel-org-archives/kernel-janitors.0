From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 20 Oct 2004 18:52:14 +0000
Subject: [KJ] [RFT 2.6] intel-agp.c: replace pci_find_device with
Message-Id: <17420000.1098298334@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71462877095243105=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: Hanna Linder <hannal@us.ibm.com>, greg@kroah.com, davej@codemonkey.org.uk

--===============71462877095243105==
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

diff -Nrup linux-2.6.9cln/drivers/char/agp/intel-agp.c linux-2.6.9patch2/drivers/char/agp/intel-agp.c
--- linux-2.6.9cln/drivers/char/agp/intel-agp.c	2004-10-18 16:35:52.000000000 -0700
+++ linux-2.6.9patch2/drivers/char/agp/intel-agp.c	2004-10-19 16:05:47.000000000 -0700
@@ -1493,7 +1493,7 @@ static int find_i810(u16 device)
 {
 	struct pci_dev *i810_dev;
 
-	i810_dev = pci_find_device(PCI_VENDOR_ID_INTEL, device, NULL);
+	i810_dev = pci_get_device(PCI_VENDOR_ID_INTEL, device, NULL);
 	if (!i810_dev)
 		return 0;
 	intel_i810_private.i810_dev = i810_dev;
@@ -1504,9 +1504,9 @@ static int find_i830(u16 device)
 {
 	struct pci_dev *i830_dev;
 
-	i830_dev = pci_find_device(PCI_VENDOR_ID_INTEL, device, NULL);
+	i830_dev = pci_get_device(PCI_VENDOR_ID_INTEL, device, NULL);
 	if (i830_dev && PCI_FUNC(i830_dev->devfn) != 0) {
-		i830_dev = pci_find_device(PCI_VENDOR_ID_INTEL,
+		i830_dev = pci_get_device(PCI_VENDOR_ID_INTEL,
 				device, i830_dev);
 	}
 
@@ -1715,6 +1715,7 @@ static void __devexit agp_intel_remove(s
 {
 	struct agp_bridge_data *bridge = pci_get_drvdata(pdev);
 
+	pci_dev_put(pdev);
 	agp_remove_bridge(bridge);
 	agp_put_bridge(bridge);
 }



--===============71462877095243105==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71462877095243105==--
