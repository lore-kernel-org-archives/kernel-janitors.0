From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:53 +0000
Subject: [KJ] [PATCH][RESUBMIT][11/21] drivers/scsi/* - compile warning
Message-Id: <42113C2D.5008.52BF1B@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89694321748203998=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89694321748203998==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - cast integer arguments to correct 
pointer type to silence compiler warning, handle error return from 
scsi_add_host, silence compiler warnings for unused functions that are 
either actually used as a driver function in a table or are truly unused, 
add unused attribute to structures that might not be used

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/53c700.h linux-2.6.11-rc3-mm2/drivers/scsi/53c700.h
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/53c700.h	2005-02-12 12:06:25.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/53c700.h	2005-02-12 17:35:49.000000000 +0200
@@ -461,13 +461,13 @@ NCR_700_mem_readb(struct Scsi_Host *host
 	const struct NCR_700_Host_Parameters *hostdata __attribute__((unused))
 		= (struct NCR_700_Host_Parameters *)host->hostdata[0];
 
-	return readb(host->base + (reg^bE));
+	return readb((volatile void __iomem *)(host->base + (reg^bE)));
 }
 
 static inline __u32
 NCR_700_mem_readl(struct Scsi_Host *host, __u32 reg)
 {
-	__u32 value = __raw_readl(host->base + reg);
+	__u32 value = __raw_readl((volatile void __iomem *)(host->base + reg));
 	const struct NCR_700_Host_Parameters *hostdata __attribute__((unused))
 		= (struct NCR_700_Host_Parameters *)host->hostdata[0];
 #if 1
@@ -485,7 +485,7 @@ NCR_700_mem_writeb(__u8 value, struct Sc
 	const struct NCR_700_Host_Parameters *hostdata __attribute__((unused))
 		= (struct NCR_700_Host_Parameters *)host->hostdata[0];
 
-	writeb(value, host->base + (reg^bE));
+	writeb(value, (volatile void __iomem *)(host->base + (reg^bE)));
 }
 
 static inline void
@@ -500,7 +500,7 @@ NCR_700_mem_writel(__u32 value, struct S
 		BUG();
 #endif
 
-	__raw_writel(bS_to_host(value), host->base + reg);
+	__raw_writel(bS_to_host(value), (volatile void __iomem *)(host->base + reg));
 }
 
 static inline __u8
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/aha1740.c linux-2.6.11-rc3-mm2/drivers/scsi/aha1740.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/aha1740.c	2004-12-24 23:35:50.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/aha1740.c	2005-02-12 19:17:48.000000000 +0200
@@ -588,6 +588,7 @@ static Scsi_Host_Template aha1740_templa
 static int aha1740_probe (struct device *dev)
 {
 	int slotbase;
+	int err_retval = -ENODEV;
 	unsigned int irq_level, irq_type, translation;
 	struct Scsi_Host *shpnt;
 	struct aha1740_hostdata *host;
@@ -642,7 +643,10 @@ static int aha1740_probe (struct device 
 	}
 
 	eisa_set_drvdata (edev, shpnt);
-	scsi_add_host (shpnt, dev); /* XXX handle failure */
+	if (scsi_add_host (shpnt, dev)) {
+		err_retval = -EIO;
+		goto err_unmap;
+	}
 	scsi_scan_host (shpnt);
 	return 0;
 
@@ -654,7 +658,7 @@ static int aha1740_probe (struct device 
  err_release_region:
 	release_region(slotbase, SLOTSIZE);
 
-	return -ENODEV;
+	return err_retval;
 }
 
 static __devexit int aha1740_remove (struct device *dev)
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/BusLogic.c linux-2.6.11-rc3-mm2/drivers/scsi/BusLogic.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/BusLogic.c	2004-12-24 23:36:01.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/BusLogic.c	2005-02-14 00:15:07.671696416 +0200
@@ -28,6 +28,7 @@
 
 #define BusLogic_DriverVersion		"2.1.16"
 #define BusLogic_DriverDate		"18 July 2002"
