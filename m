From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 05:56:25 +0000
Subject: [KJ] [PATCH 5/18] drivers/isdn/ remove pci_find_{device, subsys}
Message-Id: <200502141114.27588.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33158630421904345=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33158630421904345==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys


AG
--
May the source be with you


Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/drivers/isdn/hisax/avm_pci.c linux-2.6.11-rc3/drivers/isdn/hisax/avm_pci.c
--- orig/drivers/isdn/hisax/avm_pci.c	2005-01-20 20:06:20.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/avm_pci.c	2005-02-14 02:28:53.000000000 +0530
@@ -792,7 +792,7 @@ setup_avm_pcipnp(struct IsdnCard *card)
 	}
 #endif
 #ifdef CONFIG_PCI
-	if ((dev_avm = pci_find_device(PCI_VENDOR_ID_AVM,
+	if ((dev_avm = pci_get_device(PCI_VENDOR_ID_AVM,
 		PCI_DEVICE_ID_AVM_A1,  dev_avm))) {
 		if (pci_enable_device(dev_avm))
 			return(0);
diff -uprN orig/drivers/isdn/hisax/bkm_a4t.c linux-2.6.11-rc3/drivers/isdn/hisax/bkm_a4t.c
--- orig/drivers/isdn/hisax/bkm_a4t.c	2004-10-19 03:23:51.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/bkm_a4t.c	2005-02-14 02:28:59.000000000 +0530
@@ -276,7 +276,7 @@ setup_bkm_a4t(struct IsdnCard *card)
 		return (0);
 
 #ifdef CONFIG_PCI
-	while ((dev_a4t = pci_find_device(PCI_VENDOR_ID_ZORAN,
+	while ((dev_a4t = pci_get_device(PCI_VENDOR_ID_ZORAN,
 		PCI_DEVICE_ID_ZORAN_36120, dev_a4t))) {
 		u16 sub_sys;
 		u16 sub_vendor;
diff -uprN orig/drivers/isdn/hisax/bkm_a8.c linux-2.6.11-rc3/drivers/isdn/hisax/bkm_a8.c
--- orig/drivers/isdn/hisax/bkm_a8.c	2004-10-19 03:24:55.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/bkm_a8.c	2005-02-14 02:29:04.000000000 +0530
@@ -311,7 +311,7 @@ setup_sct_quadro(struct IsdnCard *card)
 		(sub_vendor_id != PCI_VENDOR_ID_BERKOM)))
 		return (0);
 	if (cs->subtyp == SCT_1) {
-		while ((dev_a8 = pci_find_device(PCI_VENDOR_ID_PLX,
+		while ((dev_a8 = pci_get_device(PCI_VENDOR_ID_PLX,
 			PCI_DEVICE_ID_PLX_9050, dev_a8))) {
 			
 			sub_vendor_id = dev_a8->subsystem_vendor;
diff -uprN orig/drivers/isdn/hisax/diva.c linux-2.6.11-rc3/drivers/isdn/hisax/diva.c
--- orig/drivers/isdn/hisax/diva.c	2004-10-19 03:25:24.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/diva.c	2005-02-14 02:29:30.000000000 +0530
@@ -1029,21 +1029,21 @@ setup_diva(struct IsdnCard *card)
 #endif
 #ifdef CONFIG_PCI
 		cs->subtyp = 0;
-		if ((dev_diva = pci_find_device(PCI_VENDOR_ID_EICON,
+		if ((dev_diva = pci_get_device(PCI_VENDOR_ID_EICON,
 			PCI_DEVICE_ID_EICON_DIVA20, dev_diva))) {
 			if (pci_enable_device(dev_diva))
 				return(0);
 			cs->subtyp = DIVA_PCI;
 			cs->irq = dev_diva->irq;
 			cs->hw.diva.cfg_reg = pci_resource_start(dev_diva, 2);
-		} else if ((dev_diva_u = pci_find_device(PCI_VENDOR_ID_EICON,
+		} else if ((dev_diva_u = pci_get_device(PCI_VENDOR_ID_EICON,
 			PCI_DEVICE_ID_EICON_DIVA20_U, dev_diva_u))) {
 			if (pci_enable_device(dev_diva_u))
 				return(0);
 			cs->subtyp = DIVA_PCI;
 			cs->irq = dev_diva_u->irq;
 			cs->hw.diva.cfg_reg = pci_resource_start(dev_diva_u, 2);
-		} else if ((dev_diva201 = pci_find_device(PCI_VENDOR_ID_EICON,
+		} else if ((dev_diva201 = pci_get_device(PCI_VENDOR_ID_EICON,
 			PCI_DEVICE_ID_EICON_DIVA201, dev_diva201))) {
 			if (pci_enable_device(dev_diva201))
 				return(0);
@@ -1053,7 +1053,7 @@ setup_diva(struct IsdnCard *card)
 				(ulong) ioremap(pci_resource_start(dev_diva201, 0), 4096);
 			cs->hw.diva.cfg_reg =
 				(ulong) ioremap(pci_resource_start(dev_diva201, 1), 4096);
-		} else if ((dev_diva202 = pci_find_device(PCI_VENDOR_ID_EICON,
+		} else if ((dev_diva202 = pci_get_device(PCI_VENDOR_ID_EICON,
 			PCI_DEVICE_ID_EICON_DIVA202, dev_diva202))) {
 			if (pci_enable_device(dev_diva202))
 				return(0);
diff -uprN orig/drivers/isdn/hisax/elsa.c linux-2.6.11-rc3/drivers/isdn/hisax/elsa.c
--- orig/drivers/isdn/hisax/elsa.c	2005-01-20 20:06:20.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/elsa.c	2005-02-14 02:30:10.000000000 +0530
@@ -1023,7 +1023,7 @@ setup_elsa(struct IsdnCard *card)
 	} else if (cs->typ == ISDN_CTYPE_ELSA_PCI) {
 #ifdef CONFIG_PCI
 		cs->subtyp = 0;
-		if ((dev_qs1000 = pci_find_device(PCI_VENDOR_ID_ELSA,
+		if ((dev_qs1000 = pci_get_device(PCI_VENDOR_ID_ELSA,
 			PCI_DEVICE_ID_ELSA_MICROLINK, dev_qs1000))) {
 			if (pci_enable_device(dev_qs1000))
 				return(0);
@@ -1031,7 +1031,7 @@ setup_elsa(struct IsdnCard *card)
 			cs->irq = dev_qs1000->irq;
 			cs->hw.elsa.cfg = pci_resource_start(dev_qs1000, 1);
 			cs->hw.elsa.base = pci_resource_start(dev_qs1000, 3);
-		} else if ((dev_qs3000 = pci_find_device(PCI_VENDOR_ID_ELSA,
+		} else if ((dev_qs3000 = pci_get_device(PCI_VENDOR_ID_ELSA,
 			PCI_DEVICE_ID_ELSA_QS3000, dev_qs3000))) {
 			if (pci_enable_device(dev_qs3000))
 				return(0);
diff -uprN orig/drivers/isdn/hisax/enternow_pci.c linux-2.6.11-rc3/drivers/isdn/hisax/enternow_pci.c
--- orig/drivers/isdn/hisax/enternow_pci.c	2004-10-19 03:24:55.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/enternow_pci.c	2005-02-14 02:30:21.000000000 +0530
@@ -311,7 +311,7 @@ setup_enternow_pci(struct IsdnCard *card
 
 	for ( ;; )
 	{
-		if ((dev_netjet = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_netjet = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 			PCI_DEVICE_ID_TIGERJET_300,  dev_netjet))) {
 			if (pci_enable_device(dev_netjet))
 				return(0);
diff -uprN orig/drivers/isdn/hisax/gazel.c linux-2.6.11-rc3/drivers/isdn/hisax/gazel.c
--- orig/drivers/isdn/hisax/gazel.c	2004-10-19 03:24:31.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/gazel.c	2005-02-14 02:30:27.000000000 +0530
@@ -546,7 +546,7 @@ setup_gazelpci(struct IsdnCardState *cs)
 	found = 0;
 	seekcard = PCI_DEVICE_ID_PLX_R685;
 	for (nbseek = 0; nbseek < 3; nbseek++) {
-		if ((dev_tel = pci_find_device(PCI_VENDOR_ID_PLX, seekcard, dev_tel))) {
+		if ((dev_tel = pci_get_device(PCI_VENDOR_ID_PLX, seekcard, dev_tel))) {
 			if (pci_enable_device(dev_tel))
 				return 1;
 			pci_irq = dev_tel->irq;
diff -uprN orig/drivers/isdn/hisax/hfc_pci.c linux-2.6.11-rc3/drivers/isdn/hisax/hfc_pci.c
--- orig/drivers/isdn/hisax/hfc_pci.c	2005-01-20 20:06:20.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/hfc_pci.c	2005-02-14 02:30:34.000000000 +0530
@@ -1661,7 +1661,7 @@ setup_hfcpci(struct IsdnCard *card)
 	if (cs->typ == ISDN_CTYPE_HFC_PCI) {
 		i = 0;
 		while (id_list[i].vendor_id) {
-			tmp_hfcpci = pci_find_device(id_list[i].vendor_id,
+			tmp_hfcpci = pci_get_device(id_list[i].vendor_id,
 						     id_list[i].device_id,
 						     dev_hfcpci);
 			i++;
diff -uprN orig/drivers/isdn/hisax/niccy.c linux-2.6.11-rc3/drivers/isdn/hisax/niccy.c
--- orig/drivers/isdn/hisax/niccy.c	2004-10-19 03:23:51.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/niccy.c	2005-02-14 02:30:40.000000000 +0530
@@ -312,7 +312,7 @@ setup_niccy(struct IsdnCard *card)
 #ifdef CONFIG_PCI
 		u_int pci_ioaddr;
 		cs->subtyp = 0;
-		if ((niccy_dev = pci_find_device(PCI_VENDOR_ID_SATSAGEM,
+		if ((niccy_dev = pci_get_device(PCI_VENDOR_ID_SATSAGEM,
 			PCI_DEVICE_ID_SATSAGEM_NICCY, niccy_dev))) {
 			if (pci_enable_device(niccy_dev))
 				return(0);
diff -uprN orig/drivers/isdn/hisax/nj_s.c linux-2.6.11-rc3/drivers/isdn/hisax/nj_s.c
--- orig/drivers/isdn/hisax/nj_s.c	2004-10-19 03:23:45.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/nj_s.c	2005-02-14 02:30:46.000000000 +0530
@@ -171,7 +171,7 @@ setup_netjet_s(struct IsdnCard *card)
 
 	for ( ;; )
 	{
-		if ((dev_netjet = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_netjet = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 			PCI_DEVICE_ID_TIGERJET_300,  dev_netjet))) {
 			if (pci_enable_device(dev_netjet))
 				return(0);
diff -uprN orig/drivers/isdn/hisax/nj_u.c linux-2.6.11-rc3/drivers/isdn/hisax/nj_u.c
--- orig/drivers/isdn/hisax/nj_u.c	2004-10-19 03:23:43.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/nj_u.c	2005-02-14 02:30:52.000000000 +0530
@@ -152,7 +152,7 @@ setup_netjet_u(struct IsdnCard *card)
 
 	for ( ;; )
 	{
-		if ((dev_netjet = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_netjet = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 			PCI_DEVICE_ID_TIGERJET_300,  dev_netjet))) {
 			if (pci_enable_device(dev_netjet))
 				return(0);
diff -uprN orig/drivers/isdn/hisax/sedlbauer.c linux-2.6.11-rc3/drivers/isdn/hisax/sedlbauer.c
--- orig/drivers/isdn/hisax/sedlbauer.c	2004-10-19 03:25:28.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/sedlbauer.c	2005-02-14 02:31:45.000000000 +0530
@@ -619,7 +619,7 @@ setup_sedlbauer(struct IsdnCard *card)
 #endif
 /* Probe for Sedlbauer speed pci */
 #ifdef CONFIG_PCI
-		if ((dev_sedl = pci_find_device(PCI_VENDOR_ID_TIGERJET,
+		if ((dev_sedl = pci_get_device(PCI_VENDOR_ID_TIGERJET,
 				PCI_DEVICE_ID_TIGERJET_100, dev_sedl))) {
 			if (pci_enable_device(dev_sedl))
 				return(0);
diff -uprN orig/drivers/isdn/hisax/telespci.c linux-2.6.11-rc3/drivers/isdn/hisax/telespci.c
--- orig/drivers/isdn/hisax/telespci.c	2005-01-20 20:06:20.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/telespci.c	2005-02-14 02:31:04.000000000 +0530
@@ -301,7 +301,7 @@ setup_telespci(struct IsdnCard *card)
 	if (cs->typ != ISDN_CTYPE_TELESPCI)
 		return (0);
 #ifdef CONFIG_PCI
-	if ((dev_tel = pci_find_device (PCI_VENDOR_ID_ZORAN, PCI_DEVICE_ID_ZORAN_36120, dev_tel))) {
+	if ((dev_tel = pci_get_device (PCI_VENDOR_ID_ZORAN, PCI_DEVICE_ID_ZORAN_36120, dev_tel))) {
 		if (pci_enable_device(dev_tel))
 			return(0);
 		cs->irq = dev_tel->irq;
diff -uprN orig/drivers/isdn/hisax/w6692.c linux-2.6.11-rc3/drivers/isdn/hisax/w6692.c
--- orig/drivers/isdn/hisax/w6692.c	2004-10-19 03:25:07.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hisax/w6692.c	2005-02-14 02:31:09.000000000 +0530
@@ -1014,7 +1014,7 @@ setup_w6692(struct IsdnCard *card)
 		return (0);
 #ifdef CONFIG_PCI
 	while (id_list[id_idx].vendor_id) {
-		dev_w6692 = pci_find_device(id_list[id_idx].vendor_id,
+		dev_w6692 = pci_get_device(id_list[id_idx].vendor_id,
 					    id_list[id_idx].device_id,
 					    dev_w6692);
 		if (dev_w6692) {
diff -uprN orig/drivers/isdn/hysdn/hysdn_init.c linux-2.6.11-rc3/drivers/isdn/hysdn/hysdn_init.c
--- orig/drivers/isdn/hysdn/hysdn_init.c	2004-10-19 03:24:29.000000000 +0530
+++ linux-2.6.11-rc3/drivers/isdn/hysdn/hysdn_init.c	2005-02-14 02:31:20.000000000 +0530
@@ -78,7 +78,7 @@ search_cards(void)
 
 	card_root = NULL;
 	card_last = NULL;
-	while ((akt_pcidev = pci_find_device(PCI_VENDOR_ID_HYPERCOPE, PCI_DEVICE_ID_HYPERCOPE_PLX,
+	while ((akt_pcidev = pci_get_device(PCI_VENDOR_ID_HYPERCOPE, PCI_DEVICE_ID_HYPERCOPE_PLX,
 					     akt_pcidev)) != NULL) {
 		if (pci_enable_device(akt_pcidev))
 			continue;


--===============33158630421904345==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33158630421904345==--
