From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 08:11:22 +0000
Subject: [KJ] [PATCH] drivers/input/gameport/*: convert to
Message-Id: <20050208081122.GD31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xjyYRNSh/RebjC6o"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_input_gameport.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/input/gameport/cs461x.c linux-2.6.11-rc3/drivers/input/gameport/cs461x.c
--- linux-2.6.11-rc3-vanilla/drivers/input/gameport/cs461x.c	2005-02-03 17:03:45.000000000 +0100
+++ linux-2.6.11-rc3/drivers/input/gameport/cs461x.c	2005-02-07 09:39:27.000000000 +0100
@@ -320,7 +320,7 @@ static struct pci_driver cs461x_pci_driv
 
 int __init cs461x_init(void)
 {
-        return pci_module_init(&cs461x_pci_driver);
+        return pci_register_driver(&cs461x_pci_driver);
 }
 
 void __exit cs461x_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/input/gameport/emu10k1-gp.c linux-2.6.11-rc3/drivers/input/gameport/emu10k1-gp.c
--- linux-2.6.11-rc3-vanilla/drivers/input/gameport/emu10k1-gp.c	2004-12-24 22:34:58.000000000 +0100
+++ linux-2.6.11-rc3/drivers/input/gameport/emu10k1-gp.c	2005-02-07 09:39:27.000000000 +0100
@@ -120,7 +120,7 @@ static struct pci_driver emu_driver = {
 
 int __init emu_init(void)
 {
-	return pci_module_init(&emu_driver);
+	return pci_register_driver(&emu_driver);
 }
 
 void __exit emu_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/input/gameport/fm801-gp.c linux-2.6.11-rc3/drivers/input/gameport/fm801-gp.c
--- linux-2.6.11-rc3-vanilla/drivers/input/gameport/fm801-gp.c	2004-12-24 22:34:58.000000000 +0100
+++ linux-2.6.11-rc3/drivers/input/gameport/fm801-gp.c	2005-02-07 09:39:27.000000000 +0100
@@ -145,7 +145,7 @@ static struct pci_driver fm801_gp_driver
 
 int __init fm801_gp_init(void)
 {
-	return pci_module_init(&fm801_gp_driver);
+	return pci_register_driver(&fm801_gp_driver);
 }
 
 void __exit fm801_gp_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/input/gameport/vortex.c linux-2.6.11-rc3/drivers/input/gameport/vortex.c
--- linux-2.6.11-rc3-vanilla/drivers/input/gameport/vortex.c	2004-12-24 22:35:24.000000000 +0100
+++ linux-2.6.11-rc3/drivers/input/gameport/vortex.c	2005-02-07 09:39:27.000000000 +0100
@@ -174,7 +174,7 @@ static struct pci_driver vortex_driver =
 
 int __init vortex_init(void)
 {
-	return pci_module_init(&vortex_driver);
+	return pci_register_driver(&vortex_driver);
 }
 
 void __exit vortex_exit(void)

--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--xjyYRNSh/RebjC6o--
