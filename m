From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 12:49:05 +0000
Subject: [KJ] [PATCH] drivers/net/e1000/*: convert to pci_register_driver
Message-Id: <20050213124905.GC15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="imjhCm/Pyz7Rq5F2"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_e1000.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/e1000/e1000_main.c linux-2.6.11-rc3/drivers/net/e1000/e1000_main.c
--- linux-2.6.11-rc3-vanilla/drivers/net/e1000/e1000_main.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/e1000/e1000_main.c	2005-02-07 09:39:28.000000000 +0100
@@ -222,7 +222,7 @@ e1000_init_module(void)
 
 	printk(KERN_INFO "%s\n", e1000_copyright);
 
-	ret = pci_module_init(&e1000_driver);
+	ret = pci_register_driver(&e1000_driver);
 	if(ret >= 0) {
 		register_reboot_notifier(&e1000_notifier_reboot);
 	}

--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--imjhCm/Pyz7Rq5F2--
