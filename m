From: Roel Kluin <12o3l@tiscali.nl>
Date: Wed, 23 Apr 2008 17:59:14 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <480F78F2.3090608@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks for your feedback, julia, I finally used 

(
* i < 0
|
* i < -C
|
* i > -C
|
* i <= -C
|
* i >= -C
)

I noted you had more results in the same files. Is there a difference
in results when you remove the asterisks before the expression?

Here is my result (I posted 4 patches already):

---
*** sound/spi/at73c213.c	2008-03-27 12:25:54.000000000 +0100
@@ -174,7 +174,7 @@ static int snd_at73c213_set_bitrate(stru
 		dac_rate_new = 8 * (ssc_rate / ssc_div);
 
 		status = clk_round_rate(chip->board->dac_clk, dac_rate_new);
*		if (status < 0)
 			return status;
 
 		/* Ignore difference smaller than 256 Hz. */
@@ -189,7 +189,7 @@ static int snd_at73c213_set_bitrate(stru
 
 set_rate:
 	status = clk_set_rate(chip->board->dac_clk, status);
*	if (status < 0)
 		return status;
 
 	/* Set divider in SSC device. */
*** arch/m32r/kernel/module.c	2008-03-27 12:25:15.000000000 +0100
@@ -172,7 +172,7 @@ int apply_relocate_add(Elf32_Shdr *sechd
 			break;
 		case R_M32R_18_PCREL_RELA:
 	  		relocation = (relocation - (Elf32_Addr) location);
*			if (relocation < -0x20000 || 0x1fffc < relocation)
 				{
 					printk(KERN_ERR "module %s: relocation overflow: %u\n",
 					me->name, relocation);
@@ -204,7 +204,7 @@ int apply_relocate_add(Elf32_Shdr *sechd
 			break;
 		case R_M32R_26_PCREL_RELA:
 	  		relocation = (relocation - (Elf32_Addr) location);
*			if (relocation < -0x2000000 || 0x1fffffc < relocation)
 				{
 					printk(KERN_ERR "module %s: relocation overflow: %u\n",
 					me->name, relocation);
*** arch/powerpc/sysdev/mpic_pasemi_msi.c	2008-03-27 12:25:20.000000000 +0100
@@ -109,7 +109,7 @@ static int pasemi_msi_setup_msi_irqs(str
 		 * sources can be changed independently.
 		 */
 		hwirq = mpic_msi_alloc_hwirqs(msi_mpic, ALLOC_CHUNK);
*		if (hwirq < 0) {
 			pr_debug("pasemi_msi: failed allocating hwirq\n");
 			return hwirq;
 		}
*** arch/powerpc/sysdev/mpic_u3msi.c	2008-03-27 12:25:20.000000000 +0100
@@ -122,7 +122,7 @@ static int u3msi_setup_msi_irqs(struct p
 
 	list_for_each_entry(entry, &pdev->msi_list, list) {
 		hwirq = mpic_msi_alloc_hwirqs(msi_mpic, 1);
*		if (hwirq < 0) {
 			pr_debug("u3msi: failed allocating hwirq\n");
 			return hwirq;
 		}
*** fs/adfs/inode.c	2008-04-22 22:20:55.000000000 +0200
@@ -28,7 +28,7 @@ static int
 adfs_get_block(struct inode *inode, sector_t block, struct buffer_head *bh,
 	       int create)
 {
*	if (block < 0)
 		goto abort_negative;
 
 	if (!create) {
*** fs/befs/linuxvfs.c	2008-04-22 22:20:55.000000000 +0200
@@ -127,7 +127,7 @@ befs_get_block(struct inode *inode, sect
 	befs_debug(sb, "---> befs_get_block() for inode %lu, block %ld",
 		   inode->i_ino, block);
 
*	if (block < 0) {
 		befs_error(sb, "befs_get_block() was asked for a block "
 			   "number less than zero: block %ld in inode %lu",
 			   block, inode->i_ino);
*** fs/udf/inode.c	2008-04-22 22:20:55.000000000 +0200
@@ -323,7 +323,7 @@ static int udf_get_block(struct inode *i
 
 	lock_kernel();
 
*	if (block < 0)
 		goto abort_negative;
 
 	iinfo = UDF_I(inode);
@@ -2095,7 +2095,7 @@ int8_t inode_bmap(struct inode *inode, s
 	int8_t etype;
 	struct udf_inode_info *iinfo;
 
*	if (block < 0) {
 		printk(KERN_ERR "udf: inode_bmap: block < 0\n");
 		return -1;
 	}
*** fs/ufs/inode.c	2008-04-22 22:20:55.000000000 +0200
@@ -56,7 +56,7 @@ static int ufs_block_to_path(struct inod
 
 
 	UFSD("ptrs=uspi->s_apb = %d,double_blocks=%ld \n",ptrs,double_blocks);
*	if (i_block < 0) {
 		ufs_warning(inode->i_sb, "ufs_block_to_path", "block < 0");
 	} else if (i_block < direct_blocks) {
 		offsets[n++] = i_block;
@@ -440,7 +440,7 @@ int ufs_getfrag_block(struct inode *inod
 	lock_kernel();
 
 	UFSD("ENTER, ino %lu, fragment %llu\n", inode->i_ino, (unsigned long long)fragment);
*	if (fragment < 0)
 		goto abort_negative;
 	if (fragment >
 	    ((UFS_NDADDR + uspi->s_apb + uspi->s_2apb + uspi->s_3apb)
*** drivers/atm/fore200e.c	2008-04-22 22:20:55.000000000 +0200
@@ -2920,7 +2920,7 @@ fore200e_proc_read(struct atm_dev *dev, 
 	u32 media_index    = FORE200E_MEDIA_INDEX(fore200e->bus->read(&fore200e->cp_queues->media_type));
 	u32 oc3_index;
 
*	if ((media_index < 0) || (media_index > 4))
 	    media_index = 5;
 	
 	switch (fore200e->loop_mode) {
*** drivers/infiniband/core/user_mad.c	2008-04-22 22:20:55.000000000 +0200
@@ -712,7 +712,7 @@ static int ib_umad_unreg_agent(struct ib
 	mutex_lock(&file->port->file_mutex);
 	mutex_lock(&file->mutex);
 
*	if (id < 0 || id >= IB_UMAD_MAX_AGENTS || !__get_agent(file, id)) {
 		ret = -EINVAL;
 		goto out;
 	}
*** drivers/macintosh/therm_adt746x.c	2008-04-22 22:20:55.000000000 +0200
@@ -500,7 +500,7 @@ static ssize_t store_##name(struct devic
 {								\
 	u32 val;						\
 	val = simple_strtoul(buf, NULL, 10);			\
*	if (val < 0 || val > 255)				\
 		return -EINVAL;					\
 	printk(KERN_INFO "Setting specified fan speed to %d\n", val);	\
 	data = val;						\
*** drivers/media/video/cx88/cx88-blackbird.c	2008-03-27 12:25:32.000000000 +0100
@@ -547,7 +547,7 @@ static int blackbird_initialize_codec(st
 			return retval;
 
 		dev->mailbox = blackbird_find_mailbox(dev);
*		if (dev->mailbox < 0)
 			return -1;
 
 		retval = blackbird_api_cmd(dev, CX2341X_ENC_PING_FW, 0, 0); /* ping */
*** drivers/net/ixp2000/ixpdev.c	2008-03-27 12:25:35.000000000 +0100
@@ -96,7 +96,7 @@ static int ixpdev_rx(struct net_device *
 			goto err;
 		}
 
*		if (desc->channel < 0 || desc->channel >= nds_count) {
 			printk(KERN_ERR "ixp2000: rx err, channel %d\n",
 					desc->channel);
 			goto err;
*** drivers/net/wireless/iwlwifi/iwl-4965.c	2008-04-22 22:20:55.000000000 +0200
@@ -3121,7 +3121,7 @@ int iwl4965_hw_txq_attach_buf_to_tfd(str
 	u32 num_tbs = IWL_GET_BITS(*tfd, num_tbs);
 
 	/* Each TFD can point to a maximum 20 Tx buffers */
*	if ((num_tbs >= MAX_NUM_OF_TBS) || (num_tbs < 0)) {
 		IWL_ERROR("Error can not send more than %d chunks\n",
 			  MAX_NUM_OF_TBS);
 		return -EINVAL;
*** drivers/net/wireless/prism54/isl_ioctl.c	2008-04-22 22:11:58.000000000 +0200
@@ -1186,7 +1186,7 @@ prism54_get_encode(struct net_device *nd
 	rvalue |= mgt_get_request(priv, DOT11_OID_DEFKEYID, 0, NULL, &r);
 	devindex = r.u;
 	/* Now get the key, return it */
*	if ((index < 0) || (index > 3))
 		/* no index provided, use the current one */
 		index = devindex;
 	rvalue |= mgt_get_request(priv, DOT11_OID_DEFKEYX, index, NULL, &r);
*** drivers/net/wireless/rndis_wlan.c	2008-04-22 22:11:58.000000000 +0200
@@ -2425,7 +2425,7 @@ static int bcm4320_early_init(struct usb
 	else if (priv->param_roamdelta > 2)
 		priv->param_roamdelta = 2;
 
*	if (priv->param_workaround_interval < 0)
 		priv->param_workaround_interval = 500;
 
 	rndis_set_config_parameter_str(dev, "Country", priv->param_country);
*** drivers/ps3/ps3av.c	2008-03-27 12:25:38.000000000 +0100
@@ -846,7 +846,7 @@ int ps3av_set_video_mode(u32 id)
 	u32 option;
 
 	size = ARRAY_SIZE(video_mode_table);
*	if ((id & PS3AV_MODE_MASK) > size - 1 || id < 0) {
 		dev_dbg(&ps3av->dev->core, "%s: error id :%d\n", __func__, id);
 		return -EINVAL;
 	}
@@ -895,7 +895,7 @@ int ps3av_video_mode2res(u32 id, u32 *xr
 
 	id = id & PS3AV_MODE_MASK;
 	size = ARRAY_SIZE(video_mode_table);
*	if (id > size - 1 || id < 0) {
 		printk(KERN_ERR "%s: invalid mode %d\n", __func__, id);
 		return -EINVAL;
 	}
*** drivers/scsi/dpt_i2o.c	2008-03-27 12:25:39.000000000 +0100
@@ -1096,7 +1096,7 @@ static struct adpt_device* adpt_find_dev
 {
 	struct adpt_device* d;
 
*	if(chan < 0 || chan >= MAX_CHANNEL)
 		return NULL;
 	
 	if( pHba->channel[chan].device = NULL){
*** drivers/spi/spi_mpc83xx.c	2008-04-14 15:59:50.000000000 +0200
@@ -456,7 +456,7 @@ static int __init mpc83xx_spi_probe(stru
 
 	mpc83xx_spi->irq = platform_get_irq(dev, 0);
 
*	if (mpc83xx_spi->irq < 0) {
 		ret = -ENXIO;
 		goto unmap_io;
 	}
*** drivers/spi/xilinx_spi.c	2008-04-12 14:33:04.000000000 +0200
@@ -354,7 +354,7 @@ static int __init xilinx_spi_probe(struc
 	}
 
 	xspi->irq = platform_get_irq(dev, 0);
*	if (xspi->irq < 0) {
 		ret = -ENXIO;
 		goto unmap_io;
 	}
*** drivers/video/amifb.c	2008-04-14 17:31:23.000000000 +0200
@@ -2053,7 +2053,7 @@ static void amifb_copyarea(struct fb_inf
 	sy = area->sy + (dy - area->dy);
 
 	/* the source must be completely inside the virtual screen */
*	if (sx < 0 || sy < 0 || (sx + width) > info->var.xres_virtual ||
 	    (sy + height) > info->var.yres_virtual)
 		return;
 
*** drivers/video/atafb.c	2008-04-14 15:59:51.000000000 +0200
@@ -2598,7 +2598,7 @@ static void atafb_copyarea(struct fb_inf
 	sy = area->sy + (dy - area->dy);
 
 	/* the source must be completely inside the virtual screen */
*	if (sx < 0 || sy < 0 || (sx + width) > info->var.xres_virtual ||
 	    (sy + height) > info->var.yres_virtual)
 		return;
 
*** drivers/video/aty/aty128fb.c	2008-04-14 15:59:51.000000000 +0200
@@ -1350,7 +1350,7 @@ static int aty128_var_to_pll(u32 period_
 		}
 	}
 
*	if (pll->post_divider < 0)
 		return -EINVAL;
 
 	/* calculate feedback divider */
*** drivers/video/vga16fb.c	2008-04-14 15:59:52.000000000 +0200
@@ -1092,7 +1092,7 @@ static void vga16fb_copyarea(struct fb_i
 	sy += (dy - old_dy);
 
 	/* the source must be completely inside the virtual screen */
*	if (sx < 0 || sy < 0 || (sx + width) > vxres || (sy + height) > vyres)
 		return;
 
 	switch (info->fix.type) {
*** sound/pci/emu10k1/io.c	2008-03-27 12:25:54.000000000 +0100
@@ -254,7 +254,7 @@ int snd_emu1010_fpga_write(struct snd_em
 	if (reg > 0x3f)
 		return 1;
 	reg += 0x40; /* 0x40 upwards are registers. */
*	if (value < 0 || value > 0x3f) /* 0 to 0x3f are values */
 		return 1;
 	spin_lock_irqsave(&emu->emu_lock, flags);
 	outl(reg, emu->port + A_IOCFG);
*** drivers/infiniband/hw/ehca/ehca_eq.c	2008-03-27 12:25:30.000000000 +0100
@@ -126,7 +126,7 @@ int ehca_create_eq(struct ehca_shca *shc
 		ret = ibmebus_request_irq(eq->ist, ehca_interrupt_eq,
 					  IRQF_DISABLED, "ehca_eq",
 					  (void *)shca);
*		if (ret < 0)
 			ehca_err(ib_dev, "Can't map interrupt handler.");
 
 		tasklet_init(&eq->interrupt_task, ehca_tasklet_eq, (long)shca);
@@ -134,7 +134,7 @@ int ehca_create_eq(struct ehca_shca *shc
 		ret = ibmebus_request_irq(eq->ist, ehca_interrupt_neq,
 					  IRQF_DISABLED, "ehca_neq",
 					  (void *)shca);
*		if (ret < 0)
 			ehca_err(ib_dev, "Can't map interrupt handler.");
 
 		tasklet_init(&eq->interrupt_task, ehca_tasklet_neq, (long)shca);
*** drivers/video/omap/omapfb_main.c	2008-04-22 22:20:55.000000000 +0200
@@ -275,7 +275,7 @@ static int _setcolreg(struct fb_info *in
 		if (r != 0)
 			break;
 
*		if (regno < 0) {
 			r = -EINVAL;
 			break;
 		}
*** drivers/scsi/eata.c	2008-03-27 12:25:39.000000000 +0100
@@ -2347,11 +2347,11 @@ static irqreturn_t ihdlr(int irq, struct
 		printk
 		    ("%s: ihdlr, spp->eoc = 0, irq %d, reg 0x%x, count %d.\n",
 		     ha->board_name, irq, reg, ha->iocount);
*	if (spp->cpp_index < 0 || spp->cpp_index >= shost->can_queue)
 		printk
 		    ("%s: ihdlr, bad spp->cpp_index %d, irq %d, reg 0x%x, count %d.\n",
 		     ha->board_name, spp->cpp_index, irq, reg, ha->iocount);
*	if (spp->eoc = 0 || spp->cpp_index < 0
 	    || spp->cpp_index >= shost->can_queue)
 		goto handled;
 
*** drivers/char/rio/rioctrl.c	2008-04-22 22:11:58.000000000 +0200
@@ -405,7 +405,7 @@ int riocontrol(struct rio_info *p, dev_t
 	case RIO_RESUME:
 		rio_dprintk(RIO_DEBUG_CTRL, "RIO_RESUME\n");
 		port = arg;
*		if ((port < 0) || (port > 511)) {
 			rio_dprintk(RIO_DEBUG_CTRL, "RIO_RESUME: Bad port number %d\n", port);
 			p->RIOError.Error = PORT_NUMBER_OUT_OF_RANGE;
 			return -EINVAL;
@@ -497,7 +497,7 @@ int riocontrol(struct rio_info *p, dev_t
 			return -EFAULT;
 		}
 		rio_dprintk(RIO_DEBUG_CTRL, "Get module type for port %d\n", port);
*		if (port < 0 || port > 511) {
 			rio_dprintk(RIO_DEBUG_CTRL, "RIO_GET_MODTYPE: Bad port number %d\n", port);
 			p->RIOError.Error = PORT_NUMBER_OUT_OF_RANGE;
 			return -EINVAL;
@@ -1144,7 +1144,7 @@ int riocontrol(struct rio_info *p, dev_t
 	case RIO_MAP_B110_TO_115200:
 		rio_dprintk(RIO_DEBUG_CTRL, "Baud rate mapping\n");
 		port = arg;
*		if (port < 0 || port > 511) {
 			rio_dprintk(RIO_DEBUG_CTRL, "Baud rate mapping: Bad port number %d\n", port);
 			p->RIOError.Error = PORT_NUMBER_OUT_OF_RANGE;
 			return -EINVAL;

