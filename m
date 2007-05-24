From: Yoann Padioleau <padator@wanadoo.fr>
Date: Thu, 24 May 2007 15:18:08 +0000
Subject: [KJ] [PATCH] indentation fixes, potential parse error,
Message-Id: <87d50qqmhb.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Yoann Padioleau <padator@wanadoo.fr> 

--

diff --git a/drivers/acpi/executer/exdump.c b/drivers/acpi/executer/exdump.c
index 51c9c29..964cd02 100644
--- a/drivers/acpi/executer/exdump.c
+++ b/drivers/acpi/executer/exdump.c
@@ -451,7 +451,7 @@ void acpi_ex_dump_operand(union acpi_ope
 
 	ACPI_FUNCTION_NAME(ex_dump_operand)
 
-	    if (!((ACPI_LV_EXEC & acpi_dbg_level)
+	if (!((ACPI_LV_EXEC & acpi_dbg_level)
 		  && (_COMPONENT & acpi_dbg_layer))) {
 		return;
 	}
diff --git a/drivers/acpi/executer/exoparg2.c b/drivers/acpi/executer/exoparg2.c
index 17e652e..24d8038 100644
--- a/drivers/acpi/executer/exoparg2.c
+++ b/drivers/acpi/executer/exoparg2.c
@@ -141,7 +141,7 @@ #ifdef ACPI_GPE_NOTIFY_CHECK
 
 				/* AE_WAKE_ONLY_GPE only error, means ignore this notify */
 
-				return_ACPI_STATUS(AE_OK)
+				return_ACPI_STATUS(AE_OK);
 			}
 		}
 #endif
diff --git a/drivers/acpi/utilities/utglobal.c b/drivers/acpi/utilities/utglobal.c
index 1621655..4d8d361 100644
--- a/drivers/acpi/utilities/utglobal.c
+++ b/drivers/acpi/utilities/utglobal.c
@@ -733,5 +733,5 @@ #endif
 }
 
 ACPI_EXPORT_SYMBOL(acpi_dbg_level)
