From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 26 Aug 2005 22:42:47 +0000
Subject: [KJ] [PATCH 2/2] Cut down NULL vs 0 noise
Message-Id: <20050826224247.GB28191@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87966384691927768=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87966384691927768==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This should take care of "using 0 instead of NULL" warnings visible with
allmodconfig on alpha, i386, parisc, ppc, ppc64, s390, sh, sh64, sparc,
sparc64, x86_64.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/i386/kernel/reboot_fixups.c       |    2 +-
 arch/parisc/kernel/pci-dma.c           |    2 +-
 arch/ppc/boot/common/misc-common.c     |    4 ++--
 arch/ppc64/kernel/pSeries_iommu.c      |    2 +-
 arch/s390/kernel/module.c              |    2 +-
 arch/s390/kernel/process.c             |    2 +-
 arch/s390/kernel/profile.c             |    2 +-
 arch/s390/kernel/s390_ext.c            |    2 +-
 arch/s390/kernel/signal.c              |    2 +-
 arch/s390/kernel/time.c                |    2 +-
 arch/s390/kernel/traps.c               |    2 +-
 arch/s390/lib/string.c                 |    4 ++--
 arch/s390/mm/cmm.c                     |    8 ++++----
 arch/sh/cchips/hd6446x/hd64465/setup.c |    2 +-
 arch/sh/drivers/dma/dma-api.c          |    2 +-
 arch/sh/drivers/dma/dma-sh.c           |    5 +++--
 arch/sh/kernel/sh_bios.c               |    3 ++-
 arch/sh/kernel/smp.c                   |    2 +-
 arch/sh/mm/init.c                      |    2 +-
 arch/sh64/kernel/dma.c                 |    2 +-
 arch/sh64/kernel/process.c             |    8 ++++----
 arch/sh64/kernel/ptrace.c              |    4 ++--
 arch/sh64/mm/init.c                    |    2 +-
 arch/sh64/mm/ioremap.c                 |    2 +-
 arch/sparc/kernel/time.c               |    2 +-
 drivers/char/tpm/tpm_atmel.c           |    2 +-
 drivers/char/tpm/tpm_nsc.c             |    2 +-
 drivers/isdn/hisax/hfc4s8s_l1.c        |    2 +-
 drivers/isdn/hisax/hfc_usb.c           |    2 +-
 drivers/isdn/hisax/hfc_usb.h           |    2 +-
 drivers/media/dvb/dvb-usb/dtt200u.c    |    4 ++--
 drivers/media/dvb/dvb-usb/vp7045.c     |    2 +-
 drivers/net/bnx2.c                     |    4 ++--
 drivers/net/e100.c                     |    6 +++---
 drivers/net/ibmveth.c                  |    6 +++---
 drivers/net/skfp/smt.c                 |    2 +-
 drivers/parisc/led.c                   |    2 +-
 drivers/parisc/sba_iommu.c             |    2 +-
 drivers/parport/parport_gsc.c          |    2 +-
 drivers/s390/block/dasd_devmap.c       |    8 ++++----
 drivers/s390/block/dasd_genhd.c        |    6 +++---
 drivers/s390/char/con3215.c            |    2 +-
 drivers/s390/char/ctrlchar.c           |    2 +-
 drivers/s390/char/defkeymap.c          |    6 +++---
 drivers/s390/char/fs3270.c             |    2 +-
 drivers/s390/char/keyboard.c           |    6 +++---
 drivers/s390/char/raw3270.c            |   32 ++++++++++++++++----------------
 drivers/s390/char/raw3270.h            |    2 +-
 drivers/s390/char/tty3270.c            |   24 ++++++++++++------------
 drivers/s390/cio/ccwgroup.c            |    2 +-
 drivers/s390/cio/cio.c                 |    2 +-
 drivers/s390/cio/cmf.c                 |    8 ++++----
 drivers/s390/cio/device.c              |    8 ++++----
 drivers/s390/cio/qdio.c                |    2 +-
 drivers/s390/crypto/z90hardware.c      |    2 +-
 drivers/s390/crypto/z90main.c          |   18 +++++++++---------
 drivers/s390/net/ctctty.c              |    6 +++---
 drivers/s390/net/iucv.c                |    2 +-
 drivers/s390/net/qeth_main.c           |    6 +++---
 drivers/s390/net/qeth_sys.c            |    4 ++--
 drivers/s390/net/smsgiucv.c            |   14 +++++++-------
 drivers/s390/scsi/zfcp_erp.c           |    2 +-
 drivers/s390/scsi/zfcp_fsf.c           |    2 +-
 drivers/scsi/esp.c                     |    2 +-
 drivers/scsi/ibmvscsi/ibmvscsi.c       |    2 +-
 drivers/serial/sh-sci.c                |    4 ++--
 fs/binfmt_flat.c                       |    6 +++---
 include/asm-parisc/floppy.h            |    2 +-
 include/asm-s390/ccwdev.h              |    2 +-
 include/asm-s390/pgalloc.h             |    2 +-
 kernel/sys.c                           |    2 +-
 kernel/timer.c                         |    2 +-
 net/ipv4/tcp_input.c                   |    2 +-
 sound/oss/harmony.c                    |    4 ++--
 74 files changed, 156 insertions(+), 154 deletions(-)

Index: linux-sparse/drivers/char/tpm/tpm_nsc.c
===================================================================
--- linux-sparse.orig/drivers/char/tpm/tpm_nsc.c	2005-08-25 18:58:25.000000000 +0400
+++ linux-sparse/drivers/char/tpm/tpm_nsc.c	2005-08-26 22:20:52.000000000 +0400
@@ -239,7 +239,7 @@ static struct attribute * nsc_attrs[] = 
 	&dev_attr_pcrs.attr,
 	&dev_attr_caps.attr,
 	&dev_attr_cancel.attr,
-	0,
+	NULL,
 };
 
 static struct attribute_group nsc_attr_grp = { .attrs = nsc_attrs };
Index: linux-sparse/drivers/char/tpm/tpm_atmel.c
===================================================================
--- linux-sparse.orig/drivers/char/tpm/tpm_atmel.c	2005-08-25 18:58:25.000000000 +0400
+++ linux-sparse/drivers/char/tpm/tpm_atmel.c	2005-08-26 22:25:55.000000000 +0400
@@ -137,7 +137,7 @@ static struct attribute* atmel_attrs[] =
 	&dev_attr_pcrs.attr,
 	&dev_attr_caps.attr,
 	&dev_attr_cancel.attr,
-	0,
+	NULL,
 };
 
 static struct attribute_group atmel_attr_grp = { .attrs = atmel_attrs };
Index: linux-sparse/drivers/isdn/hisax/hfc_usb.c
===================================================================
--- linux-sparse.orig/drivers/isdn/hisax/hfc_usb.c	2005-08-25 18:58:27.000000000 +0400
+++ linux-sparse/drivers/isdn/hisax/hfc_usb.c	2005-08-26 22:26:48.000000000 +0400
@@ -136,7 +136,7 @@ static vendor_data vdata[] = {
 	 LED_SCHEME1, {0x80, -64, -32, -16}
 	 }
 	,
-	{0, 0, 0}		/* EOL element */
+	{0, 0, NULL}		/* EOL element */
 };
 
 /***************************************************************/
Index: linux-sparse/drivers/isdn/hisax/hfc_usb.h
===================================================================
--- linux-sparse.orig/drivers/isdn/hisax/hfc_usb.h	2005-08-25 18:58:27.000000000 +0400
+++ linux-sparse/drivers/isdn/hisax/hfc_usb.h	2005-08-26 22:29:11.000000000 +0400
@@ -91,7 +91,7 @@
 /**********/
 /* macros */
 /**********/
-#define write_usb(a,b,c)usb_control_msg((a)->dev,(a)->ctrl_out_pipe,0,0x40,(c),(b),0,0,HFC_CTRL_TIMEOUT)
+#define write_usb(a,b,c)usb_control_msg((a)->dev,(a)->ctrl_out_pipe,0,0x40,(c),(b),NULL,0,HFC_CTRL_TIMEOUT)
 #define read_usb(a,b,c) usb_control_msg((a)->dev,(a)->ctrl_in_pipe,1,0xC0,0,(b),(c),1,HFC_CTRL_TIMEOUT)
 
 
Index: linux-sparse/drivers/isdn/hisax/hfc4s8s_l1.c
===================================================================
--- linux-sparse.orig/drivers/isdn/hisax/hfc4s8s_l1.c	2005-08-26 19:00:33.000000000 +0400
+++ linux-sparse/drivers/isdn/hisax/hfc4s8s_l1.c	2005-08-26 22:30:07.000000000 +0400
@@ -1063,7 +1063,7 @@ tx_b_frame(struct hfc4s8s_btype *bch)
 				Write_hfc8(l1->hw, A_INC_RES_FIFO, 1);
 			}
 			ack_len += skb->truesize;
-			bch->tx_skb = 0;
+			bch->tx_skb = NULL;
 			bch->tx_cnt = 0;
 			dev_kfree_skb(skb);
 		} else
Index: linux-sparse/drivers/media/dvb/dvb-usb/dtt200u.c
===================================================================
--- linux-sparse.orig/drivers/media/dvb/dvb-usb/dtt200u.c	2005-08-25 18:58:36.000000000 +0400
+++ linux-sparse/drivers/media/dvb/dvb-usb/dtt200u.c	2005-08-26 22:30:48.000000000 +0400
@@ -152,7 +152,7 @@ static struct dvb_usb_properties dtt200u
 		  .cold_ids = { &dtt200u_usb_table[0], NULL },
 		  .warm_ids = { &dtt200u_usb_table[1], NULL },
 		},
-		{ 0 },
+		{ NULL },
 	}
 };
 
@@ -193,7 +193,7 @@ static struct dvb_usb_properties wt220u_
 		  .cold_ids = { &dtt200u_usb_table[2], NULL },
 		  .warm_ids = { &dtt200u_usb_table[3], NULL },
 		},
-		{ 0 },
+		{ NULL },
 	}
 };
 
