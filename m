From: Christophe Lucas <c.lucas@ifrance.com>
Date: Fri, 11 Feb 2005 08:33:06 +0000
Subject: [KJ] [PATCH] drivers/scsi/qla2xxx/*: convert to pci_register_driver
Message-Id: <20050211083306.GF28942@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="phCU5ROyZO6kBE05"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_scsi_qla2xxx.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql2100.c linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql2100.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql2100.c	2004-12-24 22:34:32.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql2100.c	2005-02-07 09:39:30.000000000 +0100
@@ -74,7 +74,7 @@ static struct pci_driver qla2100_pci_dri
 static int __init
 qla2100_init(void)
 {
-	return pci_module_init(&qla2100_pci_driver);
+	return pci_register_driver(&qla2100_pci_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql2200.c linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql2200.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql2200.c	2004-12-24 22:33:47.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql2200.c	2005-02-07 09:39:30.000000000 +0100
@@ -74,7 +74,7 @@ static struct pci_driver qla2200_pci_dri
 static int __init
 qla2200_init(void)
 {
-	return pci_module_init(&qla2200_pci_driver);
+	return pci_register_driver(&qla2200_pci_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql2300.c linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql2300.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql2300.c	2005-02-03 17:03:56.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql2300.c	2005-02-07 09:39:30.000000000 +0100
@@ -85,7 +85,7 @@ static struct pci_driver qla2300_pci_dri
 static int __init
 qla2300_init(void)
 {
-	return pci_module_init(&qla2300_pci_driver);
+	return pci_register_driver(&qla2300_pci_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql2322.c linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql2322.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql2322.c	2004-12-24 22:34:30.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql2322.c	2005-02-07 09:39:30.000000000 +0100
@@ -90,7 +90,7 @@ static struct pci_driver qla2322_pci_dri
 static int __init
 qla2322_init(void)
 {
-	return pci_module_init(&qla2322_pci_driver);
+	return pci_register_driver(&qla2322_pci_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql6312.c linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql6312.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/qla2xxx/ql6312.c	2005-02-03 17:03:57.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/qla2xxx/ql6312.c	2005-02-07 09:39:30.000000000 +0100
@@ -84,7 +84,7 @@ static struct pci_driver qla6312_pci_dri
 static int __init
 qla6312_init(void)
 {
-	return pci_module_init(&qla6312_pci_driver);
+	return pci_register_driver(&qla6312_pci_driver);
 }
 
 static void __exit

--phCU5ROyZO6kBE05
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--phCU5ROyZO6kBE05--