-    ACPI_EXPORT_SYMBOL(acpi_dbg_layer)
-    ACPI_EXPORT_SYMBOL(acpi_gpe_count)
+ACPI_EXPORT_SYMBOL(acpi_dbg_layer)
+ACPI_EXPORT_SYMBOL(acpi_gpe_count)
diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index bb7ef57..4dcffa3 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -2977,7 +2977,7 @@ static int ia_pkt_tx (struct atm_vcc *vc
  
 	/* Put the packet in a tx buffer */   
 	trailer = iadev->tx_buf[desc-1].cpcs;
-        IF_TX(printk("Sent: skb = 0x%x skb->data: 0x%x len: %d, desc: %d\n",
+	IF_TX(printk("Sent: skb = 0x%x skb->data: 0x%x len: %d, desc: %d\n",
                   (u32)skb, (u32)skb->data, skb->len, desc);)
 	trailer->control = 0; 
         /*big endian*/ 
diff --git a/drivers/cdrom/cm206.c b/drivers/cdrom/cm206.c
index 2301311..64a3a0b 100644
--- a/drivers/cdrom/cm206.c
+++ b/drivers/cdrom/cm206.c
@@ -672,9 +672,8 @@ static int read_sector(int start)
 		tries++;
 	} while (cd->intr_ds & ds_fifo_empty && tries < MAX_TRIES);
 	if (tries > 1)
-		debug(("Took me some tries\n"))
-		    else
-	if (tries = MAX_TRIES)
+		debug(("Took me some tries\n"));
+        else if (tries = MAX_TRIES)
 		debug(("MAX_TRIES tries for read sector\n"));
 	transport_data(r_fifo_output_buffer, cd->sector,
 		       READ_AHEAD * RAW_SECTOR_SIZE / 2);
diff --git a/drivers/char/drm/i830_drv.c b/drivers/char/drm/i830_drv.c
index 389597e..490cea7 100644
--- a/drivers/char/drm/i830_drv.c
+++ b/drivers/char/drm/i830_drv.c
@@ -48,7 +48,7 @@ static struct drm_driver driver = {
 	    DRIVER_USE_AGP | DRIVER_REQUIRE_AGP | DRIVER_USE_MTRR |
 	    DRIVER_HAVE_DMA | DRIVER_DMA_QUEUE,
 #if USE_IRQS
-	.driver_features |= DRIVER_HAVE_IRQ | DRIVER_SHARED_IRQ,
+#error TODO	.driver_features |= DRIVER_HAVE_IRQ | DRIVER_SHARED_IRQ,
 #endif
 	.dev_priv_size = sizeof(drm_i830_buf_priv_t),
 	.load = i830_driver_load,
diff --git a/drivers/isdn/hardware/eicon/capifunc.c b/drivers/isdn/hardware/eicon/capifunc.c
index ff284ae..dd644f4 100644
--- a/drivers/isdn/hardware/eicon/capifunc.c
+++ b/drivers/isdn/hardware/eicon/capifunc.c
@@ -189,7 +189,7 @@ void *TransmitBufferSet(APPL * appl, dwo
 {
 	appl->xbuffer_used[ref] = true;
 	DBG_PRV1(("%d:xbuf_used(%d)", appl->Id, ref + 1))
-	    return (void *) ref;
+	return (void *) ref;
 }
 
 void *TransmitBufferGet(APPL * appl, void *p)
diff --git a/drivers/isdn/hardware/eicon/os_bri.c b/drivers/isdn/hardware/eicon/os_bri.c
index f31bba5..437cd18 100644
--- a/drivers/isdn/hardware/eicon/os_bri.c
+++ b/drivers/isdn/hardware/eicon/os_bri.c
@@ -87,10 +87,10 @@ int diva_bri_init_card(diva_os_xdi_adapt
 	a->xdi_adapter.Properties = CardProperties[a->CardOrdinal];
 	DBG_LOG(("Load %s", a->xdi_adapter.Properties.Name))
 
-	    /*
-	       Get resources
-	     */
-	    for (bar = 0; bar < 3; bar++) {
+	/*
+	  Get resources
+	*/
+	for (bar = 0; bar < 3; bar++) {
 		a->resources.pci.bar[bar]  		    divasa_get_pci_bar(a->resources.pci.bus,
 				       a->resources.pci.func, bar,
@@ -141,10 +141,10 @@ int diva_bri_init_card(diva_os_xdi_adapt
 	bar2_length = (~(bar2_length & ~7)) + 1;
 	DBG_LOG(("BAR[2] length=%lx", bar2_length))
 
-	    /*
-	       Map and register resources
-	     */
-	    if (!(a->resources.pci.addr[0] +	/*
+	  Map and register resources
+	*/
+	if (!(a->resources.pci.addr[0]  		 divasa_remap_pci_bar(a, 0, a->resources.pci.bar[0],
 				      bri_bar_length[0]))) {
 		DBG_ERR(("A: BRI, can't map BAR[0]"))
diff --git a/drivers/md/linear.c b/drivers/md/linear.c
index d5ecd2d..71a4001 100644
--- a/drivers/md/linear.c
+++ b/drivers/md/linear.c
@@ -400,7 +400,7 @@ #ifdef MD_DEBUG
 		seq_printf(seq, "[%s",
 			   bdevname(conf->hash_table[j][0].rdev->bdev,b));
 
-		while (s > conf->hash_table[j][0].offset +
+		if (s > conf->hash_table[j][0].offset +
 		           conf->hash_table[j][0].size)
 			seq_printf(seq, "/%s] ",
 				   bdevname(conf->hash_table[j][1].rdev->bdev,b));
diff --git a/drivers/mtd/nand/ppchameleonevb.c b/drivers/mtd/nand/ppchameleonevb.c
index 38fe9e9..082073a 100644
--- a/drivers/mtd/nand/ppchameleonevb.c
+++ b/drivers/mtd/nand/ppchameleonevb.c
@@ -424,9 +424,9 @@ static void __exit ppchameleonevb_cleanu
 
 	/* Release iomaps */
 	this = (struct nand_chip *) &ppchameleon_mtd[1];
-	iounmap((void *) this->IO_ADDR_R;
+	iounmap((void *) this->IO_ADDR_R);
 	this = (struct nand_chip *) &ppchameleonevb_mtd[1];
-	iounmap((void *) this->IO_ADDR_R;
+	iounmap((void *) this->IO_ADDR_R);
 
 	/* Free the MTD device structure */
 	kfree (ppchameleon_mtd);
diff --git a/drivers/net/chelsio/subr.c b/drivers/net/chelsio/subr.c
index 7de9a61..5ca1ef3 100644
--- a/drivers/net/chelsio/subr.c
+++ b/drivers/net/chelsio/subr.c
@@ -1080,12 +1080,16 @@ static void __devinit init_link_config(s
 }
 
 #ifdef CONFIG_CHELSIO_T1_COUGAR
+#error TODO
+#if 0
+
 	if (bi->clock_cspi && !(adapter->cspi = t1_cspi_create(adapter))) {
 		CH_ERR("%s: CSPI initialization failed\n",
 		       adapter->name);
 		goto error;
 	}
 #endif
+#endif
 
 /*
  * Allocate and initialize the data structures that hold the SW state of
diff --git a/drivers/net/fec_8xx/fec_main.c b/drivers/net/fec_8xx/fec_main.c
index 88efe97..e5502af 100644
--- a/drivers/net/fec_8xx/fec_main.c
+++ b/drivers/net/fec_8xx/fec_main.c
@@ -550,7 +550,7 @@ static int fec_enet_rx_common(struct net
 				skbn = dev_alloc_skb(pkt_len + 2);
 				if (skbn != NULL) {
 					skb_reserve(skbn, 2);	/* align IP header */
-					skb_copy_from_linear_data(skb
+					skb_copy_from_linear_data(skb,
 								  skbn->data,
 								  pkt_len);
 					/* swap */
diff --git a/drivers/net/sk98lin/skrlmt.c b/drivers/net/sk98lin/skrlmt.c
index be8d1cc..761ad5a 100644
--- a/drivers/net/sk98lin/skrlmt.c
+++ b/drivers/net/sk98lin/skrlmt.c
@@ -1964,7 +1964,7 @@ SK_EVPARA	Para)	/* SK_U32 PortNumber; SK
 	SK_DBG_MSG(pAC, SK_DBGMOD_RLMT, SK_DBGCAT_CTRL,
 		("SK_RLMT_PORTSTART_TIMEOUT Port %d Event BEGIN.\n", Para.Para32[0]))
 
-		if (Para.Para32[1] != (SK_U32)-1) {
+	if (Para.Para32[1] != (SK_U32)-1) {
 		SK_DBG_MSG(pAC, SK_DBGMOD_RLMT, SK_DBGCAT_CTRL,
 			("Bad Parameter.\n"))
 		SK_DBG_MSG(pAC, SK_DBGMOD_RLMT, SK_DBGCAT_CTRL,
diff --git a/drivers/net/sk98lin/skxmac2.c b/drivers/net/sk98lin/skxmac2.c
index b4e7502..0bae4de 100644
--- a/drivers/net/sk98lin/skxmac2.c
+++ b/drivers/net/sk98lin/skxmac2.c
@@ -2723,7 +2723,7 @@ int		Port)		/* Port Index (MAC_1 + n) */
 	SK_U16		AuxStat;	/* Auxiliary Status */
 
 #ifdef TEST_ONLY
-01-Sep-2000 RA;:;:
+#error TODO 01-Sep-2000 RA;:;:
 	SK_U16		ResAb;		/* Resolved Ability */
 #endif	/* 0 */
 
@@ -2734,7 +2734,7 @@ #endif	/* 0 */
 	/* Get PHY parameters */
 	SkXmPhyRead(pAC, IoC, Port, PHY_BCOM_AUNE_LP, &LPAb);
 #ifdef TEST_ONLY
-01-Sep-2000 RA;:;:
+#error TODO 01-Sep-2000 RA;:;:
 	SkXmPhyRead(pAC, IoC, Port, PHY_BCOM_1000T_STAT, &ResAb);
 #endif	/* 0 */
 	
@@ -2764,7 +2764,7 @@ #endif	/* 0 */
 	}
 	
 #ifdef TEST_ONLY
-01-Sep-2000 RA;:;:
+#error TODO 01-Sep-2000 RA;:;:
 	/* Check Master/Slave resolution */
 	if ((ResAb & PHY_B_1000S_MSF) != 0) {
 		SK_DBG_MSG(pAC, SK_DBGMOD_HWM, SK_DBGCAT_CTRL,
diff --git a/drivers/net/skfp/pmf.c b/drivers/net/skfp/pmf.c
index efc639c..521a085 100644
--- a/drivers/net/skfp/pmf.c
+++ b/drivers/net/skfp/pmf.c
@@ -700,7 +700,7 @@ #else
 #if	NUMPHYS = 24
 		swap = "IIIIIIIIIIIIIIIIIIIIIIII" ;
 #else
-	????
+#error TODO	????
 #endif
 #endif
 #endif
diff --git a/drivers/scsi/3w-9xxx.c b/drivers/scsi/3w-9xxx.c
index eb766c3..70b47a6 100644
--- a/drivers/scsi/3w-9xxx.c
+++ b/drivers/scsi/3w-9xxx.c
@@ -1060,7 +1060,7 @@ static void *twa_get_param(TW_Device_Ext
 
 	/* Poll for completion */
 	if (twa_poll_response(tw_dev, request_id, 30))
-		TW_PRINTK(tw_dev->host, TW_DRIVER, 0x13, "No valid response during get param")
+		TW_PRINTK(tw_dev->host, TW_DRIVER, 0x13, "No valid response during get param");
 	else
 		retval = (void *)&(param->data[0]);
 
diff --git a/drivers/scsi/NCR5380.c b/drivers/scsi/NCR5380.c
index bb3cb33..88ea5a1 100644
--- a/drivers/scsi/NCR5380.c
+++ b/drivers/scsi/NCR5380.c
@@ -2625,7 +2625,7 @@ static void NCR5380_reselect(struct Scsi
 #ifdef REAL_DMA
 static void NCR5380_dma_complete(NCR5380_instance * instance) {
 	NCR5380_local_declare();
-	struct NCR5380_hostdata *hostdata = (struct NCR5380_hostdata * instance->hostdata);
+	struct NCR5380_hostdata *hostdata = (struct NCR5380_hostdata *) instance->hostdata;
 	int transferred;
 	NCR5380_setup(instance);
 
diff --git a/drivers/video/matrox/matroxfb_DAC1064.c b/drivers/video/matrox/matroxfb_DAC1064.c
index c4b570b..c2f8226 100644
--- a/drivers/video/matrox/matroxfb_DAC1064.c
+++ b/drivers/video/matrox/matroxfb_DAC1064.c
@@ -962,7 +962,7 @@ static void MGAG100_reset(WPMINFO2) {
 #ifdef G100_BROKEN_IBM_82351
 		u_int32_t d;
 
-		find 1014/22 (IBM/82351); /* if found and bridging Matrox, do some strange stuff */
+#error TODO		find 1014/22 (IBM/82351); /* if found and bridging Matrox, do some strange stuff */
 		pci_read_config_byte(ibm, PCI_SECONDARY_BUS, &b);
 		if (b = ACCESS_FBINFO(pcidev)->bus->number) {
 			pci_write_config_byte(ibm, PCI_COMMAND+1, 0);	/* disable back-to-back & SERR */
diff --git a/drivers/video/skeletonfb.c b/drivers/video/skeletonfb.c
index 836a612..75f3841 100644
--- a/drivers/video/skeletonfb.c
+++ b/drivers/video/skeletonfb.c
@@ -374,7 +374,7 @@ #undef CNVT_TOHW
      */
     if (info->fix.visual = FB_VISUAL_DIRECTCOLOR ||
 	info->fix.visual = FB_VISUAL_TRUECOLOR)
-	    write_{red|green|blue|transp}_to_clut();
+#error TODO	    write_{red|green|blue|transp}_to_clut();
 
     /* This is the point were you need to fill up the contents of
      * info->pseudo_palette. This structure is used _only_ by fbcon, thus

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
