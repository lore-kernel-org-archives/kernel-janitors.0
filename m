From: Christophe Lucas <c.lucas@ifrance.com>
Date: Fri, 11 Feb 2005 08:30:18 +0000
Subject: [KJ] [PATCH] drivers/scsi/aic7xxx/*: convert to pci_register_driver
Message-Id: <20050211083018.GD28942@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="aT9PWwzfKXlsBJM1"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_scsi_aic7xxx.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/aic7xxx/aic79xx_osm_pci.c linux-2.6.11-rc3/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/aic7xxx/aic79xx_osm_pci.c	2004-12-24 22:34:29.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/aic7xxx/aic79xx_osm_pci.c	2005-02-07 09:39:29.000000000 +0100
@@ -209,7 +209,7 @@ ahd_linux_pci_dev_probe(struct pci_dev *
 int
 ahd_linux_pci_init(void)
 {
-	return (pci_module_init(&aic79xx_pci_driver));
+	return (pci_register_driver(&aic79xx_pci_driver));
 }
 
 void
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c linux-2.6.11-rc3/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c	2005-02-03 17:03:55.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c	2005-02-07 09:39:29.000000000 +0100
@@ -252,7 +252,7 @@ int
 ahc_linux_pci_init(void)
 {
 	/* Translate error or zero return into zero or one */
-	return pci_module_init(&aic7xxx_pci_driver) ? 0 : 1;
+	return pci_register_driver(&aic7xxx_pci_driver) ? 0 : 1;
 }
 
 void

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--aT9PWwzfKXlsBJM1--
