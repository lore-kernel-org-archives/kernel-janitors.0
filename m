From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:40:07 +0000
Subject: [KJ] [PATCH 16/18] sound/oss/ remove pci_find_{device, subsys}
Message-Id: <200502141158.09192.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45688818933570574=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45688818933570574==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/sound/oss/cs46xx.c linux-2.6.11-rc3/sound/oss/cs46xx.c
--- orig/sound/oss/cs46xx.c	2005-02-11 15:20:12.000000000 +0530
+++ linux-2.6.11-rc3/sound/oss/cs46xx.c	2005-02-14 05:33:56.000000000 +0530
@@ -3131,7 +3131,7 @@ static void clkrun_hack(struct cs_card *
 	
 	card->active+=change;
 	
-	acpi_dev = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
+	acpi_dev = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
 	if(acpi_dev == NULL)
 		return;		/* Not a thinkpad thats for sure */
 
diff -uprN orig/sound/oss/esssolo1.c linux-2.6.11-rc3/sound/oss/esssolo1.c
--- orig/sound/oss/esssolo1.c	2005-01-20 20:06:46.000000000 +0530
+++ linux-2.6.11-rc3/sound/oss/esssolo1.c	2005-02-14 05:34:17.000000000 +0530
@@ -918,7 +918,7 @@ static int solo1_open_mixdev(struct inod
 	struct solo1_state *s = NULL;
 	struct pci_dev *pci_dev = NULL;
 
-	while ((pci_dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
+	while ((pci_dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
 		struct pci_driver *drvr;
 		drvr = pci_dev_driver (pci_dev);
 		if (drvr != &solo1_driver)
@@ -1600,7 +1600,7 @@ static int solo1_open(struct inode *inod
 	struct solo1_state *s = NULL;
 	struct pci_dev *pci_dev = NULL;
 	
-	while ((pci_dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
+	while ((pci_dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
 		struct pci_driver *drvr;
 
 		drvr = pci_dev_driver(pci_dev);
@@ -1887,7 +1887,7 @@ static int solo1_midi_open(struct inode 
 	struct solo1_state *s = NULL;
 	struct pci_dev *pci_dev = NULL;
 
-	while ((pci_dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
+	while ((pci_dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
 		struct pci_driver *drvr;
 
 		drvr = pci_dev_driver(pci_dev);
@@ -2108,7 +2108,7 @@ static int solo1_dmfm_open(struct inode 
 	struct solo1_state *s = NULL;
 	struct pci_dev *pci_dev = NULL;
 
-	while ((pci_dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
+	while ((pci_dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci_dev)) != NULL) {
 		struct pci_driver *drvr;
 
 		drvr = pci_dev_driver(pci_dev);
diff -uprN orig/sound/oss/maestro.c linux-2.6.11-rc3/sound/oss/maestro.c
--- orig/sound/oss/maestro.c	2005-02-11 15:20:12.000000000 +0530
+++ linux-2.6.11-rc3/sound/oss/maestro.c	2005-02-14 05:34:39.000000000 +0530
@@ -2145,7 +2145,7 @@ static int ess_open_mixdev(struct inode 
 	struct pci_dev *pdev = NULL;
 	struct pci_driver *drvr;
 
-	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+	while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
 		drvr = pci_dev_driver (pdev);
 		if (drvr == &maestro_pci_driver) {
 			card = (struct ess_card*)pci_get_drvdata (pdev);
@@ -2994,7 +2994,7 @@ ess_open(struct inode *inode, struct fil
 	 *	do this at open time so it is ok
 	 */
 
-	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+	while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
 		struct ess_card *c;
 		struct pci_driver *drvr;
 
diff -uprN orig/sound/oss/skeleton.c linux-2.6.11-rc3/sound/oss/skeleton.c
--- orig/sound/oss/skeleton.c	2004-10-19 03:23:46.000000000 +0530
+++ linux-2.6.11-rc3/sound/oss/skeleton.c	2005-02-14 05:34:45.000000000 +0530
@@ -159,7 +159,7 @@ int init_mycard(void)
 	struct pci_dev *pcidev=NULL;
 	int count=0;
 		
-	while((pcidev = pci_find_device(PCI_VENDOR_MYIDENT, PCI_DEVICE_ID_MYIDENT_MYCARD1, pcidev))!=NULL)
+	while((pcidev = pci_get_device(PCI_VENDOR_MYIDENT, PCI_DEVICE_ID_MYIDENT_MYCARD1, pcidev))!=NULL)
 	{
 		if (pci_enable_device(pcidev))
 			continue;
diff -uprN orig/sound/oss/trident.c linux-2.6.11-rc3/sound/oss/trident.c
--- orig/sound/oss/trident.c	2005-02-11 15:20:12.000000000 +0530
+++ linux-2.6.11-rc3/sound/oss/trident.c	2005-02-14 05:35:27.000000000 +0530
@@ -3277,7 +3277,7 @@ ali_setup_spdif_out(struct trident_card 
 	char temp;
 	struct pci_dev *pci_dev = NULL;
 
-	pci_dev = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, 
+	pci_dev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, 
 				  pci_dev);
 	if (pci_dev == NULL)
 		return;
@@ -3498,7 +3498,7 @@ ali_close_multi_channels(void)
 	char temp = 0;
 	struct pci_dev *pci_dev = NULL;
 
-	pci_dev = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, 
+	pci_dev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, 
 				  pci_dev);
 	if (pci_dev == NULL)
 		return -1;
@@ -3506,7 +3506,7 @@ ali_close_multi_channels(void)
 	temp &= ~0x80;
 	pci_write_config_byte(pci_dev, 0x59, temp);
 
-	pci_dev = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, 
+	pci_dev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, 
 				  pci_dev);
 	if (pci_dev == NULL)
 		return -1;
@@ -3525,7 +3525,7 @@ ali_setup_multi_channels(struct trident_
 	char temp = 0;
 	struct pci_dev *pci_dev = NULL;
 
-	pci_dev = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, 
+	pci_dev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, 
 				  pci_dev);
 	if (pci_dev == NULL)
 		return -1;
@@ -3533,7 +3533,7 @@ ali_setup_multi_channels(struct trident_
 	temp |= 0x80;
 	pci_write_config_byte(pci_dev, 0x59, temp);
 
-	pci_dev = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, 
+	pci_dev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101, 
 				  pci_dev);
 	if (pci_dev == NULL)
 		return -1;
@@ -4102,7 +4102,7 @@ ali_reset_5451(struct trident_card *card
 	unsigned int dwVal;
 	unsigned short wCount, wReg;
 
-	pci_dev = pci_find_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, 
+	pci_dev = pci_get_device(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1533, 
 				  pci_dev);
 	if (pci_dev == NULL)
 		return -1;
@@ -4410,7 +4410,7 @@ trident_probe(struct pci_dev *pci_dev, c
 
 		/* Add H/W Volume Control By Matt Wu Jul. 06, 2001 */
 		card->hwvolctl = 0;
-		pci_dev_m1533 = pci_find_device(PCI_VENDOR_ID_AL, 
+		pci_dev_m1533 = pci_get_device(PCI_VENDOR_ID_AL, 
 						PCI_DEVICE_ID_AL_M1533, 
 						pci_dev_m1533);
 		rc = -ENODEV;
diff -uprN orig/sound/oss/via82cxxx_audio.c linux-2.6.11-rc3/sound/oss/via82cxxx_audio.c
--- orig/sound/oss/via82cxxx_audio.c	2005-02-11 15:20:12.000000000 +0530
+++ linux-2.6.11-rc3/sound/oss/via82cxxx_audio.c	2005-02-14 05:35:38.000000000 +0530
@@ -1545,7 +1545,7 @@ static int via_mixer_open (struct inode 
 
 	DPRINTK ("ENTER\n");
 
-	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+	while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
 		drvr = pci_dev_driver (pdev);
 		if (drvr == &via_driver) {
 			assert (pci_get_drvdata (pdev) != NULL);
@@ -3243,7 +3243,7 @@ static int via_dsp_open (struct inode *i
 	}
 
 	card = NULL;
-	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
+	while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
 		drvr = pci_dev_driver (pdev);
 		if (drvr == &via_driver) {
 			assert (pci_get_drvdata (pdev) != NULL);


--===============45688818933570574==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45688818933570574==--