+#define NO_BUSLOGIC_ABORT_COMMAND
 
 #include <linux/config.h>
 #include <linux/module.h>
@@ -2174,6 +2175,7 @@ static int BusLogic_SlaveConfigure(struc
 static int __init BusLogic_init(void)
 {
 	int BusLogicHostAdapterCount = 0, DriverOptionsIndex = 0, ProbeIndex;
+	int retval = 0;
 	struct BusLogic_HostAdapter *PrototypeHostAdapter;
 
 #ifdef MODULE
@@ -2296,7 +2298,11 @@ static int __init BusLogic_init(void)
 				scsi_host_put(Host);
 			} else {
 				BusLogic_InitializeHostStructure(HostAdapter, Host);
-				scsi_add_host(Host, NULL);
+				if(scsi_add_host(Host, NULL)) {
+					printk(KERN_ERR "BusLogic: scsi_add_host failed\n");
+					retval = -EIO;
+					goto BusLogic_init_err_cleanup;
+				}
 				scsi_scan_host(Host);
 				BusLogicHostAdapterCount++;
 			}
@@ -2309,6 +2315,7 @@ static int __init BusLogic_init(void)
 			   the CCBs, Release the System Resources, and Unregister the SCSI
 			   Host.
 			 */
+BusLogic_init_err_cleanup:
 			BusLogic_DestroyCCBs(HostAdapter);
 			BusLogic_ReleaseResources(HostAdapter);
 			list_del(&HostAdapter->host_list);
@@ -2318,7 +2325,7 @@ static int __init BusLogic_init(void)
 	kfree(PrototypeHostAdapter);
 	kfree(BusLogic_ProbeInfoList);
 	BusLogic_ProbeInfoList = NULL;
-	return 0;
+	return retval;
 }
 
 
@@ -2946,6 +2953,7 @@ static int BusLogic_QueueCommand(struct 
 }
 
 
+#ifndef NO_BUSLOGIC_ABORT_COMMAND
 /*
   BusLogic_AbortCommand aborts Command if possible.
 */
@@ -3022,6 +3030,7 @@ static int BusLogic_AbortCommand(struct 
 	}
 	return SUCCESS;
 }
