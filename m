From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 06:53:03 +0000
Subject: [Kernel-janitors] [PATCH -mm 6/9] pci_find_device to pci_get_device
Message-Id: <1095749582.3790.93.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58888520627092111=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58888520627092111==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use pci_get_device instead of pci_find_device as pci device returned
from pci_find_device can disappear at any momemt in time.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/sunhme.c linux-2.6.9-rc2-mm1-dsf/drivers/net/sunhme.c
--- linux-2.6.9-rc2-mm1/drivers/net/sunhme.c	2004-08-14 03:55:10.000000000 -0700
+++ linux-2.6.9-rc2-mm1-dsf/drivers/net/sunhme.c	2004-09-20 22:51:59.709768488 -0700
@@ -3311,7 +3311,7 @@ static int __init happy_meal_pci_probe(v
 	struct pci_dev *pdev = NULL;
 	int cards = 0;
 
-	while ((pdev = pci_find_device(PCI_VENDOR_ID_SUN,
+	while ((pdev = pci_get_device(PCI_VENDOR_ID_SUN,
 				       PCI_DEVICE_ID_SUN_HAPPYMEAL, pdev)) != NULL) {
 		if (pci_enable_device(pdev))
 			continue;



--===============58888520627092111==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58888520627092111==--
