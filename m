From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 12:53:45 +0000
Subject: [KJ] [PATCH] drivers/net/ixgb/*: convert to pci_register_driver
Message-Id: <20050213125345.GE15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="lHGcFxmlz1yfXmOs"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_ixgb.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/ixgb/ixgb_main.c linux-2.6.11-rc3/drivers/net/ixgb/ixgb_main.c
--- linux-2.6.11-rc3-vanilla/drivers/net/ixgb/ixgb_main.c	2005-02-03 17:03:50.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/ixgb/ixgb_main.c	2005-02-07 09:39:28.000000000 +0100
@@ -171,7 +171,7 @@ ixgb_init_module(void)
 
 	printk(KERN_INFO "%s\n", ixgb_copyright);
 
-	ret = pci_module_init(&ixgb_driver);
+	ret = pci_register_driver(&ixgb_driver);
 	if(ret >= 0) {
 		register_reboot_notifier(&ixgb_notifier_reboot);
 	}

--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--lHGcFxmlz1yfXmOs--
