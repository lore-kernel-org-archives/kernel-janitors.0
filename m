From: Christophe Lucas <c.lucas@ifrance.com>
Date: Fri, 11 Feb 2005 08:28:08 +0000
Subject: [KJ] [PATCH] drivers/scsi/*: convert to pci_register_driver
Message-Id: <20050211082808.GB28942@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_scsi.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/3w-9xxx.c linux-2.6.11-rc3/drivers/scsi/3w-9xxx.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/3w-9xxx.c	2004-12-24 22:35:28.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/3w-9xxx.c	2005-02-07 09:39:29.000000000 +0100
@@ -2141,7 +2141,7 @@ static int __init twa_init(void)
 {
 	printk(KERN_WARNING "3ware 9000 Storage Controller device driver for Linux v%s.\n", twa_driver_version);
 
-	return pci_module_init(&twa_driver);
+	return pci_register_driver(&twa_driver);
 } /* End twa_init() */
 
 /* This function is called on driver exit */
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/3w-xxxx.c linux-2.6.11-rc3/drivers/scsi/3w-xxxx.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/3w-xxxx.c	2004-12-24 22:35:28.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/3w-xxxx.c	2005-02-07 09:39:29.000000000 +0100
@@ -2486,7 +2486,7 @@ static int __init tw_init(void)
 {
 	printk(KERN_WARNING "3ware Storage Controller device driver for Linux v%s.\n", TW_DRIVER_VERSION);
 
-	return pci_module_init(&tw_driver);
+	return pci_register_driver(&tw_driver);
 } /* End tw_init() */
 
 /* This function is called on driver exit */
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/a100u2w.c linux-2.6.11-rc3/drivers/scsi/a100u2w.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/a100u2w.c	2004-12-24 22:35:01.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/a100u2w.c	2005-02-07 09:39:29.000000000 +0100
@@ -1186,7 +1186,7 @@ static struct pci_driver inia100_pci_dri
 
 static int __init inia100_init(void)
 {
-	return pci_module_init(&inia100_pci_driver);
+	return pci_register_driver(&inia100_pci_driver);
 }
 
 static void __exit inia100_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/ahci.c linux-2.6.11-rc3/drivers/scsi/ahci.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/ahci.c	2005-02-03 17:03:55.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/ahci.c	2005-02-07 09:39:29.000000000 +0100
