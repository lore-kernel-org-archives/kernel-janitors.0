From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 05:53:06 +0000
Subject: [KJ] [PATCH 3/18] drivers/char remove pci_find_{device, subsys}
Message-Id: <200502141111.08301.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42584486702393187=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42584486702393187==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys


AG
--
May the source be with you


Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/drivers/char/ip2main.c linux-2.6.11-rc3/drivers/char/ip2main.c
--- orig/drivers/char/ip2main.c	2005-02-11 15:19:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/ip2main.c	2005-02-14 02:19:08.000000000 +0530
@@ -595,7 +595,7 @@ ip2_loadmain(int *iop, int *irqp, unsign
 #ifdef CONFIG_PCI
 			{
 				struct pci_dev *pci_dev_i = NULL;
-				pci_dev_i = pci_find_device(PCI_VENDOR_ID_COMPUTONE,
+				pci_dev_i = pci_get_device(PCI_VENDOR_ID_COMPUTONE,
 							  PCI_DEVICE_ID_COMPUTONE_IP2EX, pci_dev_i);
 				if (pci_dev_i != NULL) {
 					unsigned int addr;
diff -uprN orig/drivers/char/isicom.c linux-2.6.11-rc3/drivers/char/isicom.c
--- orig/drivers/char/isicom.c	2005-02-11 15:19:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/isicom.c	2005-02-14 02:19:15.000000000 +0530
@@ -2002,7 +2002,7 @@ static int __devinit isicom_setup(void)
 		for (idx=0; idx < DEVID_COUNT; idx++) {
 			dev = NULL;
 			for (;;){
-				if (!(dev = pci_find_device(VENDOR_ID, isicom_pci_tbl[idx].device, dev)))
+				if (!(dev = pci_get_device(VENDOR_ID, isicom_pci_tbl[idx].device, dev)))
 					break;
 				if (card >= BOARD_COUNT)
 					break;
diff -uprN orig/drivers/char/istallion.c linux-2.6.11-rc3/drivers/char/istallion.c
--- orig/drivers/char/istallion.c	2005-01-20 20:06:17.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/istallion.c	2005-02-14 02:19:21.000000000 +0530
@@ -4613,7 +4613,7 @@ static int stli_findpcibrds(void)
 	printk("stli_findpcibrds()\n");
 #endif
 
-	while ((dev = pci_find_device(PCI_VENDOR_ID_STALLION,
+	while ((dev = pci_get_device(PCI_VENDOR_ID_STALLION,
 	    PCI_DEVICE_ID_ECRA, dev))) {
 		if ((rc = stli_initpcibrd(BRD_ECPPCI, dev)))
 			return(rc);
diff -uprN orig/drivers/char/moxa.c linux-2.6.11-rc3/drivers/char/moxa.c
--- orig/drivers/char/moxa.c	2005-01-20 20:06:17.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/moxa.c	2005-02-14 02:19:28.000000000 +0530
@@ -451,7 +451,7 @@ static int __init moxa_init(void)
 		int n = (sizeof(moxa_pcibrds) / sizeof(moxa_pcibrds[0])) - 1;
 		i = 0;
 		while (i < n) {
-			while ((p = pci_find_device(moxa_pcibrds[i].vendor, moxa_pcibrds[i].device, p))!=NULL)
+			while ((p = pci_get_device(moxa_pcibrds[i].vendor, moxa_pcibrds[i].device, p))!=NULL)
 			{
 				if (pci_enable_device(p))
 					continue;
diff -uprN orig/drivers/char/mxser.c linux-2.6.11-rc3/drivers/char/mxser.c
--- orig/drivers/char/mxser.c	2005-02-11 15:19:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/mxser.c	2005-02-14 02:19:35.000000000 +0530
@@ -839,7 +839,7 @@ static int mxser_init(void)
 	index = 0;
 	b = 0;
 	while (b < n) {
-		pdev = pci_find_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
+		pdev = pci_get_device(mxser_pcibrds[b].vendor, mxser_pcibrds[b].device, pdev);
 			if (pdev == NULL) {
 			b++;
 			continue;
diff -uprN orig/drivers/char/rio/rio_linux.c linux-2.6.11-rc3/drivers/char/rio/rio_linux.c
--- orig/drivers/char/rio/rio_linux.c	2005-02-11 15:19:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/rio/rio_linux.c	2005-02-14 02:19:49.000000000 +0530
@@ -1096,7 +1096,7 @@ static int __init rio_init(void) 
 
 #ifdef CONFIG_PCI
     /* First look for the JET devices: */
-    while ((pdev = pci_find_device (PCI_VENDOR_ID_SPECIALIX, 
+    while ((pdev = pci_get_device (PCI_VENDOR_ID_SPECIALIX, 
                                     PCI_DEVICE_ID_SPECIALIX_SX_XIO_IO8, 
                                     pdev))) {
        if (pci_enable_device(pdev)) continue;
@@ -1170,7 +1170,7 @@ static int __init rio_init(void) 
   */
 
     /* Then look for the older RIO/PCI devices: */
-    while ((pdev = pci_find_device (PCI_VENDOR_ID_SPECIALIX, 
+    while ((pdev = pci_get_device (PCI_VENDOR_ID_SPECIALIX, 
                                     PCI_DEVICE_ID_SPECIALIX_RIO, 
                                     pdev))) {
        if (pci_enable_device(pdev)) continue;
diff -uprN orig/drivers/char/rocket.c linux-2.6.11-rc3/drivers/char/rocket.c
--- orig/drivers/char/rocket.c	2005-01-20 20:06:17.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/rocket.c	2005-02-14 02:19:57.000000000 +0530
@@ -2154,7 +2154,7 @@ static int __init init_PCI(int boards_fo
 	int count = 0;
 
 	/*  Work through the PCI device list, pulling out ours */
-	while ((dev = pci_find_device(PCI_VENDOR_ID_RP, PCI_ANY_ID, dev))) {
+	while ((dev = pci_get_device(PCI_VENDOR_ID_RP, PCI_ANY_ID, dev))) {
 		if (register_PCI(count + boards_found, dev))
 			count++;
 	}
diff -uprN orig/drivers/char/specialix.c linux-2.6.11-rc3/drivers/char/specialix.c
--- orig/drivers/char/specialix.c	2005-01-20 20:06:18.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/specialix.c	2005-02-14 02:20:03.000000000 +0530
@@ -2154,7 +2154,7 @@ static int __init specialix_init(void)
 				i++;
 				continue;
 			}
-			pdev = pci_find_device (PCI_VENDOR_ID_SPECIALIX, 
+			pdev = pci_get_device (PCI_VENDOR_ID_SPECIALIX, 
 			                        PCI_DEVICE_ID_SPECIALIX_IO8, 
 			                        pdev);
 			if (!pdev) break;
diff -uprN orig/drivers/char/stallion.c linux-2.6.11-rc3/drivers/char/stallion.c
--- orig/drivers/char/stallion.c	2005-01-20 20:06:19.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/stallion.c	2005-02-14 02:20:10.000000000 +0530
@@ -2757,7 +2757,7 @@ static inline int stl_findpcibrds(void)
 #endif
 
 	for (i = 0; (i < stl_nrpcibrds); i++)
-		while ((dev = pci_find_device(stl_pcibrds[i].vendid,
+		while ((dev = pci_get_device(stl_pcibrds[i].vendid,
 		    stl_pcibrds[i].devid, dev))) {
 
 /*
diff -uprN orig/drivers/char/sx.c linux-2.6.11-rc3/drivers/char/sx.c
--- orig/drivers/char/sx.c	2005-01-20 20:06:19.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/sx.c	2005-02-14 02:20:17.000000000 +0530
@@ -2423,7 +2423,7 @@ static int __init sx_init(void) 
 	}
 
 #ifdef CONFIG_PCI
-	while ((pdev = pci_find_device (PCI_VENDOR_ID_SPECIALIX, 
+	while ((pdev = pci_get_device (PCI_VENDOR_ID_SPECIALIX, 
 					PCI_DEVICE_ID_SPECIALIX_SX_XIO_IO8, 
 					      pdev))) {
 		if (pci_enable_device(pdev))
diff -uprN orig/drivers/char/watchdog/alim1535_wdt.c linux-2.6.11-rc3/drivers/char/watchdog/alim1535_wdt.c
--- orig/drivers/char/watchdog/alim1535_wdt.c	2004-10-19 03:23:44.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/watchdog/alim1535_wdt.c	2005-02-14 02:20:32.000000000 +0530
@@ -335,12 +335,12 @@ static int __init ali_find_watchdog(void
 	u32 wdog;
 
 	/* Check for a 1535 series bridge */
-	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x1535, NULL);
+	pdev = pci_get_device(PCI_VENDOR_ID_AL, 0x1535, NULL);
 	if(pdev == NULL)
 		return -ENODEV;
 
 	/* Check for the a 7101 PMU */
-	pdev = pci_find_device(PCI_VENDOR_ID_AL, 0x7101, NULL);
+	pdev = pci_get_device(PCI_VENDOR_ID_AL, 0x7101, NULL);
 	if(pdev == NULL)
 		return -ENODEV;
 
diff -uprN orig/drivers/char/watchdog/alim7101_wdt.c linux-2.6.11-rc3/drivers/char/watchdog/alim7101_wdt.c
--- orig/drivers/char/watchdog/alim7101_wdt.c	2005-02-11 15:19:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/watchdog/alim7101_wdt.c	2005-02-14 02:20:44.000000000 +0530
@@ -347,7 +347,7 @@ static int __init alim7101_wdt_init(void
 	char tmp;
 
 	printk(KERN_INFO PFX "Steve Hill <steve@navaho.co.uk>.\n");
-	alim7101_pmu = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101,NULL);
+	alim7101_pmu = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101,NULL);
 	if (!alim7101_pmu) {
 		printk(KERN_INFO PFX "ALi M7101 PMU not present - WDT not set\n");
 		return -EBUSY;
@@ -356,7 +356,7 @@ static int __init alim7101_wdt_init(void
 	/* Set the WDT in the PMU to 1 second */
 	pci_write_config_byte(alim7101_pmu, ALI_7101_WDT, 0x02);
 
-	ali1543_south = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
+	ali1543_south = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, NULL);
 	if (!ali1543_south) {
 		printk(KERN_INFO PFX "ALi 1543 South-Bridge not present - WDT not set\n");
 		return -EBUSY;
diff -uprN orig/drivers/char/watchdog/i8xx_tco.c linux-2.6.11-rc3/drivers/char/watchdog/i8xx_tco.c
--- orig/drivers/char/watchdog/i8xx_tco.c	2005-02-11 15:19:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/char/watchdog/i8xx_tco.c	2005-02-14 02:20:49.000000000 +0530
@@ -399,7 +399,7 @@ static unsigned char __init i8xx_tco_get
 	 *      Find the PCI device
 	 */
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		if (pci_match_device(i8xx_tco_pci_tbl, dev)) {
 			i8xx_tco_pci = dev;
 			break;


--===============42584486702393187==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42584486702393187==--
