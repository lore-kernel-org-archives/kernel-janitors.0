From: Domen Puncer <domen@coderock.org>
Date: Sat, 08 May 2004 23:38:21 +0000
Subject: [Kernel-janitors] [patch 2.6.6-rc3 11/16] ifdefs:
Message-Id: <20040508233821.GA4142@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30207293363590204=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30207293363590204==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

--- c/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c	2004-04-04 05:36:54.000000000 +0200
+++ a/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c	2004-05-08 23:13:29.000000000 +0200
@@ -41,12 +41,6 @@
 
 #include "aic7xxx_osm.h"
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,0)
-struct pci_device_id
-{
-};
-#endif
-
 static int	ahc_linux_pci_dev_probe(struct pci_dev *pdev,
 					const struct pci_device_id *ent);
 static int	ahc_linux_pci_reserve_io_region(struct ahc_softc *ahc,
@@ -54,7 +48,6 @@
 static int	ahc_linux_pci_reserve_mem_region(struct ahc_softc *ahc,
 						 u_long *bus_addr,
 						 uint8_t **maddr);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 static void	ahc_linux_pci_dev_remove(struct pci_dev *pdev);
 
 /* We do our own ID filtering.  So, grab all SCSI storage class devices. */
@@ -102,7 +95,6 @@
 	}
 	ahc_list_unlock(&l);
 }
-#endif /* !LINUX_VERSION_CODE < KERNEL_VERSION(2,4,0) */
 
 static int
 ahc_linux_pci_dev_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
@@ -152,7 +144,6 @@
 	ahc = ahc_alloc(NULL, name);
 	if (ahc == NULL)
 		return (-ENOMEM);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	if (pci_enable_device(pdev)) {
 		ahc_free(ahc);
 		return (-ENODEV);
@@ -172,14 +163,12 @@
 		}
 		ahc->platform_data->hw_dma_mask = 0xFFFFFFFF;
 	}
-#endif
 	ahc->dev_softc = pci;
 	error = ahc_pci_config(ahc, entry);
 	if (error != 0) {
 		ahc_free(ahc);
 		return (-error);
 	}
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	pci_set_drvdata(pdev, ahc);
 	if (aic7xxx_detect_complete) {
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
@@ -190,38 +179,13 @@
 		return (-ENODEV);
 #endif
 	}
-#endif
 	return (0);
 }
 
 int
 ahc_linux_pci_init(void)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	return (pci_module_init(&aic7xxx_pci_driver));
-#else
-	struct pci_dev *pdev;
-	u_int class;
-	int found;
-
-	/* If we don't have a PCI bus, we can't find any adapters. */
-	if (pci_present() == 0)
-		return (0);
-
-	found = 0;
-	pdev = NULL;
-	class = PCI_CLASS_STORAGE_SCSI << 8;
-	while ((pdev = pci_find_class(class, pdev)) != NULL) {
-		ahc_dev_softc_t pci;
-		int error;
-
-		pci = pdev;
-		error = ahc_linux_pci_dev_probe(pdev, /*pci_devid*/NULL);
-		if (error == 0)
-			found++;
-	}
-	return (found);
-#endif
 }
 
 void
@@ -236,22 +200,11 @@
 	if (aic7xxx_allow_memio == 0)
 		return (ENOMEM);
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	*base = pci_resource_start(ahc->dev_softc, 0);
-#else
-	*base = ahc_pci_read_config(ahc->dev_softc, PCIR_MAPS, 4);
-	*base &= PCI_BASE_ADDRESS_IO_MASK;
-#endif
 	if (*base == 0)
 		return (ENOMEM);
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,0)
-	if (check_region(*base, 256) != 0)
-		return (ENOMEM);
-	request_region(*base, 256, "aic7xxx");
-#else
 	if (request_region(*base, 256, "aic7xxx") == 0)
 		return (ENOMEM);
-#endif
 	return (0);
 }
 
@@ -266,29 +219,18 @@
 	int	error;
 
 	error = 0;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,3,0)
 	start = pci_resource_start(ahc->dev_softc, 1);
 	base_page = start & PAGE_MASK;
 	base_offset = start - base_page;
-#else
-	start = ahc_pci_read_config(ahc->dev_softc, PCIR_MAPS+4, 4);
-	base_offset = start & PCI_BASE_ADDRESS_MEM_MASK;
-	base_page = base_offset & PAGE_MASK;
-	base_offset -= base_page;
-#endif
 	if (start != 0) {
 		*bus_addr = start;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 		if (request_mem_region(start, 0x1000, "aic7xxx") == 0)
 			error = ENOMEM;
-#endif
 		if (error == 0) {
 			*maddr = ioremap_nocache(base_page, base_offset + 256);
 			if (*maddr == NULL) {
 				error = ENOMEM;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 				release_mem_region(start, 0x1000);
-#endif
 			} else
 				*maddr += base_offset;
 		}
@@ -332,10 +274,8 @@
 			       ahc_get_pci_slot(ahc->dev_softc),
 			       ahc_get_pci_function(ahc->dev_softc));
 			iounmap((void *)((u_long)maddr & PAGE_MASK));
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 			release_mem_region(ahc->platform_data->mem_busaddr,
 					   0x1000);
-#endif
 			ahc->bsh.maddr = NULL;
 			maddr = NULL;
 		} else
@@ -388,38 +328,5 @@
 void
 ahc_power_state_change(struct ahc_softc *ahc, ahc_power_state new_state)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,0)
 	pci_set_power_state(ahc->dev_softc, new_state);
-#else
-	uint32_t cap;
-	u_int cap_offset;
-
-	/*
-	 * Traverse the capability list looking for
-	 * the power management capability.
-	 */
-	cap = 0;
-	cap_offset = ahc_pci_read_config(ahc->dev_softc,
-					 PCIR_CAP_PTR, /*bytes*/1);
-	while (cap_offset != 0) {
-
-		cap = ahc_pci_read_config(ahc->dev_softc,
-					  cap_offset, /*bytes*/4);
-		if ((cap & 0xFF) == 1
-		 && ((cap >> 16) & 0x3) > 0) {
-			uint32_t pm_control;
-
-			pm_control = ahc_pci_read_config(ahc->dev_softc,
-							 cap_offset + 4,
-							 /*bytes*/4);
-			pm_control &= ~0x3;
-			pm_control |= new_state;
-			ahc_pci_write_config(ahc->dev_softc,
-					     cap_offset + 4,
-					     pm_control, /*bytes*/2);
-			break;
-		}
-		cap_offset = (cap >> 8) & 0xFF;
-	}
-#endif 
 }

--===============30207293363590204==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30207293363590204==--
