From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Mon, 27 Jun 2005 21:34:31 +0000
Subject: [KJ] [PATCH] drivers/net/pci-skeleton.c: MODULE_PARM -> module_param
Message-Id: <200506272134.31470.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_nDHwCwXd2lY1J1C"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_nDHwCwXd2lY1J1C
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

description:
Use module_param() instead of the old MODULE_PARM()

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--Boundary-00=_nDHwCwXd2lY1J1C
Content-Type: text/x-diff; charset="us-ascii";
	name="pci-skeleton_module_param.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="pci-skeleton_module_param.patch"

diff -Nru linux-2.6.12/drivers/net/pci-skeleton.c linux-2.6.12-devel/drivers/net/pci-skeleton.c
--- linux-2.6.12/drivers/net/pci-skeleton.c	2005-06-17 19:48:29.000000000 +0000
+++ linux-2.6.12-devel/drivers/net/pci-skeleton.c	2005-06-27 16:36:42.000000000 +0000
@@ -486,9 +486,9 @@
 MODULE_AUTHOR ("Jeff Garzik <jgarzik@pobox.com>");
 MODULE_DESCRIPTION ("Skeleton for a PCI Fast Ethernet driver");
 MODULE_LICENSE("GPL");
-MODULE_PARM (multicast_filter_limit, "i");
-MODULE_PARM (max_interrupt_work, "i");
-MODULE_PARM (media, "1-" __MODULE_STRING(8) "i");
+module_param(multicast_filter_limit, int, 0);
+module_param(max_interrupt_work, int, 0);
+module_param_array(media, int, NULL, 0);
 MODULE_PARM_DESC (multicast_filter_limit, "pci-skeleton maximum number of filtered multicast addresses");
 MODULE_PARM_DESC (max_interrupt_work, "pci-skeleton maximum events handled per interrupt");
 MODULE_PARM_DESC (media, "pci-skeleton: Bits 0-3: media type, bit 17: full duplex");

--Boundary-00=_nDHwCwXd2lY1J1C
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_nDHwCwXd2lY1J1C--
