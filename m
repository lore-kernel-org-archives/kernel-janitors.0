From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 20 Oct 2004 18:54:04 +0000
Subject: [KJ] [RFT 2.6] isoch.c: replace pci_find_device with pci_get_device
Message-Id: <18340000.1098298444@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0044508017077333761=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: Hanna Linder <hannal@us.ibm.com>, greg@kroah.com, davej@codemonkey.org.uk

--===============0044508017077333761==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away soon I have converted this file to use
pci_get_device instead. for_each_pci_dev is just a macro wrapper around
pci_get_device.  I have compile tested it. If anyone has this hardware
and could test it that would be great.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>
---
diff -Nrup linux-2.6.9cln/drivers/char/agp/isoch.c linux-2.6.9patch/drivers/char/agp/isoch.c
--- linux-2.6.9cln/drivers/char/agp/isoch.c	2004-10-18 16:35:52.000000000 -0700
+++ linux-2.6.9patch/drivers/char/agp/isoch.c	2004-10-19 16:02:16.634192424 -0700
@@ -347,7 +347,7 @@ int agp_3_5_enable(struct agp_bridge_dat
 	INIT_LIST_HEAD(head);
 
 	/* Find all AGP devices, and add them to dev_list. */
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		mcapndx = pci_find_capability(dev, PCI_CAP_ID_AGP);
 		if (mcapndx == 0)
 			continue;


--===============0044508017077333761==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0044508017077333761==--
