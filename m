From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:29:31 +0000
Subject: [KJ] [PATCH 14/18] drivers/video/ remove pci_find_{device, subsys}
Message-Id: <200502141147.34802.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35670402808984969=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35670402808984969==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/drivers/video/igafb.c linux-2.6.11-rc3/drivers/video/igafb.c
--- orig/drivers/video/igafb.c	2005-01-20 20:06:34.000000000 +0530
+++ linux-2.6.11-rc3/drivers/video/igafb.c	2005-02-14 01:14:30.000000000 +0530
@@ -388,14 +388,14 @@ int __init igafb_init(void)
         if (!con_is_present())
                 return -ENXIO;
 
-        pdev = pci_find_device(PCI_VENDOR_ID_INTERG, 
+        pdev = pci_get_device(PCI_VENDOR_ID_INTERG, 
                                PCI_DEVICE_ID_INTERG_1682, 0);
 	if (pdev == NULL) {
 		/*
 		 * XXX We tried to use cyber2000fb.c for IGS 2000.
 		 * But it does not initialize the chip in JavaStation-E, alas.
 		 */
-        	pdev = pci_find_device(PCI_VENDOR_ID_INTERG, 0x2000, 0);
+        	pdev = pci_get_device(PCI_VENDOR_ID_INTERG, 0x2000, 0);
         	if(pdev == NULL) {
         	        return -ENXIO;
 		}
diff -uprN orig/drivers/video/pm3fb.c linux-2.6.11-rc3/drivers/video/pm3fb.c
--- orig/drivers/video/pm3fb.c	2004-10-19 03:23:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/video/pm3fb.c	2005-02-14 01:14:45.000000000 +0530
@@ -3370,13 +3370,13 @@ static void pm3fb_detect(void)
 	}
 
 	dev =
-	    pci_find_device(PCI_VENDOR_ID_3DLABS,
+	    pci_get_device(PCI_VENDOR_ID_3DLABS,
 			    PCI_DEVICE_ID_3DLABS_PERMEDIA3, dev);
 
 	for (i = 0; ((i < PM3_MAX_BOARD) && dev); i++) {
 		dev_array[i] = dev;
 		dev =
-		    pci_find_device(PCI_VENDOR_ID_3DLABS,
+		    pci_get_device(PCI_VENDOR_ID_3DLABS,
 				    PCI_DEVICE_ID_3DLABS_PERMEDIA3, dev);
 	}
 
diff -uprN orig/drivers/video/sis/sis_main.c linux-2.6.11-rc3/drivers/video/sis/sis_main.c
--- orig/drivers/video/sis/sis_main.c	2005-02-11 15:19:56.000000000 +0530
+++ linux-2.6.11-rc3/drivers/video/sis/sis_main.c	2005-02-14 01:14:52.000000000 +0530
@@ -2309,7 +2309,7 @@ static struct pci_dev * sisfb_get_northb
 	default:	return NULL;
 	}
 	for(i = 0; i < nbridgenum; i++) {
-		if((pdev = pci_find_device(PCI_VENDOR_ID_SI, nbridgeids[nbridgeidx+i], NULL))) break;
+		if((pdev = pci_get_device(PCI_VENDOR_ID_SI, nbridgeids[nbridgeidx+i], NULL))) break;
 	}
 	return pdev;
 }


--===============35670402808984969==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35670402808984969==--
