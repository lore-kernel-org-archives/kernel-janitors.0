From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:22:32 +0000
Subject: [KJ] [PATCH 12/18] drivers/scsi/ remove pci_find_{device, subsys}
Message-Id: <200502141140.33642.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36571681434458725=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36571681434458725==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/drivers/scsi/advansys.c linux-2.6.11-rc3/drivers/scsi/advansys.c
--- orig/drivers/scsi/advansys.c	2005-02-11 15:19:52.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/advansys.c	2005-02-14 02:23:14.000000000 +0530
@@ -4472,7 +4472,7 @@ advansys_detect(struct scsi_host_templat
 
                     /* Find all PCI cards. */
                     while (pci_device_id_cnt < ASC_PCI_DEVICE_ID_CNT) {
-                        if ((pci_devp = pci_find_device(ASC_PCI_VENDORID,
+                        if ((pci_devp = pci_get_device(ASC_PCI_VENDORID,
                             pci_device_id[pci_device_id_cnt], pci_devp)) ==
                             NULL) {
                             pci_device_id_cnt++;
diff -uprN orig/drivers/scsi/aic7xxx_old.c linux-2.6.11-rc3/drivers/scsi/aic7xxx_old.c
--- orig/drivers/scsi/aic7xxx_old.c	2005-02-11 15:19:52.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/aic7xxx_old.c	2005-02-14 02:23:21.000000000 +0530
@@ -9198,7 +9198,7 @@ aic7xxx_detect(Scsi_Host_Template *templ
     for (i = 0; i < ARRAY_SIZE(aic_pdevs); i++)
     {
       pdev = NULL;
-      while ((pdev = pci_find_device(aic_pdevs[i].vendor_id,
+      while ((pdev = pci_get_device(aic_pdevs[i].vendor_id,
                                      aic_pdevs[i].device_id,
                                      pdev))) {
 	if (pci_enable_device(pdev))
diff -uprN orig/drivers/scsi/BusLogic.c linux-2.6.11-rc3/drivers/scsi/BusLogic.c
--- orig/drivers/scsi/BusLogic.c	2005-01-20 20:06:27.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/BusLogic.c	2005-02-14 02:23:08.000000000 +0530
@@ -661,7 +661,7 @@ static int __init BusLogic_InitializeMul
 	   particular standard ISA I/O Address need not be probed.
 	 */
 	PrimaryProbeInfo->IO_Address = 0;
-	while ((PCI_Device = pci_find_device(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER, PCI_Device)) != NULL) {
+	while ((PCI_Device = pci_get_device(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER, PCI_Device)) != NULL) {
 		struct BusLogic_HostAdapter *HostAdapter = PrototypeHostAdapter;
 		struct BusLogic_PCIHostAdapterInformation PCIHostAdapterInformation;
 		enum BusLogic_ISACompatibleIOPort ModifyIOAddressRequest;
@@ -822,7 +822,7 @@ static int __init BusLogic_InitializeMul
 	   noting the PCI bus location and assigned IRQ Channel.
 	 */
 	PCI_Device = NULL;
-	while ((PCI_Device = pci_find_device(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER_NC, PCI_Device)) != NULL) {
+	while ((PCI_Device = pci_get_device(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER_NC, PCI_Device)) != NULL) {
 		unsigned char Bus;
 		unsigned char Device;
 		unsigned int IRQ_Channel;
@@ -873,7 +873,7 @@ static int __init BusLogic_InitializeFla
 	/*
 	   Interrogate PCI Configuration Space for any FlashPoint Host Adapters.
 	 */
-	while ((PCI_Device = pci_find_device(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT, PCI_Device)) != NULL) {
+	while ((PCI_Device = pci_get_device(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT, PCI_Device)) != NULL) {
 		unsigned char Bus;
 		unsigned char Device;
 		unsigned int IRQ_Channel;
diff -uprN orig/drivers/scsi/cpqfcTSinit.c linux-2.6.11-rc3/drivers/scsi/cpqfcTSinit.c
--- orig/drivers/scsi/cpqfcTSinit.c	2005-01-20 20:06:29.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/cpqfcTSinit.c	2005-02-14 02:23:27.000000000 +0530
@@ -298,7 +298,7 @@ int cpqfcTS_detect(Scsi_Host_Template *S
   {
     // look for all HBAs of each type
 
-    while((PciDev = pci_find_device(cpqfc_boards[i].vendor_id,
+    while((PciDev = pci_get_device(cpqfc_boards[i].vendor_id,
 				    cpqfc_boards[i].device_id, PciDev)))
     {
 
diff -uprN orig/drivers/scsi/dpt_i2o.c linux-2.6.11-rc3/drivers/scsi/dpt_i2o.c
--- orig/drivers/scsi/dpt_i2o.c	2005-02-11 15:19:52.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/dpt_i2o.c	2005-02-14 02:23:33.000000000 +0530
@@ -185,7 +185,7 @@ static int adpt_detect(struct scsi_host_
 	PINFO("Detecting Adaptec I2O RAID controllers...\n");
 
         /* search for all Adatpec I2O RAID cards */
-	while ((pDev = pci_find_device( PCI_DPT_VENDOR_ID, PCI_ANY_ID, pDev))) {
+	while ((pDev = pci_get_device( PCI_DPT_VENDOR_ID, PCI_ANY_ID, pDev))) {
 		if(pDev->device == PCI_DPT_DEVICE_ID ||
 		   pDev->device == PCI_DPT_RAPTOR_DEVICE_ID){
 			if(adpt_install_hba(sht, pDev) ){
diff -uprN orig/drivers/scsi/eata_pio.c linux-2.6.11-rc3/drivers/scsi/eata_pio.c
--- orig/drivers/scsi/eata_pio.c	2004-10-19 03:24:37.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/eata_pio.c	2005-02-14 02:23:40.000000000 +0530
@@ -885,7 +885,7 @@ static void find_pio_PCI(struct get_conf
 	struct pci_dev *dev = NULL;
 	u32 base, x;
 
-	while ((dev = pci_find_device(PCI_VENDOR_ID_DPT, PCI_DEVICE_ID_DPT, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_VENDOR_ID_DPT, PCI_DEVICE_ID_DPT, dev)) != NULL) {
 		DBG(DBG_PROBE && DBG_PCI, printk("eata_pio: find_PCI, HBA at %s\n", pci_name(dev)));
 		if (pci_enable_device(dev))
 			continue;
diff -uprN orig/drivers/scsi/fdomain.c linux-2.6.11-rc3/drivers/scsi/fdomain.c
--- orig/drivers/scsi/fdomain.c	2005-02-11 15:19:52.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/fdomain.c	2005-02-14 02:23:46.000000000 +0530
@@ -814,7 +814,7 @@ static int fdomain_pci_bios_detect( int 
 	   PCI_DEVICE_ID_FD_36C70 );
 #endif 
 
-   if ((pdev = pci_find_device(PCI_VENDOR_ID_FD, PCI_DEVICE_ID_FD_36C70, pdev)) == NULL)
+   if ((pdev = pci_get_device(PCI_VENDOR_ID_FD, PCI_DEVICE_ID_FD_36C70, pdev)) == NULL)
 		return 0;
    if (pci_enable_device(pdev)) return 0;
        
diff -uprN orig/drivers/scsi/gdth.c linux-2.6.11-rc3/drivers/scsi/gdth.c
--- orig/drivers/scsi/gdth.c	2005-02-11 15:19:52.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/gdth.c	2005-02-14 02:23:53.000000000 +0530
@@ -781,7 +781,7 @@ static void __init gdth_search_dev(gdth_
           *cnt, vendor, device));
 
     pdev = NULL;
-    while ((pdev = pci_find_device(vendor, device, pdev)) 
+    while ((pdev = pci_get_device(vendor, device, pdev)) 
            != NULL) {
         if (pci_enable_device(pdev))
             continue;
diff -uprN orig/drivers/scsi/initio.c linux-2.6.11-rc3/drivers/scsi/initio.c
--- orig/drivers/scsi/initio.c	2005-01-20 20:06:29.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/initio.c	2005-02-14 02:23:59.000000000 +0530
@@ -2785,7 +2785,7 @@ static int tul_NewReturnNumberOfAdapters
 
 	for (i = 0; i < TULSZ(i91u_pci_devices); i++)
 	{
-		while ((pDev = pci_find_device(i91u_pci_devices[i].vendor_id, i91u_pci_devices[i].device_id, pDev)) != NULL) {
+		while ((pDev = pci_get_device(i91u_pci_devices[i].vendor_id, i91u_pci_devices[i].device_id, pDev)) != NULL) {
 			if (pci_enable_device(pDev))
 				continue;
 			pci_read_config_dword(pDev, 0x44, (u32 *) & dRegValue);
diff -uprN orig/drivers/scsi/pci2000.c linux-2.6.11-rc3/drivers/scsi/pci2000.c
--- orig/drivers/scsi/pci2000.c	2004-10-19 03:24:38.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/pci2000.c	2005-02-14 02:24:05.000000000 +0530
@@ -633,7 +633,7 @@ int Pci2000_Detect (Scsi_Host_Template *
 	UCHAR			   *consistent;
 	dma_addr_t			consistentDma;
 
-	while ( (pdev = pci_find_device (VENDOR_PSI, DEVICE_ROY_1, pdev)) != NULL )
+	while ( (pdev = pci_get_device (VENDOR_PSI, DEVICE_ROY_1, pdev)) != NULL )
 		{
 		if (pci_enable_device(pdev))
 			continue;
diff -uprN orig/drivers/scsi/pci2220i.c linux-2.6.11-rc3/drivers/scsi/pci2220i.c
--- orig/drivers/scsi/pci2220i.c	2004-10-19 03:23:07.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/pci2220i.c	2005-02-14 02:24:18.000000000 +0530
@@ -2512,7 +2512,7 @@ int Pci2220i_Detect (Scsi_Host_Template 
 	UCHAR				device;
 	struct pci_dev	   *pcidev = NULL;
 
-	while ( (pcidev = pci_find_device (VENDOR_PSI, DEVICE_DALE_1, pcidev)) != NULL )
+	while ( (pcidev = pci_get_device (VENDOR_PSI, DEVICE_DALE_1, pcidev)) != NULL )
 		{
 		if (pci_enable_device(pcidev))
 			continue;
@@ -2618,7 +2618,7 @@ unregister:;
 		scsi_unregister (pshost);
 		}
 
-	while ( (pcidev = pci_find_device (VENDOR_PSI, DEVICE_BIGD_1, pcidev)) != NULL )
+	while ( (pcidev = pci_get_device (VENDOR_PSI, DEVICE_BIGD_1, pcidev)) != NULL )
 		{
 		pshost = scsi_register (tpnt, sizeof(ADAPTER2220I));
 		padapter = HOSTDATA(pshost);
diff -uprN orig/drivers/scsi/qla1280.c linux-2.6.11-rc3/drivers/scsi/qla1280.c
--- orig/drivers/scsi/qla1280.c	2005-02-11 15:19:52.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/qla1280.c	2005-02-14 02:24:31.000000000 +0530
@@ -1286,7 +1286,7 @@ qla1280_detect(Scsi_Host_Template *templ
 #endif
 
 	/* First Initialize QLA12160 on PCI Bus 1 Dev 2 */
-	while ((pdev = pci_find_device(id->vendor, id->device, pdev))) {
+	while ((pdev = pci_get_device(id->vendor, id->device, pdev))) {
 		if (pdev->bus->number == 1 && PCI_SLOT(pdev->devfn) == 2) {
 			if (!qla1280_probe_one(pdev, id))
 				num_hosts++;
@@ -1296,7 +1296,7 @@ qla1280_detect(Scsi_Host_Template *templ
 	pdev = NULL;
 	/* Try and find each different type of adapter we support */
 	for (id = &qla1280_pci_tbl[0]; id->device; id++) {
-		while ((pdev = pci_find_device(id->vendor, id->device, pdev))) {
+		while ((pdev = pci_get_device(id->vendor, id->device, pdev))) {
 			/*
 			 * skip QLA12160 already initialized on
 			 * PCI Bus 1 Dev 2 since we already initialized
diff -uprN orig/drivers/scsi/qlogicfc.c linux-2.6.11-rc3/drivers/scsi/qlogicfc.c
--- orig/drivers/scsi/qlogicfc.c	2005-01-20 20:06:31.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/qlogicfc.c	2005-02-14 02:24:37.000000000 +0530
@@ -714,7 +714,7 @@ int isp2x00_detect(Scsi_Host_Template * 
 
 	for (i=0; i<2; i++){
 		pdev = NULL;
-	        while ((pdev = pci_find_device(PCI_VENDOR_ID_QLOGIC, device_ids[i], pdev))) {
+	        while ((pdev = pci_get_device(PCI_VENDOR_ID_QLOGIC, device_ids[i], pdev))) {
 			if (pci_enable_device(pdev))
 				continue;
 
diff -uprN orig/drivers/scsi/qlogicisp.c linux-2.6.11-rc3/drivers/scsi/qlogicisp.c
--- orig/drivers/scsi/qlogicisp.c	2005-01-20 20:06:31.000000000 +0530
+++ linux-2.6.11-rc3/drivers/scsi/qlogicisp.c	2005-02-14 02:24:47.000000000 +0530
@@ -666,7 +666,7 @@ int isp1020_detect(Scsi_Host_Template *t
 
 	tmpt->proc_name = "isp1020";
 
-	while ((pdev = pci_find_device(PCI_VENDOR_ID_QLOGIC, PCI_DEVICE_ID_QLOGIC_ISP1020, pdev)))
+	while ((pdev = pci_get_device(PCI_VENDOR_ID_QLOGIC, PCI_DEVICE_ID_QLOGIC_ISP1020, pdev)))
 	{
 		if (pci_enable_device(pdev))
 			continue;


--===============36571681434458725==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36571681434458725==--