Index: linux-sparse/drivers/media/dvb/dvb-usb/vp7045.c
===================================================================
--- linux-sparse.orig/drivers/media/dvb/dvb-usb/vp7045.c	2005-08-25 18:58:36.000000000 +0400
+++ linux-sparse/drivers/media/dvb/dvb-usb/vp7045.c	2005-08-26 22:31:35.000000000 +0400
@@ -248,7 +248,7 @@ static struct dvb_usb_properties vp7045_
 		  .cold_ids = { &vp7045_usb_table[2], NULL },
 		  .warm_ids = { &vp7045_usb_table[3], NULL },
 		},
-		{ 0 },
+		{ NULL },
 	}
 };
 
Index: linux-sparse/drivers/net/skfp/smt.c
===================================================================
--- linux-sparse.orig/drivers/net/skfp/smt.c	2005-08-25 18:58:13.000000000 +0400
+++ linux-sparse/drivers/net/skfp/smt.c	2005-08-26 22:33:15.000000000 +0400
@@ -1896,7 +1896,7 @@ void smt_swap_para(struct smt_header *sm
 
 static void smt_string_swap(char *data, const char *format, int len)
 {
-	const char	*open_paren = 0 ;
+	const char	*open_paren = NULL ;
 	int	x ;
 
 	while (len > 0  && *format) {
Index: linux-sparse/drivers/net/e100.c
===================================================================
--- linux-sparse.orig/drivers/net/e100.c	2005-08-25 18:58:14.000000000 +0400
+++ linux-sparse/drivers/net/e100.c	2005-08-26 22:34:12.000000000 +0400
@@ -1476,7 +1476,7 @@ static inline int e100_rx_alloc_skb(stru
 
 	if(pci_dma_mapping_error(rx->dma_addr)) {
 		dev_kfree_skb_any(rx->skb);
-		rx->skb = 0;
+		rx->skb = NULL;
 		rx->dma_addr = 0;
 		return -ENOMEM;
 	}
@@ -1763,7 +1763,7 @@ static int e100_up(struct nic *nic)
 	if((err = e100_hw_init(nic)))
 		goto err_clean_cbs;
 	e100_set_multicast_list(nic->netdev);
-	e100_start_receiver(nic, 0);
+	e100_start_receiver(nic, NULL);
 	mod_timer(&nic->watchdog, jiffies);
 	if((err = request_irq(nic->pdev->irq, e100_intr, SA_SHIRQ,
 		nic->netdev->name, nic->netdev)))
@@ -1843,7 +1843,7 @@ static int e100_loopback_test(struct nic
 		mdio_write(nic->netdev, nic->mii.phy_id, MII_BMCR,
 			BMCR_LOOPBACK);
 
-	e100_start_receiver(nic, 0);
+	e100_start_receiver(nic, NULL);
 
 	if(!(skb = dev_alloc_skb(ETH_DATA_LEN))) {
 		err = -ENOMEM;
Index: linux-sparse/drivers/net/bnx2.c
===================================================================
--- linux-sparse.orig/drivers/net/bnx2.c	2005-08-26 19:10:10.000000000 +0400
+++ linux-sparse/drivers/net/bnx2.c	2005-08-26 22:35:19.000000000 +0400
@@ -52,7 +52,7 @@ static struct {
 	{ "HP NC370i Multifunction Gigabit Server Adapter" },
 	{ "Broadcom NetXtreme II BCM5706 1000Base-SX" },
 	{ "HP NC370F Multifunction Gigabit Server Adapter" },
-	{ 0 },
+	{ NULL },
 	};
 
 static struct pci_device_id bnx2_pci_tbl[] = {
@@ -4910,7 +4910,7 @@ bnx2_get_ethtool_stats(struct net_device
 	struct bnx2 *bp = dev->priv;
 	int i;
 	u32 *hw_stats = (u32 *) bp->stats_blk;
-	u8 *stats_len_arr = 0;
+	u8 *stats_len_arr = NULL;
 
 	if (hw_stats == NULL) {
 		memset(buf, 0, sizeof(u64) * BNX2_NUM_STATS);
Index: linux-sparse/net/ipv4/tcp_input.c
===================================================================
--- linux-sparse.orig/net/ipv4/tcp_input.c	2005-08-25 18:58:00.000000000 +0400
+++ linux-sparse/net/ipv4/tcp_input.c	2005-08-26 22:36:10.000000000 +0400
@@ -4180,7 +4180,7 @@ int tcp_rcv_state_process(struct sock *s
 				 */
 				if (tp->rx_opt.saw_tstamp && tp->rx_opt.rcv_tsecr &&
 				    !tp->srtt)
-					tcp_ack_saw_tstamp(tp, 0, 0);
+					tcp_ack_saw_tstamp(tp, NULL, 0);
 
 				if (tp->rx_opt.tstamp_ok)
 					tp->advmss -= TCPOLEN_TSTAMP_ALIGNED;
Index: linux-sparse/arch/i386/kernel/reboot_fixups.c
===================================================================
--- linux-sparse.orig/arch/i386/kernel/reboot_fixups.c	2005-08-25 18:58:02.000000000 +0400
+++ linux-sparse/arch/i386/kernel/reboot_fixups.c	2005-08-26 22:37:21.000000000 +0400
@@ -44,7 +44,7 @@ void mach_reboot_fixups(void)
 
 	for (i=0; i < (sizeof(fixups_table)/sizeof(fixups_table[0])); i++) {
 		cur = &(fixups_table[i]);
-		dev = pci_get_device(cur->vendor, cur->device, 0);
+		dev = pci_get_device(cur->vendor, cur->device, NULL);
 		if (!dev)
 			continue;
 
Index: linux-sparse/arch/parisc/kernel/pci-dma.c
===================================================================
--- linux-sparse.orig/arch/parisc/kernel/pci-dma.c	2005-08-25 18:58:09.000000000 +0400
+++ linux-sparse/arch/parisc/kernel/pci-dma.c	2005-08-26 22:39:12.000000000 +0400
@@ -342,7 +342,7 @@ pcxl_dma_init(void)
     pcxl_res_map = (char *)__get_free_pages(GFP_KERNEL,
 					    get_order(pcxl_res_size));
     memset(pcxl_res_map, 0, pcxl_res_size);
-    proc_gsc_root = proc_mkdir("gsc", 0);
+    proc_gsc_root = proc_mkdir("gsc", NULL);
     create_proc_info_entry("dino", 0, proc_gsc_root, pcxl_proc_info);
     return 0;
 }
Index: linux-sparse/include/asm-parisc/floppy.h
===================================================================
--- linux-sparse.orig/include/asm-parisc/floppy.h	2005-08-25 18:58:52.000000000 +0400
+++ linux-sparse/include/asm-parisc/floppy.h	2005-08-26 22:42:20.000000000 +0400
@@ -58,7 +58,7 @@
 
 static int virtual_dma_count=0;
 static int virtual_dma_residue=0;
-static char *virtual_dma_addr=0;
+static char *virtual_dma_addr=NULL;
 static int virtual_dma_mode=0;
 static int doing_pdma=0;
 
Index: linux-sparse/drivers/parisc/led.c
===================================================================
--- linux-sparse.orig/drivers/parisc/led.c	2005-08-25 18:58:38.000000000 +0400
+++ linux-sparse/drivers/parisc/led.c	2005-08-26 22:43:59.000000000 +0400
@@ -222,7 +222,7 @@ static int __init led_create_procfs(void
 
 	if (led_type == -1) return -1;
 
-	proc_pdc_root = proc_mkdir("pdc", 0);
+	proc_pdc_root = proc_mkdir("pdc", NULL);
 	if (!proc_pdc_root) return -1;
 	proc_pdc_root->owner = THIS_MODULE;
 	ent = create_proc_entry("led", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
Index: linux-sparse/drivers/parisc/sba_iommu.c
===================================================================
--- linux-sparse.orig/drivers/parisc/sba_iommu.c	2005-08-25 18:58:38.000000000 +0400
+++ linux-sparse/drivers/parisc/sba_iommu.c	2005-08-26 22:43:49.000000000 +0400
@@ -993,7 +993,7 @@ static void *sba_alloc_consistent(struct
 	if (!hwdev) {
 		/* only support PCI */
 		*dma_handle = 0;
-		return 0;
+		return NULL;
 	}
 
         ret = (void *) __get_free_pages(gfp, get_order(size));
Index: linux-sparse/drivers/parport/parport_gsc.c
===================================================================
--- linux-sparse.orig/drivers/parport/parport_gsc.c	2005-08-25 18:58:38.000000000 +0400
+++ linux-sparse/drivers/parport/parport_gsc.c	2005-08-26 22:44:26.000000000 +0400
@@ -264,7 +264,7 @@ struct parport *__devinit parport_gsc_pr
 	memcpy (ops, &parport_gsc_ops, sizeof (struct parport_operations));
 	priv->ctr = 0xc;
 	priv->ctr_writable = 0xff;
-	priv->dma_buf = 0;
+	priv->dma_buf = NULL;
 	priv->dma_handle = 0;
 	priv->dev = dev;
 	p->base = base;
Index: linux-sparse/sound/oss/harmony.c
===================================================================
--- linux-sparse.orig/sound/oss/harmony.c	2005-08-25 18:58:11.000000000 +0400
+++ linux-sparse/sound/oss/harmony.c	2005-08-26 22:44:55.000000000 +0400
@@ -1256,7 +1256,7 @@ harmony_driver_probe(struct parisc_devic
 	   ever is. */
 	if (cntl & CNTL_C) {
 		printk(KERN_WARNING PFX "CNTL busy\n");
-		harmony.hpa = 0;
+		harmony.hpa = NULL;
 		return -EBUSY;
 	}
 
@@ -1278,7 +1278,7 @@ harmony_driver_probe(struct parisc_devic
 	return 0;
 
 out_err:
-	harmony.hpa = 0;
+	harmony.hpa = NULL;
 	harmony_free_buffer(&played_buf);
 	harmony_free_buffer(&recorded_buf);
 	harmony_free_buffer(&graveyard);
Index: linux-sparse/arch/ppc/boot/common/misc-common.c
===================================================================
--- linux-sparse.orig/arch/ppc/boot/common/misc-common.c	2005-08-25 18:58:01.000000000 +0400
+++ linux-sparse/arch/ppc/boot/common/misc-common.c	2005-08-26 22:46:07.000000000 +0400
@@ -306,7 +306,7 @@ _printk(char const *fmt, ...)
 void
 _vprintk(void(*putc)(const char), const char *fmt0, va_list ap)
 {
-	char c, sign, *cp = 0;
+	char c, sign, *cp = NULL;
 	int left_prec, right_prec, zero_fill, length = 0, pad, pad_on_right;
 	char buf[32];
 	long val;
@@ -514,7 +514,7 @@ void
 _dump_buf(unsigned char *p, int s)
 {
 	_printk("\n");
-	_dump_buf_with_offset(p, s, 0);
+	_dump_buf_with_offset(p, s, NULL);
 }
 
 /* Very simple inb/outb routines.  We declare ISA_io to be 0 above, and
Index: linux-sparse/arch/ppc64/kernel/pSeries_iommu.c
===================================================================
--- linux-sparse.orig/arch/ppc64/kernel/pSeries_iommu.c	2005-08-25 18:58:07.000000000 +0400
+++ linux-sparse/arch/ppc64/kernel/pSeries_iommu.c	2005-08-26 22:46:54.000000000 +0400
@@ -332,7 +332,7 @@ static void iommu_bus_setup_pSeries(stru
 
 			DBG("Python root bus %s\n", bus->name);
 
-			iohole = (unsigned int *)get_property(dn, "io-hole", 0);
+			iohole = (unsigned int *)get_property(dn, "io-hole", NULL);
 
 			if (iohole) {
 				/* On first bus we need to leave room for the
Index: linux-sparse/kernel/sys.c
===================================================================
--- linux-sparse.orig/kernel/sys.c	2005-08-25 18:58:39.000000000 +0400
+++ linux-sparse/kernel/sys.c	2005-08-26 22:49:30.000000000 +0400
@@ -386,7 +386,7 @@ void kernel_kexec(void)
 {
 #ifdef CONFIG_KEXEC
 	struct kimage *image;
-	image = xchg(&kexec_image, 0);
+	image = xchg(&kexec_image, NULL);
 	if (!image) {
 		return;
 	}
Index: linux-sparse/drivers/net/ibmveth.c
===================================================================
--- linux-sparse.orig/drivers/net/ibmveth.c	2005-08-25 18:58:16.000000000 +0400
+++ linux-sparse/drivers/net/ibmveth.c	2005-08-26 22:52:03.000000000 +0400
@@ -902,14 +902,14 @@ static int __devinit ibmveth_probe(struc
 	ibmveth_debug_printk_no_adapter("entering ibmveth_probe for UA 0x%x\n", 
 					dev->unit_address);
 
-	mac_addr_p = (unsigned char *) vio_get_attribute(dev, VETH_MAC_ADDR, 0);
+	mac_addr_p = (unsigned char *) vio_get_attribute(dev, VETH_MAC_ADDR, NULL);
 	if(!mac_addr_p) {
 		printk(KERN_ERR "(%s:%3.3d) ERROR: Can't find VETH_MAC_ADDR "
 				"attribute\n", __FILE__, __LINE__);
 		return 0;
 	}
 	
-	mcastFilterSize_p= (unsigned int *) vio_get_attribute(dev, VETH_MCAST_FILTER_SIZE, 0);
+	mcastFilterSize_p= (unsigned int *) vio_get_attribute(dev, VETH_MCAST_FILTER_SIZE, NULL);
 	if(!mcastFilterSize_p) {
 		printk(KERN_ERR "(%s:%3.3d) ERROR: Can't find "
 				"VETH_MCAST_FILTER_SIZE attribute\n",
@@ -1144,7 +1144,7 @@ static void ibmveth_proc_unregister_driv
 
 static struct vio_device_id ibmveth_device_table[] __devinitdata= {
 	{ "network", "IBM,l-lan"},
-	{ 0,}
+	{ NULL,}
 };
 
 MODULE_DEVICE_TABLE(vio, ibmveth_device_table);
Index: linux-sparse/drivers/scsi/ibmvscsi/ibmvscsi.c
===================================================================
--- linux-sparse.orig/drivers/scsi/ibmvscsi/ibmvscsi.c	2005-08-25 18:58:29.000000000 +0400
+++ linux-sparse/drivers/scsi/ibmvscsi/ibmvscsi.c	2005-08-26 22:52:38.000000000 +0400
@@ -1442,7 +1442,7 @@ static int ibmvscsi_remove(struct vio_de
  */
 static struct vio_device_id ibmvscsi_device_table[] __devinitdata = {
 	{"vscsi", "IBM,v-scsi"},
-	{0,}
+	{NULL,}
 };
 
 MODULE_DEVICE_TABLE(vio, ibmvscsi_device_table);
Index: linux-sparse/arch/s390/mm/cmm.c
===================================================================
--- linux-sparse.orig/arch/s390/mm/cmm.c	2005-08-25 18:58:04.000000000 +0400
+++ linux-sparse/arch/s390/mm/cmm.c	2005-08-26 22:53:53.000000000 +0400
@@ -42,8 +42,8 @@ static volatile long cmm_timed_pages_tar
 static long cmm_timeout_pages = 0;
 static long cmm_timeout_seconds = 0;
 
-static struct cmm_page_array *cmm_page_list = 0;
-static struct cmm_page_array *cmm_timed_page_list = 0;
+static struct cmm_page_array *cmm_page_list = NULL;
+static struct cmm_page_array *cmm_timed_page_list = NULL;
 
 static unsigned long cmm_thread_active = 0;
 static struct work_struct cmm_thread_starter;
@@ -162,7 +162,7 @@ cmm_thread(void *dummy)
 static void
 cmm_start_thread(void)
 {
-	kernel_thread(cmm_thread, 0, 0);
+	kernel_thread(cmm_thread, NULL, 0);
 }
 
 static void
@@ -419,7 +419,7 @@ cmm_init (void)
 #ifdef CONFIG_CMM_IUCV
 	smsg_register_callback(SMSG_PREFIX, cmm_smsg_target);
 #endif
-	INIT_WORK(&cmm_thread_starter, (void *) cmm_start_thread, 0);
+	INIT_WORK(&cmm_thread_starter, (void *) cmm_start_thread, NULL);
 	init_waitqueue_head(&cmm_thread_wait);
 	init_timer(&cmm_timer);
 	return 0;
Index: linux-sparse/arch/s390/kernel/traps.c
===================================================================
--- linux-sparse.orig/arch/s390/kernel/traps.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/s390/kernel/traps.c	2005-08-27 00:10:44.000000000 +0400
@@ -174,7 +174,7 @@ void show_stack(struct task_struct *task
  */
 void dump_stack(void)
 {
-	show_stack(0, 0);
+	show_stack(NULL, NULL);
 }
 
 EXPORT_SYMBOL(dump_stack);
Index: linux-sparse/arch/s390/kernel/time.c
===================================================================
--- linux-sparse.orig/arch/s390/kernel/time.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/s390/kernel/time.c	2005-08-27 00:11:31.000000000 +0400
@@ -371,7 +371,7 @@ void __init time_init(void)
                                 -xtime.tv_sec, -xtime.tv_nsec);
 
 	/* request the clock comparator external interrupt */
-        if (register_early_external_interrupt(0x1004, 0,
+        if (register_early_external_interrupt(0x1004, NULL,
 					      &ext_int_info_cc) != 0)
                 panic("Couldn't request external interrupt 0x1004");
 
Index: linux-sparse/arch/s390/kernel/process.c
===================================================================
--- linux-sparse.orig/arch/s390/kernel/process.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/s390/kernel/process.c	2005-08-27 00:12:03.000000000 +0400
@@ -155,7 +155,7 @@ void show_regs(struct pt_regs *regs)
 	show_registers(regs);
 	/* Show stack backtrace if pt_regs is from kernel mode */
 	if (!(regs->psw.mask & PSW_MASK_PSTATE))
-		show_trace(0,(unsigned long *) regs->gprs[15]);
+		show_trace(NULL,(unsigned long *) regs->gprs[15]);
 }
 
 extern void kernel_thread_starter(void);
Index: linux-sparse/arch/s390/kernel/signal.c
===================================================================
--- linux-sparse.orig/arch/s390/kernel/signal.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/s390/kernel/signal.c	2005-08-27 00:12:46.000000000 +0400
@@ -376,7 +376,7 @@ static void setup_rt_frame(int sig, stru
 
 	/* Create the ucontext.  */
 	err |= __put_user(0, &frame->uc.uc_flags);
-	err |= __put_user(0, &frame->uc.uc_link);
+	err |= __put_user(NULL, &frame->uc.uc_link);
 	err |= __put_user((void *)current->sas_ss_sp, &frame->uc.uc_stack.ss_sp);
 	err |= __put_user(sas_ss_flags(regs->gprs[15]),
 			  &frame->uc.uc_stack.ss_flags);
Index: linux-sparse/arch/s390/kernel/s390_ext.c
===================================================================
--- linux-sparse.orig/arch/s390/kernel/s390_ext.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/s390/kernel/s390_ext.c	2005-08-27 00:13:53.000000000 +0400
@@ -24,7 +24,7 @@
  * (0x1202 external call, 0x1004 cpu timer, 0x2401 hwc console, 0x4000
  * iucv and 0x2603 pfault) this is always the first element. 
  */
-ext_int_info_t *ext_int_hash[256] = { 0, };
+ext_int_info_t *ext_int_hash[256] = { NULL, };
 
 static inline int ext_hash(__u16 code)
 {
Index: linux-sparse/arch/s390/kernel/profile.c
===================================================================
--- linux-sparse.orig/arch/s390/kernel/profile.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/s390/kernel/profile.c	2005-08-27 00:14:27.000000000 +0400
@@ -13,7 +13,7 @@ static struct proc_dir_entry * root_irq_
 void init_irq_proc(void)
 {
 	/* create /proc/irq */
-	root_irq_dir = proc_mkdir("irq", 0);
+	root_irq_dir = proc_mkdir("irq", NULL);
 
 	/* create /proc/irq/prof_cpu_mask */
 	create_prof_cpu_mask(root_irq_dir);
Index: linux-sparse/arch/s390/kernel/module.c
===================================================================
--- linux-sparse.orig/arch/s390/kernel/module.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/s390/kernel/module.c	2005-08-27 00:15:33.000000000 +0400
@@ -119,7 +119,7 @@ module_frob_arch_sections(Elf_Ehdr *hdr,
 	int nrela, i, j;
 
 	/* Find symbol table and string table. */
-	symtab = 0;
+	symtab = NULL;
 	for (i = 0; i < hdr->e_shnum; i++)
 		switch (sechdrs[i].sh_type) {
 		case SHT_SYMTAB:
Index: linux-sparse/kernel/timer.c
===================================================================
--- linux-sparse.orig/kernel/timer.c	2005-08-25 18:58:39.000000000 +0400
+++ linux-sparse/kernel/timer.c	2005-08-27 00:16:00.000000000 +0400
@@ -525,7 +525,7 @@ unsigned long next_timer_interrupt(void)
 	base = &__get_cpu_var(tvec_bases);
 	spin_lock(&base->t_base.lock);
 	expires = base->timer_jiffies + (LONG_MAX >> 1);
-	list = 0;
+	list = NULL;
 
 	/* Look for timer events in tv1. */
 	j = base->timer_jiffies & TVR_MASK;
Index: linux-sparse/include/asm-s390/pgalloc.h
===================================================================
--- linux-sparse.orig/include/asm-s390/pgalloc.h	2005-08-25 18:58:54.000000000 +0400
+++ linux-sparse/include/asm-s390/pgalloc.h	2005-08-27 00:16:37.000000000 +0400
@@ -143,7 +143,7 @@ pte_alloc_one(struct mm_struct *mm, unsi
 	pte_t *pte = pte_alloc_one_kernel(mm, vmaddr);
 	if (pte)
 		return virt_to_page(pte);
-	return 0;
+	return NULL;
 }
 
 static inline void pte_free_kernel(pte_t *pte)
Index: linux-sparse/drivers/s390/block/dasd_devmap.c
===================================================================
--- linux-sparse.orig/drivers/s390/block/dasd_devmap.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/block/dasd_devmap.c	2005-08-27 00:17:55.000000000 +0400
@@ -369,7 +369,7 @@ dasd_add_busid(char *bus_id, int feature
 	if (!new)
 		return ERR_PTR(-ENOMEM);
 	spin_lock(&dasd_devmap_lock);
-	devmap = 0;
+	devmap = NULL;
 	hash = dasd_hash_busid(bus_id);
 	list_for_each_entry(tmp, &dasd_hashlists[hash], list)
 		if (strncmp(tmp->bus_id, bus_id, BUS_ID_SIZE) == 0) {
@@ -381,10 +381,10 @@ dasd_add_busid(char *bus_id, int feature
 		new->devindex = dasd_max_devindex++;
 		strncpy(new->bus_id, bus_id, BUS_ID_SIZE);
 		new->features = features;
-		new->device = 0;
+		new->device = NULL;
 		list_add(&new->list, &dasd_hashlists[hash]);
 		devmap = new;
-		new = 0;
+		new = NULL;
 	}
 	spin_unlock(&dasd_devmap_lock);
 	if (new)
@@ -456,7 +456,7 @@ dasd_device_from_devindex(int devindex)
 	int i;
 
 	spin_lock(&dasd_devmap_lock);
-	devmap = 0;
+	devmap = NULL;
 	for (i = 0; (i < 256) && !devmap; i++)
 		list_for_each_entry(tmp, &dasd_hashlists[i], list)
 			if (tmp->devindex == devindex) {
Index: linux-sparse/drivers/s390/block/dasd_genhd.c
===================================================================
--- linux-sparse.orig/drivers/s390/block/dasd_genhd.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/block/dasd_genhd.c	2005-08-27 00:18:48.000000000 +0400
@@ -92,9 +92,9 @@ void
 dasd_gendisk_free(struct dasd_device *device)
 {
 	del_gendisk(device->gdp);
-	device->gdp->queue = 0;
+	device->gdp->queue = NULL;
 	put_disk(device->gdp);
-	device->gdp = 0;
+	device->gdp = NULL;
 }
 
 /*
@@ -146,7 +146,7 @@ dasd_destroy_partitions(struct dasd_devi
 	 * device->bdev to lower the offline open_count limit again.
 	 */
 	bdev = device->bdev;
-	device->bdev = 0;
+	device->bdev = NULL;
 
 	/*
 	 * See fs/partition/check.c:delete_partition
Index: linux-sparse/drivers/s390/char/ctrlchar.c
===================================================================
--- linux-sparse.orig/drivers/s390/char/ctrlchar.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/char/ctrlchar.c	2005-08-27 00:19:25.000000000 +0400
@@ -24,7 +24,7 @@ ctrlchar_handle_sysrq(void *tty)
 	handle_sysrq(ctrlchar_sysrq_key, NULL, (struct tty_struct *) tty);
 }
 
-static DECLARE_WORK(ctrlchar_work, ctrlchar_handle_sysrq, 0);
+static DECLARE_WORK(ctrlchar_work, ctrlchar_handle_sysrq, NULL);
 #endif
 
 
Index: linux-sparse/drivers/s390/char/keyboard.c
===================================================================
--- linux-sparse.orig/drivers/s390/char/keyboard.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/char/keyboard.c	2005-08-27 00:20:33.000000000 +0400
@@ -110,7 +110,7 @@ out_maps:
 out_kbd:
 	kfree(kbd);
 out:
-	return 0;
+	return NULL;
 }
 
 void
@@ -313,7 +313,7 @@ kbd_keycode(struct kbd_data *kbd, unsign
 		if (kbd->sysrq) {
 			if (kbd->sysrq == K(KT_LATIN, '-')) {
 				kbd->sysrq = 0;
-				handle_sysrq(value, 0, kbd->tty);
+				handle_sysrq(value, NULL, kbd->tty);
 				return;
 			}
 			if (value == '-') {
@@ -372,7 +372,7 @@ do_kdsk_ioctl(struct kbd_data *kbd, stru
 			/* disallocate map */
 			key_map = kbd->key_maps[tmp.kb_table];
 			if (key_map) {
-			    kbd->key_maps[tmp.kb_table] = 0;
+			    kbd->key_maps[tmp.kb_table] = NULL;
 			    kfree(key_map);
 			}
 			break;
Index: linux-sparse/drivers/s390/char/defkeymap.c
===================================================================
--- linux-sparse.orig/drivers/s390/char/defkeymap.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/char/defkeymap.c	2005-08-27 00:21:51.000000000 +0400
@@ -83,8 +83,8 @@ static u_short shift_ctrl_map[NR_KEYS] =
 };
 
 ushort *key_maps[MAX_NR_KEYMAPS] = {
-	plain_map, shift_map, 0, 0,
-	ctrl_map, shift_ctrl_map,	0
+	plain_map, shift_map, NULL, NULL,
+	ctrl_map, shift_ctrl_map,	NULL
 };
 
 unsigned int keymap_count = 4;
@@ -145,7 +145,7 @@ char *func_table[MAX_NR_FUNC] = {
 	func_buf + 97,
 	func_buf + 103,
 	func_buf + 109,
-	0,
+	NULL,
 };
 
 struct kbdiacr accent_table[MAX_DIACR] = {
Index: linux-sparse/drivers/s390/char/con3215.c
===================================================================
--- linux-sparse.orig/drivers/s390/char/con3215.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/char/con3215.c	2005-08-27 00:22:24.000000000 +0400
@@ -702,7 +702,7 @@ raw3215_probe (struct ccw_device *cdev)
 				       GFP_KERNEL|GFP_DMA);
 	if (raw->buffer == NULL) {
 		spin_lock(&raw3215_device_lock);
-		raw3215[line] = 0;
+		raw3215[line] = NULL;
 		spin_unlock(&raw3215_device_lock);
 		kfree(raw);
 		return -ENOMEM;
Index: linux-sparse/drivers/s390/char/raw3270.c
===================================================================
--- linux-sparse.orig/drivers/s390/char/raw3270.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/char/raw3270.c	2005-08-27 00:25:02.000000000 +0400
@@ -532,7 +532,7 @@ raw3270_start_init(struct raw3270 *rp, s
 #ifdef CONFIG_TN3270_CONSOLE
 	if (raw3270_registered == 0) {
 		spin_lock_irqsave(get_ccwdev_lock(view->dev->cdev), flags);
-		rq->callback = 0;
+		rq->callback = NULL;
 		rc = __raw3270_start(rp, view, rq);
 		if (rc == 0)
 			while (!raw3270_request_final(rq)) {
@@ -696,8 +696,8 @@ raw3270_size_device(struct raw3270 *rp)
 	rp->view = &raw3270_init_view;
 	raw3270_init_view.dev = rp;
 	rc = __raw3270_size_device(rp);
-	raw3270_init_view.dev = 0;
-	rp->view = 0;
+	raw3270_init_view.dev = NULL;
+	rp->view = NULL;
 	up(&raw3270_init_sem);
 	if (rc == 0) {	/* Found something. */
 		/* Try to find a model. */
@@ -732,8 +732,8 @@ raw3270_reset_device(struct raw3270 *rp)
 	rp->view = &raw3270_init_view;
 	raw3270_init_view.dev = rp;
 	rc = raw3270_start_init(rp, &raw3270_init_view, &raw3270_init_request);
-	raw3270_init_view.dev = 0;
-	rp->view = 0;
+	raw3270_init_view.dev = NULL;
+	rp->view = NULL;
 	up(&raw3270_init_sem);
 	return rc;
 }
@@ -888,7 +888,7 @@ raw3270_activate_view(struct raw3270_vie
 	else if (!test_bit(RAW3270_FLAGS_READY, &rp->flags))
 		rc = -ENODEV;
 	else {
-		oldview = 0;
+		oldview = NULL;
 		if (rp->view) {
 			oldview = rp->view;
 			oldview->fn->deactivate(oldview);
@@ -905,7 +905,7 @@ raw3270_activate_view(struct raw3270_vie
 						rp->view = nv;
 						if (nv->fn->activate(nv) == 0)
 							break;
-						rp->view = 0;
+						rp->view = NULL;
 					}
 			}
 		}
@@ -929,7 +929,7 @@ raw3270_deactivate_view(struct raw3270_v
 	spin_lock_irqsave(get_ccwdev_lock(rp->cdev), flags);
 	if (rp->view == view) {
 		view->fn->deactivate(view);
-		rp->view = 0;
+		rp->view = NULL;
 		/* Move deactivated view to end of list. */
 		list_del_init(&view->list);
 		list_add_tail(&view->list, &rp->view_list);
@@ -1027,7 +1027,7 @@ raw3270_del_view(struct raw3270_view *vi
 	spin_lock_irqsave(get_ccwdev_lock(rp->cdev), flags);
 	if (rp->view == view) {
 		view->fn->deactivate(view);
-		rp->view = 0;
+		rp->view = NULL;
 	}
 	list_del_init(&view->list);
 	if (!rp->view && test_bit(RAW3270_FLAGS_READY, &rp->flags)) {
@@ -1062,9 +1062,9 @@ raw3270_delete_device(struct raw3270 *rp
 
 	/* Disconnect from ccw_device. */
 	cdev = rp->cdev;
-	rp->cdev = 0;
-	cdev->dev.driver_data = 0;
-	cdev->handler = 0;
+	rp->cdev = NULL;
+	cdev->dev.driver_data = NULL;
+	cdev->handler = NULL;
 
 	/* Put ccw_device structure. */
 	put_device(&cdev->dev);
@@ -1089,7 +1089,7 @@ raw3270_model_show(struct device *dev, s
 	return snprintf(buf, PAGE_SIZE, "%i\n",
 			((struct raw3270 *) dev->driver_data)->model);
 }
-static DEVICE_ATTR(model, 0444, raw3270_model_show, 0);
+static DEVICE_ATTR(model, 0444, raw3270_model_show, NULL);
 
 static ssize_t
 raw3270_rows_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -1097,7 +1097,7 @@ raw3270_rows_show(struct device *dev, st
 	return snprintf(buf, PAGE_SIZE, "%i\n",
 			((struct raw3270 *) dev->driver_data)->rows);
 }
-static DEVICE_ATTR(rows, 0444, raw3270_rows_show, 0);
+static DEVICE_ATTR(rows, 0444, raw3270_rows_show, NULL);
 
 static ssize_t
 raw3270_columns_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -1105,7 +1105,7 @@ raw3270_columns_show(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%i\n",
 			((struct raw3270 *) dev->driver_data)->cols);
 }
-static DEVICE_ATTR(columns, 0444, raw3270_columns_show, 0);
+static DEVICE_ATTR(columns, 0444, raw3270_columns_show, NULL);
 
 static struct attribute * raw3270_attrs[] = {
 	&dev_attr_model.attr,
@@ -1219,7 +1219,7 @@ raw3270_remove (struct ccw_device *cdev)
 	spin_lock_irqsave(get_ccwdev_lock(cdev), flags);
 	if (rp->view) {
 		rp->view->fn->deactivate(rp->view);
-		rp->view = 0;
+		rp->view = NULL;
 	}
 	while (!list_empty(&rp->view_list)) {
 		v = list_entry(rp->view_list.next, struct raw3270_view, list);
Index: linux-sparse/drivers/s390/char/raw3270.h
===================================================================
--- linux-sparse.orig/drivers/s390/char/raw3270.h	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/char/raw3270.h	2005-08-27 00:25:40.000000000 +0400
@@ -226,7 +226,7 @@ alloc_string(struct list_head *free_list
 		INIT_LIST_HEAD(&cs->update);
 		return cs;
 	}
-	return 0;
+	return NULL;
 }
 
 static inline unsigned long
Index: linux-sparse/drivers/s390/char/tty3270.c
===================================================================
--- linux-sparse.orig/drivers/s390/char/tty3270.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/char/tty3270.c	2005-08-27 00:28:01.000000000 +0400
@@ -438,7 +438,7 @@ tty3270_rcl_add(struct tty3270 *tp, char
 {
 	struct string *s;
 
-	tp->rcl_walk = 0;
+	tp->rcl_walk = NULL;
 	if (len <= 0)
 		return;
 	if (tp->rcl_nr >= tp->rcl_max) {
@@ -467,12 +467,12 @@ tty3270_rcl_backward(struct kbd_data *kb
 		else if (!list_empty(&tp->rcl_lines))
 			tp->rcl_walk = tp->rcl_lines.prev;
 		s = tp->rcl_walk ? 
-			list_entry(tp->rcl_walk, struct string, list) : 0;
+			list_entry(tp->rcl_walk, struct string, list) : NULL;
 		if (tp->rcl_walk) {
 			s = list_entry(tp->rcl_walk, struct string, list);
 			tty3270_update_prompt(tp, s->string, s->len);
 		} else
-			tty3270_update_prompt(tp, 0, 0);
+			tty3270_update_prompt(tp, NULL, 0);
 		tty3270_set_timer(tp, 1);
 	}
 	spin_unlock_bh(&tp->view.lock);
@@ -554,7 +554,7 @@ tty3270_read_tasklet(struct raw3270_requ
 	 * has to be emitted to the tty and for 0x6d the screen
 	 * needs to be redrawn.
 	 */
-	input = 0;
+	input = NULL;
 	len = 0;
 	if (tp->input->string[0] == 0x7d) {
 		/* Enter: write input to tty. */
@@ -568,7 +568,7 @@ tty3270_read_tasklet(struct raw3270_requ
 			tty3270_update_status(tp);
 		}
 		/* Clear input area. */
-		tty3270_update_prompt(tp, 0, 0);
+		tty3270_update_prompt(tp, NULL, 0);
 		tty3270_set_timer(tp, 1);
 	} else if (tp->input->string[0] == 0x6d) {
 		/* Display has been cleared. Redraw. */
@@ -818,8 +818,8 @@ tty3270_release(struct raw3270_view *vie
 	tp = (struct tty3270 *) view;
 	tty = tp->tty;
 	if (tty) {
-		tty->driver_data = 0;
-		tp->tty = tp->kbd->tty = 0;
+		tty->driver_data = NULL;
+		tp->tty = tp->kbd->tty = NULL;
 		tty_hangup(tty);
 		raw3270_put_view(&tp->view);
 	}
@@ -954,8 +954,8 @@ tty3270_close(struct tty_struct *tty, st
 		return;
 	tp = (struct tty3270 *) tty->driver_data;
 	if (tp) {
-		tty->driver_data = 0;
-		tp->tty = tp->kbd->tty = 0;
+		tty->driver_data = NULL;
+		tp->tty = tp->kbd->tty = NULL;
 		raw3270_put_view(&tp->view);
 	}
 }
@@ -1679,7 +1679,7 @@ tty3270_set_termios(struct tty_struct *t
 		new = L_ECHO(tty) ? TF_INPUT: TF_INPUTN;
 		if (new != tp->inattr) {
 			tp->inattr = new;
-			tty3270_update_prompt(tp, 0, 0);
+			tty3270_update_prompt(tp, NULL, 0);
 			tty3270_set_timer(tp, 1);
 		}
 	}
@@ -1765,7 +1765,7 @@ void
 tty3270_notifier(int index, int active)
 {
 	if (active)
-		tty_register_device(tty3270_driver, index, 0);
+		tty_register_device(tty3270_driver, index, NULL);
 	else
 		tty_unregister_device(tty3270_driver, index);
 }
@@ -1824,7 +1824,7 @@ tty3270_exit(void)
 
 	raw3270_unregister_notifier(tty3270_notifier);
 	driver = tty3270_driver;
-	tty3270_driver = 0;
+	tty3270_driver = NULL;
 	tty_unregister_driver(driver);
 	tty3270_del_views();
 }
Index: linux-sparse/drivers/s390/char/fs3270.c
===================================================================
--- linux-sparse.orig/drivers/s390/char/fs3270.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/char/fs3270.c	2005-08-27 00:28:30.000000000 +0400
@@ -328,7 +328,7 @@ fs3270_close(struct inode *inode, struct
 	struct fs3270 *fp;
 
 	fp = filp->private_data;
-	filp->private_data = 0;
+	filp->private_data = NULL;
 	if (fp)
 		raw3270_del_view(&fp->view);
 	return 0;
Index: linux-sparse/drivers/s390/cio/cio.c
===================================================================
--- linux-sparse.orig/drivers/s390/cio/cio.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/cio/cio.c	2005-08-27 00:40:53.000000000 +0400
@@ -781,7 +781,7 @@ struct subchannel *
 cio_get_console_subchannel(void)
 {
 	if (!console_subchannel_in_use)
-		return 0;
+		return NULL;
 	return &console_subchannel;
 }
 
Index: linux-sparse/drivers/s390/cio/device.c
===================================================================
--- linux-sparse.orig/drivers/s390/cio/device.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/cio/device.c	2005-08-27 00:42:35.000000000 +0400
@@ -101,7 +101,7 @@ ccw_hotplug (struct device *dev, char **
 	if ((buffer_size - length <= 0) || (i >= num_envp))
 		return -ENOMEM;
 
-	envp[i] = 0;
+	envp[i] = NULL;
 
 	return 0;
 }
@@ -1047,7 +1047,7 @@ get_ccwdev_by_busid(struct ccw_driver *c
 				 __ccwdev_check_busid);
 	put_driver(drv);
 
-	return dev ? to_ccwdev(dev) : 0;
+	return dev ? to_ccwdev(dev) : NULL;
 }
 
 /************************** device driver handling ************************/
@@ -1072,7 +1072,7 @@ ccw_device_probe (struct device *dev)
 	ret = cdrv->probe ? cdrv->probe(cdev) : -ENODEV;
 
 	if (ret) {
-		cdev->drv = 0;
+		cdev->drv = NULL;
 		return ret;
 	}
 
@@ -1103,7 +1103,7 @@ ccw_device_remove (struct device *dev)
 				 ret, cdev->dev.bus_id);
 	}
 	ccw_device_set_timeout(cdev, 0);
-	cdev->drv = 0;
+	cdev->drv = NULL;
 	return 0;
 }
 
Index: linux-sparse/include/asm-s390/ccwdev.h
===================================================================
--- linux-sparse.orig/include/asm-s390/ccwdev.h	2005-08-25 18:58:54.000000000 +0400
+++ linux-sparse/include/asm-s390/ccwdev.h	2005-08-27 00:41:28.000000000 +0400
@@ -63,7 +63,7 @@ ccw_device_id_match(const struct ccw_dev
 		return id;
 	}
 
-	return 0;
+	return NULL;
 }
 
 /* The struct ccw device is our replacement for the globally accessible
Index: linux-sparse/drivers/s390/cio/cmf.c
===================================================================
--- linux-sparse.orig/drivers/s390/cio/cmf.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/cio/cmf.c	2005-08-27 00:43:23.000000000 +0400
@@ -255,7 +255,7 @@ static int set_schib_wait(struct ccw_dev
 		spin_lock_irq(cdev->ccwlock);
 		if (s.ret == 1) {
 			s.ret = -ERESTARTSYS;
-			cdev->private->cmb_wait = 0;
+			cdev->private->cmb_wait = NULL;
 			if (cdev->private->state == DEV_STATE_CMFCHANGE)
 				cdev->private->state = DEV_STATE_ONLINE;
 		}
@@ -273,7 +273,7 @@ void retry_set_schib(struct ccw_device *
 	struct set_schib_struct *s;
 
 	s = cdev->private->cmb_wait;
-	cdev->private->cmb_wait = 0;
+	cdev->private->cmb_wait = NULL;
 	if (!s) {
 		WARN_ON(1);
 		return;
@@ -874,7 +874,7 @@ static struct attribute *cmf_attributes[
 	&dev_attr_avg_device_disconnect_time.attr,
 	&dev_attr_avg_control_unit_queuing_time.attr,
 	&dev_attr_avg_device_active_only_time.attr,
-	0,
+	NULL,
 };
 
 static struct attribute_group cmf_attr_group = {
@@ -894,7 +894,7 @@ static struct attribute *cmf_attributes_
 	&dev_attr_avg_device_active_only_time.attr,
 	&dev_attr_avg_device_busy_time.attr,
 	&dev_attr_avg_initial_command_response_time.attr,
-	0,
+	NULL,
 };
 
 static struct attribute_group cmf_attr_group_ext = {
Index: linux-sparse/drivers/s390/cio/ccwgroup.c
===================================================================
--- linux-sparse.orig/drivers/s390/cio/ccwgroup.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/cio/ccwgroup.c	2005-08-27 00:44:01.000000000 +0400
@@ -325,7 +325,7 @@ ccwgroup_online_store (struct device *de
 	if (!try_module_get(gdrv->owner))
 		return -EINVAL;
 
-	value = simple_strtoul(buf, 0, 0);
+	value = simple_strtoul(buf, NULL, 0);
 	ret = count;
 	if (value == 1)
 		ccwgroup_set_online(gdev);
Index: linux-sparse/drivers/s390/cio/qdio.c
===================================================================
--- linux-sparse.orig/drivers/s390/cio/qdio.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/cio/qdio.c	2005-08-27 00:44:23.000000000 +0400
@@ -2384,7 +2384,7 @@ qdio_free(struct ccw_device *cdev)
 	QDIO_DBF_TEXT1(0,trace,dbf_text);
 	QDIO_DBF_TEXT0(0,setup,dbf_text);
 
-	cdev->private->qdio_data = 0;
+	cdev->private->qdio_data = NULL;
 
 	up(&irq_ptr->setting_up_sema);
 
Index: linux-sparse/drivers/s390/crypto/z90main.c
===================================================================
--- linux-sparse.orig/drivers/s390/crypto/z90main.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/crypto/z90main.c	2005-08-27 00:46:29.000000000 +0400
@@ -672,10 +672,10 @@ z90crypt_init_module(void)
 	add_timer(&cleanup_timer);
 
 	/* Set up the proc file system */
-	entry = create_proc_entry("driver/z90crypt", 0644, 0);
+	entry = create_proc_entry("driver/z90crypt", 0644, NULL);
 	if (entry) {
 		entry->nlink = 1;
-		entry->data = 0;
+		entry->data = NULL;
 		entry->read_proc = z90crypt_status;
 		entry->write_proc = z90crypt_status_write;
 	}
@@ -726,7 +726,7 @@ z90crypt_cleanup_module(void)
 
 	PDEBUG("PID %d\n", PID());
 
-	remove_proc_entry("driver/z90crypt", 0);
+	remove_proc_entry("driver/z90crypt", NULL);
 
 #ifndef Z90CRYPT_USE_HOTPLUG
 	if ((nresult = misc_deregister(&z90crypt_misc_device)))
@@ -2323,7 +2323,7 @@ receive_from_crypto_device(int index, un
 	if (z90crypt.terminating)
 		return REC_FATAL_ERROR;
 
-	caller_p = 0;
+	caller_p = NULL;
 	dev_ptr = z90crypt.device_p[index];
 	rv = 0;
 	do {
@@ -2387,7 +2387,7 @@ receive_from_crypto_device(int index, un
 					break;
 				}
 			}
-			caller_p = 0;
+			caller_p = NULL;
 		}
 		if (!caller_p) {
 			PRINTKW("Unable to locate PSMID %02X%02X%02X%02X%02X"
@@ -2507,7 +2507,7 @@ helper_handle_work_element(int index, un
 	struct work_element *pq_p;
 	struct list_head *lptr, *tptr;
 
-	pq_p = 0;
+	pq_p = NULL;
 	list_for_each_safe(lptr, tptr, &pending_list) {
 		pq_p = list_entry(lptr, struct work_element, liste);
 		if (!memcmp(pq_p->caller_id, psmid, sizeof(pq_p->caller_id))) {
@@ -2516,7 +2516,7 @@ helper_handle_work_element(int index, un
 			pq_p->audit[1] |= FP_NOTPENDING;
 			break;
 		}
-		pq_p = 0;
+		pq_p = NULL;
 	}
 
 	if (!pq_p) {
@@ -2620,7 +2620,7 @@ z90crypt_reader_task(unsigned long ptr)
 	 * exiting the loop. If (pendingq_count+requestq_count) == 0 after the
 	 * loop, there is no work remaining on the queues.
 	 */
-	resp_addr = 0;
+	resp_addr = NULL;
 	workavail = 2;
 	buff_len = 0;
 	while (workavail) {
@@ -3185,7 +3185,7 @@ destroy_crypto_device(int index)
 		disabledFlag = 0;
 		t = -1;
 	}
-	z90crypt.device_p[index] = 0;
+	z90crypt.device_p[index] = NULL;
 
 	/* if the type is valid, remove the device from the type_mask */
 	if ((t != -1) && z90crypt.hdware_info->type_mask[t].st_mask[index]) {
Index: linux-sparse/drivers/s390/crypto/z90hardware.c
===================================================================
--- linux-sparse.orig/drivers/s390/crypto/z90hardware.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/crypto/z90hardware.c	2005-08-27 00:46:57.000000000 +0400
@@ -2112,7 +2112,7 @@ convert_response(unsigned char *response
 	struct CPRB *cprb_p;
 	struct CPRBX *cprbx_p;
 
-	src_p = 0;
+	src_p = NULL;
 	reply_code = 0;
 	service_rc = 0;
 	service_rs = 0;
Index: linux-sparse/drivers/s390/net/iucv.c
===================================================================
--- linux-sparse.orig/drivers/s390/net/iucv.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/net/iucv.c	2005-08-27 00:47:31.000000000 +0400
@@ -713,7 +713,7 @@ iucv_retrieve_buffer (void)
 	iucv_debug(1, "entering");
 	if (iucv_cpuid != -1) {
 		smp_call_function_on(iucv_retrieve_buffer_cpuid,
-				     0, 0, 1, iucv_cpuid);
+				     NULL, 0, 1, iucv_cpuid);
 		/* Release the cpu reserved by iucv_declare_buffer. */
 		smp_put_cpu(iucv_cpuid);
 		iucv_cpuid = -1;
Index: linux-sparse/drivers/s390/net/smsgiucv.c
===================================================================
--- linux-sparse.orig/drivers/s390/net/smsgiucv.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/net/smsgiucv.c	2005-08-27 00:50:32.000000000 +0400
@@ -66,7 +66,7 @@ smsg_message_pending(iucv_MessagePending
 		return;
 	}
 	rc = iucv_receive(eib->ippathid, eib->ipmsgid, eib->iptrgcls,
-			  msg, len, 0, 0, 0);
+			  msg, len, NULL, NULL, NULL);
 	if (rc == 0) {
 		msg[len] = 0;
 		EBCASC(msg, len);
@@ -122,7 +122,7 @@ smsg_unregister_callback(char *prefix, v
 	struct smsg_callback *cb, *tmp;
 
 	spin_lock(&smsg_list_lock);
-	cb = 0;
+	cb = NULL;
 	list_for_each_entry(tmp, &smsg_list, list)
 		if (tmp->callback == callback &&
 		    strcmp(tmp->prefix, prefix) == 0) {
@@ -139,7 +139,7 @@ smsg_exit(void)
 {
 	if (smsg_handle > 0) {
 		cpcmd("SET SMSG OFF", NULL, 0, NULL);
-		iucv_sever(smsg_pathid, 0);
+		iucv_sever(smsg_pathid, NULL);
 		iucv_unregister_program(smsg_handle);
 		driver_unregister(&smsg_driver);
 	}
@@ -162,19 +162,19 @@ smsg_init(void)
 		return rc;
 	}
 	smsg_handle = iucv_register_program("SMSGIUCV        ", "*MSG    ",
-					    pgmmask, &smsg_ops, 0);
+					    pgmmask, &smsg_ops, NULL);
 	if (!smsg_handle) {
 		printk(KERN_ERR "SMSGIUCV: failed to register to iucv");
 		driver_unregister(&smsg_driver);
 		return -EIO;	/* better errno ? */
 	}
-	rc = iucv_connect (&smsg_pathid, 1, 0, "*MSG    ", 0, 0, 0, 0,
-			   smsg_handle, 0);
+	rc = iucv_connect(&smsg_pathid, 1, NULL, "*MSG    ", NULL, 0, NULL,
+			  NULL, smsg_handle, NULL);
 	if (rc) {
 		printk(KERN_ERR "SMSGIUCV: failed to connect to *MSG");
 		iucv_unregister_program(smsg_handle);
 		driver_unregister(&smsg_driver);
-		smsg_handle = 0;
+		smsg_handle = NULL;
 		return -EIO;
 	}
 	cpcmd("SET SMSG IUCV", NULL, 0, NULL);
Index: linux-sparse/drivers/s390/net/ctctty.c
===================================================================
--- linux-sparse.orig/drivers/s390/net/ctctty.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/net/ctctty.c	2005-08-27 00:51:29.000000000 +0400
@@ -1053,7 +1053,7 @@ ctc_tty_close(struct tty_struct *tty, st
 		info->lsr |= UART_LSR_TEMT;
 	}
 	tty_ldisc_flush(tty);
-	info->tty = 0;
+	info->tty = NULL;
 	tty->closing = 0;
 	if (info->blocked_open) {
 		msleep_interruptible(500);
@@ -1082,7 +1082,7 @@ ctc_tty_hangup(struct tty_struct *tty)
 	info->count = 0;
 	info->flags &= ~CTC_ASYNC_NORMAL_ACTIVE;
 	spin_lock_irqsave(&ctc_tty_lock, saveflags);
-	info->tty = 0;
+	info->tty = NULL;
 	spin_unlock_irqrestore(&ctc_tty_lock, saveflags);
 	wake_up_interruptible(&info->open_wait);
 }
@@ -1176,7 +1176,7 @@ ctc_tty_init(void)
 				(unsigned long) info);
 		info->magic = CTC_ASYNC_MAGIC;
 		info->line = i;
-		info->tty = 0;
+		info->tty = NULL;
 		info->count = 0;
 		info->blocked_open = 0;
 		init_waitqueue_head(&info->open_wait);
Index: linux-sparse/drivers/s390/net/qeth_main.c
===================================================================
--- linux-sparse.orig/drivers/s390/net/qeth_main.c	2005-08-26 21:37:33.000000000 +0400
+++ linux-sparse/drivers/s390/net/qeth_main.c	2005-08-27 00:52:15.000000000 +0400
@@ -8062,7 +8062,7 @@ out:
 
 static struct notifier_block qeth_ip_notifier = {
 	qeth_ip_event,
-	0
+	NULL
 };
 
 #ifdef CONFIG_QETH_IPV6
@@ -8115,7 +8115,7 @@ out:
 
 static struct notifier_block qeth_ip6_notifier = {
 	qeth_ip6_event,
-	0
+	NULL
 };
 #endif
 
@@ -8142,7 +8142,7 @@ qeth_reboot_event(struct notifier_block 
 
 static struct notifier_block qeth_reboot_notifier = {
 	qeth_reboot_event,
-	0
+	NULL
 };
 
 static int
Index: linux-sparse/drivers/s390/net/qeth_sys.c
===================================================================
--- linux-sparse.orig/drivers/s390/net/qeth_sys.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/net/qeth_sys.c	2005-08-27 00:53:20.000000000 +0400
@@ -1735,7 +1735,7 @@ qeth_driver_group_store(struct device_dr
 }
 
 
-static DRIVER_ATTR(group, 0200, 0, qeth_driver_group_store);
+static DRIVER_ATTR(group, 0200, NULL, qeth_driver_group_store);
 
 static ssize_t
 qeth_driver_notifier_register_store(struct device_driver *ddrv, const char *buf,
@@ -1763,7 +1763,7 @@ qeth_driver_notifier_register_store(stru
 	return count;
 }
 
-static DRIVER_ATTR(notifier_register, 0200, 0,
+static DRIVER_ATTR(notifier_register, 0200, NULL,
 		   qeth_driver_notifier_register_store);
 
 int
Index: linux-sparse/drivers/s390/scsi/zfcp_erp.c
===================================================================
--- linux-sparse.orig/drivers/s390/scsi/zfcp_erp.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/scsi/zfcp_erp.c	2005-08-27 00:54:14.000000000 +0400
@@ -2130,7 +2130,7 @@ zfcp_erp_adapter_strategy_open_qdio(stru
 		sbale = &(adapter->response_queue.buffer[i]->element[0]);
 		sbale->length = 0;
 		sbale->flags = SBAL_FLAGS_LAST_ENTRY;
-		sbale->addr = 0;
+		sbale->addr = NULL;
 	}
 
 	ZFCP_LOG_TRACE("calling do_QDIO on adapter %s (flags=0x%x, "
Index: linux-sparse/drivers/s390/scsi/zfcp_fsf.c
===================================================================
--- linux-sparse.orig/drivers/s390/scsi/zfcp_fsf.c	2005-08-25 18:58:28.000000000 +0400
+++ linux-sparse/drivers/s390/scsi/zfcp_fsf.c	2005-08-27 00:54:44.000000000 +0400
@@ -2199,7 +2199,7 @@ zfcp_fsf_exchange_port_data(struct zfcp_
 
 	/* setup new FSF request */
 	retval = zfcp_fsf_req_create(adapter, FSF_QTCB_EXCHANGE_PORT_DATA,
-                                     0, 0, &lock_flags, &fsf_req);
+                                     0, NULL, &lock_flags, &fsf_req);
 	if (retval < 0) {
 		ZFCP_LOG_INFO("error: Out of resources. Could not create an "
                               "exchange port data request for"
Index: linux-sparse/arch/s390/lib/string.c
===================================================================
--- linux-sparse.orig/arch/s390/lib/string.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/s390/lib/string.c	2005-08-27 00:55:34.000000000 +0400
@@ -233,7 +233,7 @@ char * strrchr(const char * s, int c)
 		       if (s[len] == (char) c)
 			       return (char *) s + len;
 	       } while (--len > 0);
-       return 0;
+       return NULL;
 }
 EXPORT_SYMBOL(strrchr);
 
@@ -267,7 +267,7 @@ char * strstr(const char * s1,const char
 			return (char *) s1;
 		s1++;
 	}
-	return 0;
+	return NULL;
 }
 EXPORT_SYMBOL(strstr);
 
Index: linux-sparse/arch/sh/kernel/smp.c
===================================================================
--- linux-sparse.orig/arch/sh/kernel/smp.c	2005-08-25 18:58:01.000000000 +0400
+++ linux-sparse/arch/sh/kernel/smp.c	2005-08-27 00:56:20.000000000 +0400
@@ -146,7 +146,7 @@ static void stop_this_cpu(void *unused)
 
 void smp_send_stop(void)
 {
-	smp_call_function(stop_this_cpu, 0, 1, 0);
+	smp_call_function(stop_this_cpu, NULL, 1, 0);
 }
 
 
Index: linux-sparse/arch/sh/kernel/sh_bios.c
===================================================================
--- linux-sparse.orig/arch/sh/kernel/sh_bios.c	2005-08-25 18:58:01.000000000 +0400
+++ linux-sparse/arch/sh/kernel/sh_bios.c	2005-08-27 00:59:20.000000000 +0400
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/stddef.h>
 #include <asm/sh_bios.h>
 
 #define BIOS_CALL_CONSOLE_WRITE     	0
@@ -46,7 +47,7 @@ void sh_bios_char_out(char ch)
 int sh_bios_in_gdb_mode(void)
 {
     static char queried = 0;
-    static char *gdb_mode_p = 0;
+    static char *gdb_mode_p = NULL;
 
     if (!queried)
     {
Index: linux-sparse/arch/sh/mm/init.c
===================================================================
--- linux-sparse.orig/arch/sh/mm/init.c	2005-08-25 18:58:01.000000000 +0400
+++ linux-sparse/arch/sh/mm/init.c	2005-08-27 00:59:51.000000000 +0400
@@ -215,7 +215,7 @@ void __init paging_init(void)
 	disable_mmu();
 #endif
 	NODE_DATA(0)->node_mem_map = NULL;
-	free_area_init_node(0, NODE_DATA(0), zones_size, __MEMORY_START >> PAGE_SHIFT, 0);
+	free_area_init_node(0, NODE_DATA(0), zones_size, __MEMORY_START >> PAGE_SHIFT, NULL);
 
 #ifdef CONFIG_DISCONTIGMEM
 	/*
Index: linux-sparse/arch/sh/cchips/hd6446x/hd64465/setup.c
===================================================================
--- linux-sparse.orig/arch/sh/cchips/hd6446x/hd64465/setup.c	2005-08-25 18:58:01.000000000 +0400
+++ linux-sparse/arch/sh/cchips/hd6446x/hd64465/setup.c	2005-08-27 01:00:30.000000000 +0400
@@ -126,7 +126,7 @@ EXPORT_SYMBOL(hd64465_register_irq_demux
 
 void hd64465_unregister_irq_demux(int irq)
 {
-    	hd64465_demux[irq - HD64465_IRQ_BASE].func = 0;
+    	hd64465_demux[irq - HD64465_IRQ_BASE].func = NULL;
 }
 EXPORT_SYMBOL(hd64465_unregister_irq_demux);
 
Index: linux-sparse/fs/binfmt_flat.c
===================================================================
--- linux-sparse.orig/fs/binfmt_flat.c	2005-08-25 18:58:00.000000000 +0400
+++ linux-sparse/fs/binfmt_flat.c	2005-08-27 01:01:42.000000000 +0400
@@ -423,7 +423,7 @@ static int load_flat_file(struct linux_b
 	unsigned long text_len, data_len, bss_len, stack_len, flags;
 	unsigned long memp = 0; /* for finding the brk area */
 	unsigned long extra, rlim;
-	unsigned long *reloc = 0, *rp;
+	unsigned long *reloc = NULL, *rp;
 	struct inode *inode;
 	int i, rev, relocs = 0;
 	loff_t fpos;
@@ -530,7 +530,7 @@ static int load_flat_file(struct linux_b
 		}
 
 		down_write(&current->mm->mmap_sem);
-		realdatastart = do_mmap(0, 0, data_len + extra +
+		realdatastart = do_mmap(NULL, 0, data_len + extra +
 				MAX_SHARED_LIBS * sizeof(unsigned long),
 				PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
 		up_write(&current->mm->mmap_sem);
@@ -572,7 +572,7 @@ static int load_flat_file(struct linux_b
 	} else {
 
 		down_write(&current->mm->mmap_sem);
-		textpos = do_mmap(0, 0, text_len + data_len + extra +
+		textpos = do_mmap(NULL, 0, text_len + data_len + extra +
 					MAX_SHARED_LIBS * sizeof(unsigned long),
 				PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
 		up_write(&current->mm->mmap_sem);
Index: linux-sparse/drivers/serial/sh-sci.c
===================================================================
--- linux-sparse.orig/drivers/serial/sh-sci.c	2005-08-25 18:58:38.000000000 +0400
+++ linux-sparse/drivers/serial/sh-sci.c	2005-08-27 01:04:13.000000000 +0400
@@ -75,7 +75,7 @@ static struct sci_port *kgdb_sci_port;
 #endif /* CONFIG_SH_KGDB */
 
 #ifdef CONFIG_SERIAL_SH_SCI_CONSOLE
-static struct sci_port *serial_console_port = 0;
+static struct sci_port *serial_console_port = NULL;
 #endif /* CONFIG_SERIAL_SH_SCI_CONSOLE */
 
 /* Function prototypes */
@@ -1064,7 +1064,7 @@ static const char *sci_type(struct uart_
 		case PORT_IRDA: return "irda";
 	}
 
-	return 0;
+	return NULL;
 }
 
 static void sci_release_port(struct uart_port *port)
Index: linux-sparse/arch/sh/drivers/dma/dma-api.c
===================================================================
--- linux-sparse.orig/arch/sh/drivers/dma/dma-api.c	2005-08-25 18:58:01.000000000 +0400
+++ linux-sparse/arch/sh/drivers/dma/dma-api.c	2005-08-27 01:05:13.000000000 +0400
@@ -268,7 +268,7 @@ static int __init dma_api_init(void)
 	printk("DMA: Registering DMA API.\n");
 
 #ifdef CONFIG_PROC_FS
-	create_proc_read_entry("dma", 0, 0, dma_read_proc, 0);
+	create_proc_read_entry("dma", 0, NULL, dma_read_proc, NULL);
 #endif
 
 	return 0;
Index: linux-sparse/arch/sh/drivers/dma/dma-sh.c
===================================================================
--- linux-sparse.orig/arch/sh/drivers/dma/dma-sh.c	2005-08-25 18:58:01.000000000 +0400
+++ linux-sparse/arch/sh/drivers/dma/dma-sh.c	2005-08-27 01:06:21.000000000 +0400
@@ -237,7 +237,8 @@ static int __init sh_dmac_init(void)
 
 #ifdef CONFIG_CPU_SH4
 	make_ipr_irq(DMAE_IRQ, DMA_IPR_ADDR, DMA_IPR_POS, DMA_PRIORITY);
-	i = request_irq(DMAE_IRQ, dma_err, SA_INTERRUPT, "DMAC Address Error", 0);
+	i = request_irq(DMAE_IRQ, dma_err, SA_INTERRUPT, "DMAC Address Error",
+			NULL);
 	if (i < 0)
 		return i;
 #endif
@@ -256,7 +257,7 @@ static int __init sh_dmac_init(void)
 static void __exit sh_dmac_exit(void)
 {
 #ifdef CONFIG_CPU_SH4
-	free_irq(DMAE_IRQ, 0);
+	free_irq(DMAE_IRQ, NULL);
 #endif
 }
 
Index: linux-sparse/arch/sh64/kernel/process.c
===================================================================
--- linux-sparse.orig/arch/sh64/kernel/process.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/sh64/kernel/process.c	2005-08-27 01:10:01.000000000 +0400
@@ -718,7 +718,7 @@ int dump_fpu(struct pt_regs *regs, elf_f
 			grab_fpu();
 			fpsave(&tsk->thread.fpu.hard);
 			release_fpu();
-			last_task_used_math = 0;
+			last_task_used_math = NULL;
 			regs->sr |= SR_FD;
 		}
 
@@ -806,7 +806,7 @@ asmlinkage int sys_fork(unsigned long r2
 			unsigned long r6, unsigned long r7,
 			struct pt_regs *pregs)
 {
-	return do_fork(SIGCHLD, pregs->regs[15], pregs, 0, 0, 0);
+	return do_fork(SIGCHLD, pregs->regs[15], pregs, 0, NULL, NULL);
 }
 
 asmlinkage int sys_clone(unsigned long clone_flags, unsigned long newsp,
@@ -816,7 +816,7 @@ asmlinkage int sys_clone(unsigned long c
 {
 	if (!newsp)
 		newsp = pregs->regs[15];
-	return do_fork(clone_flags, newsp, pregs, 0, 0, 0);
+	return do_fork(clone_flags, newsp, pregs, 0, NULL, NULL);
 }
 
 /*
@@ -834,7 +834,7 @@ asmlinkage int sys_vfork(unsigned long r
 			 unsigned long r6, unsigned long r7,
 			 struct pt_regs *pregs)
 {
-	return do_fork(CLONE_VFORK | CLONE_VM | SIGCHLD, pregs->regs[15], pregs, 0, 0, 0);
+	return do_fork(CLONE_VFORK | CLONE_VM | SIGCHLD, pregs->regs[15], pregs, 0, NULL, NULL);
 }
 
 /*
Index: linux-sparse/arch/sh64/kernel/ptrace.c
===================================================================
--- linux-sparse.orig/arch/sh64/kernel/ptrace.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/sh64/kernel/ptrace.c	2005-08-27 01:10:45.000000000 +0400
@@ -77,7 +77,7 @@ get_fpu_long(struct task_struct *task, u
 		grab_fpu();
 		fpsave(&task->thread.fpu.hard);
 		release_fpu();
-		last_task_used_math = 0;
+		last_task_used_math = NULL;
 		regs->sr |= SR_FD;
 	}
 
@@ -113,7 +113,7 @@ put_fpu_long(struct task_struct *task, u
 		grab_fpu();
 		fpsave(&task->thread.fpu.hard);
 		release_fpu();
-		last_task_used_math = 0;
+		last_task_used_math = NULL;
 		regs->sr |= SR_FD;
 	}
 
Index: linux-sparse/arch/sh64/kernel/dma.c
===================================================================
--- linux-sparse.orig/arch/sh64/kernel/dma.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/sh64/kernel/dma.c	2005-08-27 01:11:09.000000000 +0400
@@ -275,7 +275,7 @@ int __init init_dma(void)
 static void __exit exit_dma(void)
 {
 	onchip_unmap(dmac_base);
-	free_irq(DMA_IRQ_DERR, 0);
+	free_irq(DMA_IRQ_DERR, NULL);
 }
 
 module_init(init_dma);
Index: linux-sparse/arch/sh64/mm/init.c
===================================================================
--- linux-sparse.orig/arch/sh64/mm/init.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/sh64/mm/init.c	2005-08-27 01:11:47.000000000 +0400
@@ -123,7 +123,7 @@ void __init paging_init(void)
          */
 	zones_size[ZONE_DMA] = MAX_LOW_PFN - START_PFN;
 	NODE_DATA(0)->node_mem_map = NULL;
-	free_area_init_node(0, NODE_DATA(0), zones_size, __MEMORY_START >> PAGE_SHIFT, 0);
+	free_area_init_node(0, NODE_DATA(0), zones_size, __MEMORY_START >> PAGE_SHIFT, NULL);
 }
 
 void __init mem_init(void)
Index: linux-sparse/arch/sh64/mm/ioremap.c
===================================================================
--- linux-sparse.orig/arch/sh64/mm/ioremap.c	2005-08-25 18:58:05.000000000 +0400
+++ linux-sparse/arch/sh64/mm/ioremap.c	2005-08-27 01:14:00.000000000 +0400
@@ -461,7 +461,7 @@ ioremap_proc_info(char *buf, char **star
 static int __init register_proc_onchip(void)
 {
 #ifdef CONFIG_PROC_FS
-	create_proc_read_entry("io_map",0,0, ioremap_proc_info, &shmedia_iomap);
+	create_proc_read_entry("io_map",0,NULL, ioremap_proc_info, &shmedia_iomap);
 #endif
 	return 0;
 }
Index: linux-sparse/arch/sparc/kernel/time.c
===================================================================
--- linux-sparse.orig/arch/sparc/kernel/time.c	2005-08-25 18:58:08.000000000 +0400
+++ linux-sparse/arch/sparc/kernel/time.c	2005-08-27 01:15:02.000000000 +0400
@@ -256,7 +256,7 @@ static __inline__ void sun4_clock_probe(
 		r.start = sun4_clock_physaddr;
 		intersil_clock = (struct intersil *) 
 		    sbus_ioremap(&r, 0, sizeof(*intersil_clock), "intersil");
-		mstk48t02_regs = 0;  /* just be sure */
+		mstk48t02_regs = NULL;  /* just be sure */
 		mstk48t08_regs = NULL;  /* ditto */
 		/* initialise the clock */
 
Index: linux-sparse/drivers/scsi/esp.c
===================================================================
--- linux-sparse.orig/drivers/scsi/esp.c	2005-08-25 18:58:29.000000000 +0400
+++ linux-sparse/drivers/scsi/esp.c	2005-08-27 01:17:05.000000000 +0400
@@ -1173,7 +1173,7 @@ static int __init esp_detect(struct scsi
 	struct sbus_dev *esp_dev, *sbdev_iter;
 	int nesps = 0, esps_in_use = 0;
 
-	espchain = 0;
+	espchain = NULL;
 	if (!sbus_root) {
 #ifdef CONFIG_PCI
 		return 0;


--===============87966384691927768==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87966384691927768==--