@@ -1020,7 +1020,7 @@ err_out:
 
 static int __init ahci_init(void)
 {
-	return pci_module_init(&ahci_pci_driver);
+	return pci_register_driver(&ahci_pci_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/ata_piix.c linux-2.6.11-rc3/drivers/scsi/ata_piix.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/ata_piix.c	2005-02-03 17:03:55.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/ata_piix.c	2005-02-07 09:39:29.000000000 +0100
@@ -658,7 +658,7 @@ static int __init piix_init(void)
 	int rc;
 
 	DPRINTK("pci_module_init\n");
-	rc = pci_module_init(&piix_pci_driver);
+	rc = pci_register_driver(&piix_pci_driver);
 	if (rc)
 		return rc;
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/atp870u.c linux-2.6.11-rc3/drivers/scsi/atp870u.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/atp870u.c	2004-12-24 22:34:32.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/atp870u.c	2005-02-07 09:39:29.000000000 +0100
@@ -2721,7 +2721,7 @@ static struct pci_driver atp870u_driver 
 
 static int __init atp870u_init(void)
 {
-	return pci_module_init(&atp870u_driver);
+	return pci_register_driver(&atp870u_driver);
 }
 
 static void __exit atp870u_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/dc395x.c linux-2.6.11-rc3/drivers/scsi/dc395x.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/dc395x.c	2004-12-24 22:34:00.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/dc395x.c	2005-02-07 09:39:29.000000000 +0100
@@ -4898,7 +4898,7 @@ static struct pci_driver dc395x_driver =
  **/
 static int __init dc395x_module_init(void)
 {
-	return pci_module_init(&dc395x_driver);
+	return pci_register_driver(&dc395x_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/dmx3191d.c linux-2.6.11-rc3/drivers/scsi/dmx3191d.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/dmx3191d.c	2004-12-24 22:34:58.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/dmx3191d.c	2005-02-07 09:39:29.000000000 +0100
@@ -157,7 +157,7 @@ static struct pci_driver dmx3191d_pci_dr
 
 static int __init dmx3191d_init(void)
 {
-	return pci_module_init(&dmx3191d_pci_driver);
+	return pci_register_driver(&dmx3191d_pci_driver);
 }
 
 static void __exit dmx3191d_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/ipr.c linux-2.6.11-rc3/drivers/scsi/ipr.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/ipr.c	2005-02-03 17:03:56.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/ipr.c	2005-02-07 09:39:29.000000000 +0100
@@ -6031,7 +6031,7 @@ static int __init ipr_init(void)
 	ipr_info("IBM Power RAID SCSI Device Driver version: %s %s\n",
 		 IPR_DRIVER_VERSION, IPR_DRIVER_DATE);
 
-	return pci_module_init(&ipr_driver);
+	return pci_register_driver(&ipr_driver);
 }
 
 /**
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/ips.c linux-2.6.11-rc3/drivers/scsi/ips.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/ips.c	2004-12-24 22:33:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/ips.c	2005-02-07 09:39:30.000000000 +0100
@@ -7084,7 +7084,7 @@ ips_remove_device(struct pci_dev *pci_de
 static int __init
 ips_module_init(void)
 {
-	if (pci_module_init(&ips_pci_driver) < 0)
+	if (pci_register_driver(&ips_pci_driver) < 0)
 		return -ENODEV;
 	ips_driver_template.module = THIS_MODULE;
 	ips_order_controllers();
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/megaraid.c linux-2.6.11-rc3/drivers/scsi/megaraid.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/megaraid.c	2005-02-03 17:03:56.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/megaraid.c	2005-02-07 09:39:30.000000000 +0100
@@ -5079,7 +5079,7 @@ static int __init megaraid_init(void)
 				"megaraid: failed to create megaraid root\n");
 	}
 #endif
-	error = pci_module_init(&megaraid_pci_driver);
+	error = pci_register_driver(&megaraid_pci_driver);
 	if (error) {
 #ifdef CONFIG_PROC_FS
 		remove_proc_entry("megaraid", &proc_root);
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/nsp32.c linux-2.6.11-rc3/drivers/scsi/nsp32.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/nsp32.c	2005-02-03 17:03:56.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/nsp32.c	2005-02-07 09:39:30.000000000 +0100
@@ -3571,7 +3571,7 @@ static struct pci_driver nsp32_driver = 
  */
 static int __init init_nsp32(void) {
 	nsp32_msg(KERN_INFO, "loading...");
-	return pci_module_init(&nsp32_driver);
+	return pci_register_driver(&nsp32_driver);
 }
 
 static void __exit exit_nsp32(void) {
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/qla1280.c linux-2.6.11-rc3/drivers/scsi/qla1280.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/qla1280.c	2005-02-03 17:03:56.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/qla1280.c	2005-02-07 09:39:30.000000000 +0100
@@ -4944,7 +4944,7 @@ qla1280_init(void)
 		qla1280_setup(qla1280);
 #endif
 
-	return pci_module_init(&qla1280_pci_driver);
+	return pci_register_driver(&qla1280_pci_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/qlogicisp.c linux-2.6.11-rc3/drivers/scsi/qlogicisp.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/qlogicisp.c	2004-12-24 22:35:39.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/qlogicisp.c	2005-02-07 09:39:30.000000000 +0100
@@ -666,7 +666,7 @@ int isp1020_detect(Scsi_Host_Template *t
 
 	tmpt->proc_name = "isp1020";
 
-	while ((pdev = pci_find_device(PCI_VENDOR_ID_QLOGIC, PCI_DEVICE_ID_QLOGIC_ISP1020, pdev)))
+	while ((pdev = pci_get_device(PCI_VENDOR_ID_QLOGIC, PCI_DEVICE_ID_QLOGIC_ISP1020, pdev)))
 	{
 		if (pci_enable_device(pdev))
 			continue;
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sata_nv.c linux-2.6.11-rc3/drivers/scsi/sata_nv.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sata_nv.c	2004-12-24 22:34:26.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sata_nv.c	2005-02-07 09:39:30.000000000 +0100
@@ -526,7 +526,7 @@ static void nv_check_hotplug_ck804(struc
 
 static int __init nv_init(void)
 {
-	return pci_module_init(&nv_pci_driver);
+	return pci_register_driver(&nv_pci_driver);
 }
 
 static void __exit nv_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sata_promise.c linux-2.6.11-rc3/drivers/scsi/sata_promise.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sata_promise.c	2004-12-24 22:35:23.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sata_promise.c	2005-02-07 09:39:30.000000000 +0100
@@ -647,7 +647,7 @@ err_out:
 
 static int __init pdc_ata_init(void)
 {
-	return pci_module_init(&pdc_ata_pci_driver);
+	return pci_register_driver(&pdc_ata_pci_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sata_sil.c linux-2.6.11-rc3/drivers/scsi/sata_sil.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sata_sil.c	2005-02-03 17:03:58.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sata_sil.c	2005-02-07 09:39:30.000000000 +0100
@@ -443,7 +443,7 @@ err_out:
 
 static int __init sil_init(void)
 {
-	return pci_module_init(&sil_pci_driver);
+	return pci_register_driver(&sil_pci_driver);
 }
 
 static void __exit sil_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sata_sis.c linux-2.6.11-rc3/drivers/scsi/sata_sis.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sata_sis.c	2004-12-24 22:34:57.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sata_sis.c	2005-02-07 09:39:30.000000000 +0100
@@ -266,7 +266,7 @@ err_out:
 
 static int __init sis_init(void)
 {
-	return pci_module_init(&sis_pci_driver);
+	return pci_register_driver(&sis_pci_driver);
 }
 
 static void __exit sis_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sata_svw.c linux-2.6.11-rc3/drivers/scsi/sata_svw.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sata_svw.c	2004-12-24 22:35:00.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sata_svw.c	2005-02-07 09:39:30.000000000 +0100
@@ -456,7 +456,7 @@ static struct pci_driver k2_sata_pci_dri
 
 static int __init k2_sata_init(void)
 {
-	return pci_module_init(&k2_sata_pci_driver);
+	return pci_register_driver(&k2_sata_pci_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sata_sx4.c linux-2.6.11-rc3/drivers/scsi/sata_sx4.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sata_sx4.c	2004-12-24 22:33:48.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sata_sx4.c	2005-02-07 09:39:30.000000000 +0100
@@ -1478,7 +1478,7 @@ err_out:
 
 static int __init pdc_sata_init(void)
 {
-	return pci_module_init(&pdc_sata_pci_driver);
+	return pci_register_driver(&pdc_sata_pci_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sata_uli.c linux-2.6.11-rc3/drivers/scsi/sata_uli.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sata_uli.c	2005-02-03 17:03:58.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sata_uli.c	2005-02-07 09:39:30.000000000 +0100
@@ -267,7 +267,7 @@ err_out:
 
 static int __init uli_init(void)
 {
-	return pci_module_init(&uli_pci_driver);
+	return pci_register_driver(&uli_pci_driver);
 }
 
 static void __exit uli_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sata_via.c linux-2.6.11-rc3/drivers/scsi/sata_via.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sata_via.c	2004-12-24 22:34:01.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sata_via.c	2005-02-07 09:39:30.000000000 +0100
@@ -272,7 +272,7 @@ err_out:
 
 static int __init svia_init(void)
 {
-	return pci_module_init(&svia_pci_driver);
+	return pci_register_driver(&svia_pci_driver);
 }
 
 static void __exit svia_exit(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/sata_vsc.c linux-2.6.11-rc3/drivers/scsi/sata_vsc.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/sata_vsc.c	2004-12-24 22:34:58.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/sata_vsc.c	2005-02-07 09:39:30.000000000 +0100
@@ -379,7 +379,7 @@ static struct pci_driver vsc_sata_pci_dr
 
 static int __init vsc_sata_init(void)
 {
-	return pci_module_init(&vsc_sata_pci_driver);
+	return pci_register_driver(&vsc_sata_pci_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/scsi/tmscsim.c linux-2.6.11-rc3/drivers/scsi/tmscsim.c
--- linux-2.6.11-rc3-vanilla/drivers/scsi/tmscsim.c	2004-12-24 22:35:50.000000000 +0100
+++ linux-2.6.11-rc3/drivers/scsi/tmscsim.c	2005-02-07 09:39:30.000000000 +0100
@@ -2659,7 +2659,7 @@ static int __init dc390_module_init(void
 		printk (KERN_INFO "DC390: Using safe settings.\n");
 	}
 
-	return pci_module_init(&dc390_driver);
+	return pci_register_driver(&dc390_driver);
 }
 
 static void __exit dc390_module_exit(void)

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--NzB8fVQJ5HfG6fxh--
