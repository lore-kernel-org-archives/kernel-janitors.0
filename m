From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 12:51:55 +0000
Subject: [KJ] [PATCH] drivers/net/irda/*: convert to pci_register_driver
Message-Id: <20050213125155.GD15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="l+goss899txtYvYf"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>



--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_irda.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/irda/donauboe.c linux-2.6.11-rc3/drivers/net/irda/donauboe.c
--- linux-2.6.11-rc3-vanilla/drivers/net/irda/donauboe.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/irda/donauboe.c	2005-02-07 09:39:28.000000000 +0100
@@ -1776,7 +1776,7 @@ static struct pci_driver donauboe_pci_dr
 static int __init
 donauboe_init (void)
 {
-  return pci_module_init(&donauboe_pci_driver);
+  return pci_register_driver(&donauboe_pci_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/irda/vlsi_ir.c linux-2.6.11-rc3/drivers/net/irda/vlsi_ir.c
--- linux-2.6.11-rc3-vanilla/drivers/net/irda/vlsi_ir.c	2005-02-03 17:03:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/irda/vlsi_ir.c	2005-02-07 09:39:28.000000000 +0100
@@ -1885,7 +1885,7 @@ static int __init vlsi_mod_init(void)
 		vlsi_proc_root->owner = THIS_MODULE;
 	}
 
-	ret = pci_module_init(&vlsi_irda_driver);
+	ret = pci_register_driver(&vlsi_irda_driver);
 
 	if (ret && vlsi_proc_root)
 		remove_proc_entry(PROC_DIR, NULL);

--l+goss899txtYvYf
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--l+goss899txtYvYf--
