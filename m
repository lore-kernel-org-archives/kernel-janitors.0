From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 06:52:50 +0000
Subject: [Kernel-janitors] [PATCH -mm 4/9] pci_find_device to pci_get_device
Message-Id: <1095749570.3790.89.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29184133716649097=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29184133716649097==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use pci_get_device instead of pci_find_device as pci device returned
from pci_find_device can disappear at any momemt in time.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/ixgb/ixgb_main.c linux-2.6.9-rc2-mm1-dsf/drivers/net/ixgb/ixgb_main.c
--- linux-2.6.9-rc2-mm1/drivers/net/ixgb/ixgb_main.c	2004-09-20 22:36:24.000000000 -0700
+++ linux-2.6.9-rc2-mm1-dsf/drivers/net/ixgb/ixgb_main.c	2004-09-20 22:49:55.329677136 -0700
@@ -2078,7 +2078,7 @@ ixgb_notify_reboot(struct notifier_block
 	case SYS_DOWN:
 	case SYS_HALT:
 	case SYS_POWER_OFF:
-		while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
+		while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
 			if (pci_dev_driver(pdev) == &ixgb_driver)
 				ixgb_suspend(pdev, 3);
 		}



--===============29184133716649097==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29184133716649097==--
