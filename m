From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 06:52:24 +0000
Subject: [Kernel-janitors] [PATCH -mm 1/9] pci_find_device to pci_get_device
Message-Id: <1095749544.3790.83.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58664943992932661=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58664943992932661==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use pci_get_device instead of pci_find_device as pci device returned
from pci_find_device can disappear at any momemt in time.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/e1000/e1000_main.c linux-2.6.9-rc2-mm1-dsf/drivers/net/e1000/e1000_main.c
--- linux-2.6.9-rc2-mm1/drivers/net/e1000/e1000_main.c	2004-09-20 22:36:24.000000000 -0700
+++ linux-2.6.9-rc2-mm1-dsf/drivers/net/e1000/e1000_main.c	2004-09-20 22:40:38.257365000 -0700
@@ -2803,7 +2803,7 @@ e1000_notify_reboot(struct notifier_bloc
 	case SYS_DOWN:
 	case SYS_HALT:
 	case SYS_POWER_OFF:
-		while((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
+		while((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
 			if(pci_dev_driver(pdev) == &e1000_driver)
 				e1000_suspend(pdev, 3);
 		}



--===============58664943992932661==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58664943992932661==--
