From: Christophe Lucas <c.lucas@ifrance.com>
Date: Tue, 08 Feb 2005 08:44:54 +0000
Subject: [KJ] [PATCH] drivers/isdn/hardware/avm/*: convert to
Message-Id: <20050208084454.GH31996@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="opg8F0UgoHELSI+9"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--opg8F0UgoHELSI+9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--opg8F0UgoHELSI+9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_isdn_hardware_avm.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/avm/b1pci.c linux-2.6.11-rc3/drivers/isdn/hardware/avm/b1pci.c
--- linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/avm/b1pci.c	2004-12-24 22:33:49.000000000 +0100
+++ linux-2.6.11-rc3/drivers/isdn/hardware/avm/b1pci.c	2005-02-07 09:39:27.000000000 +0100
@@ -391,7 +391,7 @@ static int __init b1pci_init(void)
 		strcpy(rev, "1.0");
 
 
-	err = pci_module_init(&b1pci_pci_driver);
+	err = pci_register_driver(&b1pci_pci_driver);
 	if (!err) {
 		strlcpy(capi_driver_b1pci.revision, rev, 32);
 		register_capi_driver(&capi_driver_b1pci);
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/avm/c4.c linux-2.6.11-rc3/drivers/isdn/hardware/avm/c4.c
--- linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/avm/c4.c	2004-12-24 22:34:58.000000000 +0100
+++ linux-2.6.11-rc3/drivers/isdn/hardware/avm/c4.c	2005-02-07 09:39:27.000000000 +0100
@@ -1288,7 +1288,7 @@ static int __init c4_init(void)
 	} else
 		strcpy(rev, "1.0");
 
-	err = pci_module_init(&c4_pci_driver);
+	err = pci_register_driver(&c4_pci_driver);
 	if (!err) {
 		strlcpy(capi_driver_c2.revision, rev, 32);
 		register_capi_driver(&capi_driver_c2);
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/avm/t1pci.c linux-2.6.11-rc3/drivers/isdn/hardware/avm/t1pci.c
--- linux-2.6.11-rc3-vanilla/drivers/isdn/hardware/avm/t1pci.c	2004-12-24 22:34:00.000000000 +0100
+++ linux-2.6.11-rc3/drivers/isdn/hardware/avm/t1pci.c	2005-02-07 09:39:27.000000000 +0100
@@ -241,7 +241,7 @@ static int __init t1pci_init(void)
 	} else
 		strcpy(rev, "1.0");
 
-	err = pci_module_init(&t1pci_pci_driver);
+	err = pci_register_driver(&t1pci_pci_driver);
 	if (!err) {
 		strlcpy(capi_driver_t1pci.revision, rev, 32);
 		register_capi_driver(&capi_driver_t1pci);

--opg8F0UgoHELSI+9
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--opg8F0UgoHELSI+9--