+#endif
 
 /*
   BusLogic_ResetHostAdapter resets Host Adapter if possible, marking all
@@ -3529,7 +3538,7 @@ static struct scsi_host_template Bus_Log
 	.slave_configure = BusLogic_SlaveConfigure,
 	.bios_param = BusLogic_BIOSDiskParameters,
 	.eh_host_reset_handler = BusLogic_host_reset,
-#if 0
+#ifndef NO_BUSLOGIC_ABORT_COMMAND
 	.eh_abort_handler = BusLogic_AbortCommand,
 #endif
 	.unchecked_isa_dma = 1,
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/dpt_i2o.c linux-2.6.11-rc3-mm2/drivers/scsi/dpt_i2o.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/dpt_i2o.c	2005-02-12 12:06:25.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/dpt_i2o.c	2005-02-13 21:24:52.000000000 +0200
@@ -2027,8 +2027,8 @@ static irqreturn_t adpt_isr(int irq, voi
 		}
 		reply = (ulong)bus_to_virt(m);
 
-		if (readl(reply) & MSG_FAIL) {
-			u32 old_m = readl(reply+28); 
+		if (readl((volatile void __iomem *)reply) & MSG_FAIL) {
+			u32 old_m = readl((volatile void __iomem *)(reply+28)); 
 			ulong msg;
 			u32 old_context;
 			PDEBUG("%s: Failed message\n",pHba->name);
@@ -2039,34 +2039,34 @@ static irqreturn_t adpt_isr(int irq, voi
 			}
 			// Transaction context is 0 in failed reply frame
 			msg = (ulong)(pHba->msg_addr_virt + old_m);
-			old_context = readl(msg+12);
-			writel(old_context, reply+12);
+			old_context = readl((volatile void __iomem *)(msg+12));
+			writel(old_context, (volatile void __iomem *)(reply+12));
 			adpt_send_nop(pHba, old_m);
 		} 
-		context = readl(reply+8);
+		context = readl((volatile void __iomem *)(reply+8));
 		if(context & 0x40000000){ // IOCTL
-			ulong p = (ulong)(readl(reply+12));
+			ulong p = (ulong)(readl((volatile void __iomem *)(reply+12)));
 			if( p != 0) {
 				memcpy((void*)p, (void*)reply, REPLY_FRAME_SIZE * 4);
 			}
 			// All IOCTLs will also be post wait
 		}
 		if(context & 0x80000000){ // Post wait message
-			status = readl(reply+16);
+			status = readl((volatile void __iomem *)(reply+16));
 			if(status  >> 24){
 				status &=  0xffff; /* Get detail status */
 			} else {
 				status = I2O_POST_WAIT_OK;
 			}
 			if(!(context & 0x40000000)) {
-				cmd = (struct scsi_cmnd*) readl(reply+12); 
+				cmd = (struct scsi_cmnd*) readl((volatile void __iomem *)(reply+12)); 
 				if(cmd != NULL) {
 					printk(KERN_WARNING"%s: Apparent SCSI cmd in Post Wait Context - cmd=%p context=%x\n", pHba->name, cmd, context);
 				}
 			}
 			adpt_i2o_post_wait_complete(context, status);
 		} else { // SCSI message
-			cmd = (struct scsi_cmnd*) readl(reply+12); 
+			cmd = (struct scsi_cmnd*) readl((volatile void __iomem *)(reply+12)); 
 			if(cmd != NULL){
 				if(cmd->serial_number != 0) { // If not timedout
 					adpt_i2o_to_scsi(reply, cmd);
@@ -2236,16 +2236,16 @@ static s32 adpt_i2o_to_scsi(ulong reply,
 	adpt_hba* pHba;
 	u32 hba_status;
 	u32 dev_status;
-	u32 reply_flags = readl(reply) & 0xff00; // Leave it shifted up 8 bits 
+	u32 reply_flags = readl((volatile void __iomem *)reply) & 0xff00; // Leave it shifted up 8 bits 
 	// I know this would look cleaner if I just read bytes
 	// but the model I have been using for all the rest of the
 	// io is in 4 byte words - so I keep that model
-	u16 detailed_status = readl(reply+16) &0xffff;
+	u16 detailed_status = readl((volatile void __iomem *)(reply+16)) &0xffff;
 	dev_status = (detailed_status & 0xff);
 	hba_status = detailed_status >> 8;
 
 	// calculate resid for sg 
-	cmd->resid = cmd->request_bufflen - readl(reply+5);
+	cmd->resid = cmd->request_bufflen - readl((volatile void __iomem *)(reply+5));
 
 	pHba = (adpt_hba*) cmd->device->host->hostdata[0];
 
@@ -2256,7 +2256,7 @@ static s32 adpt_i2o_to_scsi(ulong reply,
 		case I2O_SCSI_DSC_SUCCESS:
 			cmd->result = (DID_OK << 16);
 			// handle underflow
-			if(readl(reply+5) < cmd->underflow ) {
+			if(readl((volatile void __iomem *)(reply+5)) < cmd->underflow ) {
 				cmd->result = (DID_ERROR <<16);
 				printk(KERN_WARNING"%s: SCSI CMD underflow\n",pHba->name);
 			}
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/dtc.c linux-2.6.11-rc3-mm2/drivers/scsi/dtc.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/dtc.c	2004-12-24 23:35:23.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/dtc.c	2005-02-12 19:17:48.000000000 +0200
@@ -183,7 +183,7 @@ static const struct signature {
  *
 */
 
-static void __init dtc_setup(char *str, int *ints)
+static void __init __attribute__((__unused__)) dtc_setup(char *str, int *ints)
 {
 	static int commandline_current = 0;
 	int i;
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/ips.c linux-2.6.11-rc3-mm2/drivers/scsi/ips.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/ips.c	2005-02-12 12:06:39.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/ips.c	2005-02-12 19:17:48.000000000 +0200
@@ -7042,8 +7042,13 @@ ips_register_scsi(int index)
 	sh->max_lun = ha->nlun;
 	sh->max_channel = ha->nbus - 1;
 	sh->can_queue = ha->max_cmds - 1;
-
-	IPS_ADD_HOST(sh, NULL);
+	/* can't use IPS_ADD_HOST macro because it ignores return value from scsi_add_host, removed from ips.h */
+	if (scsi_add_host(sh, NULL)) {
+		free_irq(ha->irq, ha);
+		scsi_host_put(sh);
+		return -1;
+	}
+	scsi_scan_host(sh);
 	return 0;
 }
 
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/ips.h linux-2.6.11-rc3-mm2/drivers/scsi/ips.h
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/ips.h	2005-02-12 12:06:39.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/ips.h	2005-02-12 19:17:48.000000000 +0200
@@ -98,7 +98,6 @@
       #define IRQ_RETVAL(x)
       #define IPS_REGISTER_HOSTS(SHT)      scsi_register_module(MODULE_SCSI_HA,SHT)
       #define IPS_UNREGISTER_HOSTS(SHT)    scsi_unregister_module(MODULE_SCSI_HA,SHT)
-      #define IPS_ADD_HOST(shost,device)
       #define IPS_REMOVE_HOST(shost)
       #define IPS_SCSI_SET_DEVICE(sh,ha)   scsi_set_pci_device(sh, (ha)->pcidev)
       #define IPS_PRINTK(level, pcidev, format, arg...)                 \
@@ -109,7 +108,6 @@
    #else
       #define IPS_REGISTER_HOSTS(SHT)      (!ips_detect(SHT))
       #define IPS_UNREGISTER_HOSTS(SHT)
-      #define IPS_ADD_HOST(shost,device)   do { scsi_add_host(shost,device); scsi_scan_host(shost); } while (0)
       #define IPS_REMOVE_HOST(shost)       scsi_remove_host(shost)
       #define IPS_SCSI_SET_DEVICE(sh,ha)   scsi_set_device(sh, &(ha)->pcidev->dev)
       #define IPS_PRINTK(level, pcidev, format, arg...)                 \
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/NCR5380.c linux-2.6.11-rc3-mm2/drivers/scsi/NCR5380.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/NCR5380.c	2004-12-24 23:34:26.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/NCR5380.c	2005-02-12 19:24:29.000000000 +0200
@@ -348,7 +348,7 @@ static int NCR5380_poll_politely(struct 
 static struct {
 	unsigned char value;
 	const char *name;
-} phases[] = {
+} phases[] __attribute__((unused)) = {
 	{PHASE_DATAOUT, "DATAOUT"}, 
 	{PHASE_DATAIN, "DATAIN"}, 
 	{PHASE_CMDOUT, "CMDOUT"}, 
@@ -567,7 +567,7 @@ static irqreturn_t __init probe_intr(int
  *	Locks: none, irqs must be enabled on entry
  */
 
-static int __init NCR5380_probe_irq(struct Scsi_Host *instance, int possible)
+static int __attribute__((unused)) __init NCR5380_probe_irq(struct Scsi_Host *instance, int possible)
 {
 	NCR5380_local_declare();
 	struct NCR5380_hostdata *hostdata = (struct NCR5380_hostdata *) instance->hostdata;
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/NCR5380.h linux-2.6.11-rc3-mm2/drivers/scsi/NCR5380.h
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/NCR5380.h	2004-12-24 23:34:57.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/NCR5380.h	2005-02-12 19:22:20.000000000 +0200
@@ -299,7 +299,7 @@ static void NCR5380_information_transfer
 static irqreturn_t NCR5380_intr(int irq, void *dev_id, struct pt_regs *regs);
 #endif
 static void NCR5380_main(void *ptr);
-static void NCR5380_print_options(struct Scsi_Host *instance);
+static void __attribute__((unused)) NCR5380_print_options(struct Scsi_Host *instance);
 #ifdef NDEBUG
 static void NCR5380_print_phase(struct Scsi_Host *instance);
 static void NCR5380_print(struct Scsi_Host *instance);
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/NCR_Q720.c linux-2.6.11-rc3-mm2/drivers/scsi/NCR_Q720.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/NCR_Q720.c	2005-02-12 12:06:25.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/NCR_Q720.c	2005-02-12 17:23:03.000000000 +0200
@@ -225,7 +225,7 @@ NCR_Q720_probe(struct device *dev)
 
 	/* The first 1k of the memory buffer is a memory map of the registers
 	 */
-	mem_base = (__u32)dma_mark_declared_memory_occupied(dev, base_addr,
+	mem_base = dma_mark_declared_memory_occupied(dev, base_addr,
 							    1024);
 	if (IS_ERR(mem_base)) {
 		printk("NCR_Q720 failed to reserve memory mapped region\n");
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/nsp32.c linux-2.6.11-rc3-mm2/drivers/scsi/nsp32.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/nsp32.c	2005-02-12 12:06:25.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/nsp32.c	2005-02-12 19:17:48.000000000 +0200
@@ -2888,7 +2888,8 @@ static int nsp32_detect(Scsi_Host_Templa
         }
 
 #if (LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
-	scsi_add_host (host, &PCIDEV->dev);
+	if (scsi_add_host (host, &PCIDEV->dev))
+		goto free_irq;
 	scsi_scan_host(host);
 #endif
 	pci_set_drvdata(PCIDEV, host);
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/sata_svw.c linux-2.6.11-rc3-mm2/drivers/scsi/sata_svw.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/sata_svw.c	2005-02-12 12:06:39.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/sata_svw.c	2005-02-12 21:53:37.000000000 +0200
@@ -103,26 +103,31 @@ static void k2_sata_tf_load(struct ata_p
 	unsigned int is_addr = tf->flags & ATA_TFLAG_ISADDR;
 
 	if (tf->ctl != ap->last_ctl) {
-		writeb(tf->ctl, ioaddr->ctl_addr);
+		writeb(tf->ctl, (volatile void __iomem *)ioaddr->ctl_addr);
 		ap->last_ctl = tf->ctl;
 		ata_wait_idle(ap);
 	}
 	if (is_addr && (tf->flags & ATA_TFLAG_LBA48)) {
-		writew(tf->feature | (((u16)tf->hob_feature) << 8), ioaddr->feature_addr);
-		writew(tf->nsect | (((u16)tf->hob_nsect) << 8), ioaddr->nsect_addr);
-		writew(tf->lbal | (((u16)tf->hob_lbal) << 8), ioaddr->lbal_addr);
-		writew(tf->lbam | (((u16)tf->hob_lbam) << 8), ioaddr->lbam_addr);
-		writew(tf->lbah | (((u16)tf->hob_lbah) << 8), ioaddr->lbah_addr);
+		writew(tf->feature | (((u16)tf->hob_feature) << 8),
+			(volatile void __iomem *)ioaddr->feature_addr);
+		writew(tf->nsect | (((u16)tf->hob_nsect) << 8),
+			(volatile void __iomem *)ioaddr->nsect_addr);
+		writew(tf->lbal | (((u16)tf->hob_lbal) << 8),
+			(volatile void __iomem *)ioaddr->lbal_addr);
+		writew(tf->lbam | (((u16)tf->hob_lbam) << 8),
+			(volatile void __iomem *)ioaddr->lbam_addr);
+		writew(tf->lbah | (((u16)tf->hob_lbah) << 8),
+			(volatile void __iomem *)ioaddr->lbah_addr);
 	} else if (is_addr) {
-		writew(tf->feature, ioaddr->feature_addr);
-		writew(tf->nsect, ioaddr->nsect_addr);
-		writew(tf->lbal, ioaddr->lbal_addr);
-		writew(tf->lbam, ioaddr->lbam_addr);
-		writew(tf->lbah, ioaddr->lbah_addr);
+		writew(tf->feature, (volatile void __iomem *)ioaddr->feature_addr);
+		writew(tf->nsect, (volatile void __iomem *)ioaddr->nsect_addr);
+		writew(tf->lbal, (volatile void __iomem *)ioaddr->lbal_addr);
+		writew(tf->lbam, (volatile void __iomem *)ioaddr->lbam_addr);
+		writew(tf->lbah, (volatile void __iomem *)ioaddr->lbah_addr);
 	}
 
 	if (tf->flags & ATA_TFLAG_DEVICE)
-		writeb(tf->device, ioaddr->device_addr);
+		writeb(tf->device, (volatile void __iomem *)ioaddr->device_addr);
 
 	ata_wait_idle(ap);
 }
@@ -133,14 +138,15 @@ static void k2_sata_tf_read(struct ata_p
 	struct ata_ioports *ioaddr = &ap->ioaddr;
 	u16 nsect, lbal, lbam, lbah;
 
-	nsect = tf->nsect = readw(ioaddr->nsect_addr);
-	lbal = tf->lbal = readw(ioaddr->lbal_addr);
-	lbam = tf->lbam = readw(ioaddr->lbam_addr);
-	lbah = tf->lbah = readw(ioaddr->lbah_addr);
-	tf->device = readw(ioaddr->device_addr);
+	nsect = tf->nsect = readw((volatile void __iomem *)ioaddr->nsect_addr);
+	lbal = tf->lbal = readw((volatile void __iomem *)ioaddr->lbal_addr);
+	lbam = tf->lbam = readw((volatile void __iomem *)ioaddr->lbam_addr);
+	lbah = tf->lbah = readw((volatile void __iomem *)ioaddr->lbah_addr);
+	tf->device = readw((volatile void __iomem *)ioaddr->device_addr);
 
 	if (tf->flags & ATA_TFLAG_LBA48) {
-		tf->hob_feature = readw(ioaddr->error_addr) >> 8;
+		tf->hob_feature =
+			readw((volatile void __iomem *)ioaddr->error_addr) >> 8;
 		tf->hob_nsect = nsect >> 8;
 		tf->hob_lbal = lbal >> 8;
 		tf->hob_lbam = lbam >> 8;
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/sata_vsc.c linux-2.6.11-rc3-mm2/drivers/scsi/sata_vsc.c
--- linux-2.6.11-rc3-mm2-original/drivers/scsi/sata_vsc.c	2005-02-12 12:06:39.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/scsi/sata_vsc.c	2005-02-12 21:58:09.000000000 +0200
@@ -80,11 +80,12 @@ static void vsc_sata_scr_write (struct a
 
 static void vsc_intr_mask_update(struct ata_port *ap, u8 ctl)
 {
-	unsigned long mask_addr;
+	volatile void __iomem *mask_addr;
 	u8 mask;
 
-	mask_addr = (unsigned long) ap->host_set->mmio_base +
-		VSC_SATA_INT_MASK_OFFSET + ap->port_no;
+	mask_addr =
+		(volatile void __iomem *)((unsigned long) ap->host_set->mmio_base +
+			VSC_SATA_INT_MASK_OFFSET + ap->port_no);
 	mask = readb(mask_addr);
 	if (ctl & ATA_NIEN)
 		mask |= 0x80;
@@ -109,21 +110,26 @@ static void vsc_sata_tf_load(struct ata_
 		vsc_intr_mask_update(ap, tf->ctl & ATA_NIEN);
 	}
 	if (is_addr && (tf->flags & ATA_TFLAG_LBA48)) {
-		writew(tf->feature | (((u16)tf->hob_feature) << 8), ioaddr->feature_addr);
-		writew(tf->nsect | (((u16)tf->hob_nsect) << 8), ioaddr->nsect_addr);
-		writew(tf->lbal | (((u16)tf->hob_lbal) << 8), ioaddr->lbal_addr);
-		writew(tf->lbam | (((u16)tf->hob_lbam) << 8), ioaddr->lbam_addr);
-		writew(tf->lbah | (((u16)tf->hob_lbah) << 8), ioaddr->lbah_addr);
+		writew(tf->feature | (((u16)tf->hob_feature) << 8),
+			(volatile void __iomem *)ioaddr->feature_addr);
+		writew(tf->nsect | (((u16)tf->hob_nsect) << 8),
+			(volatile void __iomem *)ioaddr->nsect_addr);
+		writew(tf->lbal | (((u16)tf->hob_lbal) << 8),
+			(volatile void __iomem *)ioaddr->lbal_addr);
+		writew(tf->lbam | (((u16)tf->hob_lbam) << 8),
+			(volatile void __iomem *)ioaddr->lbam_addr);
+		writew(tf->lbah | (((u16)tf->hob_lbah) << 8),
+			(volatile void __iomem *)ioaddr->lbah_addr);
 	} else if (is_addr) {
-		writew(tf->feature, ioaddr->feature_addr);
-		writew(tf->nsect, ioaddr->nsect_addr);
-		writew(tf->lbal, ioaddr->lbal_addr);
-		writew(tf->lbam, ioaddr->lbam_addr);
-		writew(tf->lbah, ioaddr->lbah_addr);
+		writew(tf->feature, (volatile void __iomem *)ioaddr->feature_addr);
+		writew(tf->nsect, (volatile void __iomem *)ioaddr->nsect_addr);
+		writew(tf->lbal, (volatile void __iomem *)ioaddr->lbal_addr);
+		writew(tf->lbam, (volatile void __iomem *)ioaddr->lbam_addr);
+		writew(tf->lbah, (volatile void __iomem *)ioaddr->lbah_addr);
 	}
 
 	if (tf->flags & ATA_TFLAG_DEVICE)
-		writeb(tf->device, ioaddr->device_addr);
+		writeb(tf->device, (volatile void __iomem *)ioaddr->device_addr);
 
 	ata_wait_idle(ap);
 }
@@ -134,14 +140,15 @@ static void vsc_sata_tf_read(struct ata_
 	struct ata_ioports *ioaddr = &ap->ioaddr;
 	u16 nsect, lbal, lbam, lbah;
 
-	nsect = tf->nsect = readw(ioaddr->nsect_addr);
-	lbal = tf->lbal = readw(ioaddr->lbal_addr);
-	lbam = tf->lbam = readw(ioaddr->lbam_addr);
-	lbah = tf->lbah = readw(ioaddr->lbah_addr);
-	tf->device = readw(ioaddr->device_addr);
+	nsect = tf->nsect = readw((volatile void __iomem *)ioaddr->nsect_addr);
+	lbal = tf->lbal = readw((volatile void __iomem *)ioaddr->lbal_addr);
+	lbam = tf->lbam = readw((volatile void __iomem *)ioaddr->lbam_addr);
+	lbah = tf->lbah = readw((volatile void __iomem *)ioaddr->lbah_addr);
+	tf->device = readw((volatile void __iomem *)ioaddr->device_addr);
 
 	if (tf->flags & ATA_TFLAG_LBA48) {
-		tf->hob_feature = readb(ioaddr->error_addr);
+		tf->hob_feature =
+			readb((volatile void __iomem *)ioaddr->error_addr);
 		tf->hob_nsect = nsect >> 8;
 		tf->hob_lbal = lbal >> 8;
 		tf->hob_lbam = lbam >> 8;
@@ -246,8 +253,8 @@ static void __devinit vsc_sata_setup_por
 	port->ctl_addr		= base + VSC_SATA_TF_CTL_OFFSET;
 	port->bmdma_addr	= base + VSC_SATA_DMA_CMD_OFFSET;
 	port->scr_addr		= base + VSC_SATA_SCR_STATUS_OFFSET;
-	writel(0, base + VSC_SATA_UP_DESCRIPTOR_OFFSET);
-	writel(0, base + VSC_SATA_UP_DATA_BUFFER_OFFSET);
+	writel(0, (volatile void __iomem *)(base + VSC_SATA_UP_DESCRIPTOR_OFFSET));
+	writel(0, (volatile void __iomem *)(base + VSC_SATA_UP_DATA_BUFFER_OFFSET));
 }
 
 




--===============89694321748203998==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89694321748203998==--
