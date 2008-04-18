From: Julia Lawall <julia@diku.dk>
Date: Fri, 18 Apr 2008 19:08:55 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <Pine.LNX.4.64.0804182101200.14832@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I found 63 occurrences of this problem with the following semantic match
(http://www.emn.fr/x-info/coccinelle/):

@@ unsigned int i; @@

* i < 0

I looked through all of the results by hand, and they all seem to be 
problems.  In many cases, it seems like the variable should not be 
unsigned as it is used to hold the return value of a function that might 
return a negative error code, but I haven't looked into this in detail.

In the output below, the lines that begin with a single start contain a 
test of whether an unsigned variable or structure field is less than 0.
The output is actually generated with diff, but I converted the -s to *s 
to avoid confusion.

julia


diff -u -p a/arch/arm/mach-davinci/psc.c b/arch/arm/mach-davinci/psc.c
*** a/arch/arm/mach-davinci/psc.c 2008-03-12 14:13:12.000000000 +0100
@@ -70,7 +70,7 @@ void davinci_psc_config(unsigned int dom
 {
 	u32 epcpr, ptcmd, ptstat, pdstat, pdctl1, mdstat, mdctl, mdstat_mask;
 
*	if (id < 0)
 		return;
 
 	mdctl = davinci_readl(DAVINCI_PWR_SLEEP_CNTRL_BASE + MDCTL + 4 * id);
diff -u -p a/arch/cris/arch-v10/kernel/dma.c b/arch/cris/arch-v10/kernel/dma.c
*** a/arch/cris/arch-v10/kernel/dma.c 2008-03-12 14:13:12.000000000 +0100
@@ -24,7 +24,7 @@ int cris_request_dma(unsigned int dmanr,
 	unsigned long int gens;
 	int fail = -EINVAL;
 
*	if ((dmanr < 0) || (dmanr >= MAX_DMA_CHANNELS)) {
 		printk(KERN_CRIT "cris_request_dma: invalid DMA channel %u\n", dmanr);
 		return -EINVAL;
 	}
@@ -213,7 +213,7 @@ int cris_request_dma(unsigned int dmanr,
 void cris_free_dma(unsigned int dmanr, const char * device_id)
 {
 	unsigned long flags;
*	if ((dmanr < 0) || (dmanr >= MAX_DMA_CHANNELS)) {
 		printk(KERN_CRIT "cris_free_dma: invalid DMA channel %u\n", dmanr);
 		return;
 	}
diff -u -p a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
*** a/arch/mips/sgi-ip27/ip27-timer.c 2008-03-12 14:13:12.000000000 +0100
@@ -228,7 +228,7 @@ static void __init hub_rt_clock_event_gl
 			break;
 
 		irq = allocate_irqno();
*		if (irq < 0)
 			panic("Allocation of irq number for timer failed");
 	} while (xchg(&rt_timer_irq, irq));
 
diff -u -p a/arch/mips/vr41xx/common/irq.c b/arch/mips/vr41xx/common/irq.c
*** a/arch/mips/vr41xx/common/irq.c 2008-03-12 14:13:12.000000000 +0100
@@ -80,7 +80,7 @@ static void irq_dispatch(unsigned int ir
 			desc->chip->ack(source_irq);
 		}
 		irq = cascade->get_irq(irq);
*		if (irq < 0)
 			atomic_inc(&irq_err_count);
 		else
 			irq_dispatch(irq);
diff -u -p a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
*** a/arch/powerpc/kernel/udbg_16550.c 2008-03-12 14:13:12.000000000 +0100
@@ -142,7 +142,7 @@ unsigned int udbg_probe_uart_speed(void 
 	speed = (clock / prescaler) / (divisor * 16);
 
 	/* sanity check */
*	if (speed < 0 || speed > (clock / 16))
 		speed = 9600;
 
 	return speed;
diff -u -p a/arch/powerpc/oprofile/cell/vma_map.c b/arch/powerpc/oprofile/cell/vma_map.c
*** a/arch/powerpc/oprofile/cell/vma_map.c 2008-04-10 08:32:55.000000000 +0200
@@ -232,7 +232,7 @@ struct vma_to_fileoffset_map *create_vma
 	 */
 	overlay_tbl_offset = vma_map_lookup(map, ovly_table_sym,
 					    aSpu, &grd_val);
*	if (overlay_tbl_offset < 0) {
 		printk(KERN_ERR "SPU_PROF: "
 		       "%s, line %d: Error finding SPU overlay table\n",
 		       __FUNCTION__, __LINE__);
diff -u -p a/arch/s390/appldata/appldata_base.c b/arch/s390/appldata/appldata_base.c
*** a/arch/s390/appldata/appldata_base.c 2008-03-12 14:13:13.000000000 +0100
@@ -438,7 +438,7 @@ out:
  */
 int appldata_register_ops(struct appldata_ops *ops)
 {
*	if ((ops->size > APPLDATA_MAX_REC_SIZE) || (ops->size < 0))
 		return -EINVAL;
 
 	ops->ctl_table = kzalloc(4 * sizeof(struct ctl_table), GFP_KERNEL);
diff -u -p a/arch/sh/kernel/cpu/irq/intc.c b/arch/sh/kernel/cpu/irq/intc.c
*** a/arch/sh/kernel/cpu/irq/intc.c 2008-03-12 14:13:13.000000000 +0100
@@ -415,7 +415,7 @@ static unsigned int __init intc_prio_dat
 			fn += (pr->reg_width >> 3) - 1;
 			bit = pr->reg_width - ((j + 1) * pr->field_width);
 
*			BUG_ON(bit < 0);
 
 			return _INTC_MK(fn, mode,
 					intc_get_reg(d, reg_e),
@@ -448,7 +448,7 @@ static unsigned int __init intc_sense_da
 			fn += (sr->reg_width >> 3) - 1;
 			bit = sr->reg_width - ((j + 1) * sr->field_width);
 
*			BUG_ON(bit < 0);
 
 			return _INTC_MK(fn, 0, intc_get_reg(d, sr->reg),
 					0, sr->field_width, bit);
diff -u -p a/arch/sh/kernel/cpu/sh2a/fpu.c b/arch/sh/kernel/cpu/sh2a/fpu.c
*** a/arch/sh/kernel/cpu/sh2a/fpu.c 2008-03-12 14:13:13.000000000 +0100
@@ -299,7 +299,7 @@ static int denormal_addf(int hx, int hy)
 		iy = hy & 0x7fffffff;
 		if (iy < 0x00800000) {
 			ix = denormal_subf1(ix, iy);
*			if (ix < 0) {
 				ix = -ix;
 				sign ^= 0x80000000;
 			}
diff -u -p a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
*** a/arch/x86/mm/ioremap.c 2008-03-12 14:13:13.000000000 +0100
@@ -470,7 +470,7 @@ void __init early_iounmap(void *addr, un
 	unsigned int nesting;
 
 	nesting = --early_ioremap_nested;
*	WARN_ON(nesting < 0);
 
 	if (early_ioremap_debug) {
 		printk(KERN_INFO "early_iounmap(%p, %08lx) [%d]\n", addr,
diff -u -p a/drivers/char/esp.c b/drivers/char/esp.c
*** a/drivers/char/esp.c 2008-03-12 14:13:13.000000000 +0100
@@ -2382,7 +2382,7 @@ static int __init espserial_init(void)
 	if ((flow_on < 1) || (flow_on > 1023))
 		flow_on = 944;
 
*	if ((rx_timeout < 0) || (rx_timeout > 255))
 		rx_timeout = 128;
 	
 	if (flow_on >= flow_off)
diff -u -p a/drivers/char/hvc_console.c b/drivers/char/hvc_console.c
*** a/drivers/char/hvc_console.c 2008-03-12 14:13:13.000000000 +0100
@@ -423,7 +423,7 @@ static void hvc_close(struct tty_struct 
 			free_irq(irq, hp);
 
 	} else {
*		if (hp->count < 0)
 			printk(KERN_ERR "hvc_close %X: oops, count is %d\n",
 				hp->vtermno, hp->count);
 		spin_unlock_irqrestore(&hp->lock, flags);
diff -u -p a/drivers/char/hvcs.c b/drivers/char/hvcs.c
*** a/drivers/char/hvcs.c 2008-03-12 14:13:13.000000000 +0100
@@ -1248,7 +1248,7 @@ static void hvcs_close(struct tty_struct
 		free_irq(irq, hvcsd);
 		kref_put(&hvcsd->kref, destroy_hvcs_struct);
 		return;
*	} else if (hvcsd->open_count < 0) {
 		printk(KERN_ERR "HVCS: vty-server@%X open_count: %d"
 				" is missmanaged.\n",
 		hvcsd->vdev->unit_address, hvcsd->open_count);
diff -u -p a/drivers/char/hvsi.c b/drivers/char/hvsi.c
*** a/drivers/char/hvsi.c 2008-03-12 14:13:13.000000000 +0100
@@ -908,7 +908,7 @@ static void hvsi_close(struct tty_struct
 
 			spin_lock_irqsave(&hp->lock, flags);
 		}
*	} else if (hp->count < 0)
 		printk(KERN_ERR "hvsi_close %lu: oops, count is %d\n",
 		       hp - hvsi_ports, hp->count);
 
diff -u -p a/drivers/gpio/mcp23s08.c b/drivers/gpio/mcp23s08.c
*** a/drivers/gpio/mcp23s08.c 2008-03-12 14:13:13.000000000 +0100
@@ -178,7 +178,7 @@ static void mcp23s08_dbg_show(struct seq
 
 	mutex_lock(&mcp->lock);
 	t = mcp23s08_read_regs(mcp, 0, mcp->cache, sizeof mcp->cache);
*	if (t < 0) {
 		seq_printf(s, " I/O ERROR %d\n", t);
 		goto done;
 	}
diff -u -p a/drivers/ieee1394/dv1394.c b/drivers/ieee1394/dv1394.c
*** a/drivers/ieee1394/dv1394.c 2008-03-12 14:13:13.000000000 +0100
@@ -918,7 +918,7 @@ static int do_dv1394_init(struct video_c
 		/* default SYT offset is 3 cycles */
 		init->syt_offset = 3;
 
*	if ( (init->channel > 63) || (init->channel < 0) )
 		init->channel = 63;
 
 	chan_mask = (u64)1 << init->channel;
diff -u -p a/drivers/ieee1394/video1394.c b/drivers/ieee1394/video1394.c
*** a/drivers/ieee1394/video1394.c 2008-03-12 14:13:13.000000000 +0100
@@ -893,7 +893,7 @@ static long video1394_ioctl(struct file 
 		if (unlikely(d = NULL))
 			return -EFAULT;
 
*		if (unlikely((v.buffer<0) || (v.buffer>=d->num_desc - 1))) {
 			PRINT(KERN_ERR, ohci->host->id,
 			      "Buffer %d out of range",v.buffer);
 			return -EINVAL;
@@ -959,7 +959,7 @@ static long video1394_ioctl(struct file 
 		if (unlikely(d = NULL))
 			return -EFAULT;
 
*		if (unlikely((v.buffer<0) || (v.buffer>d->num_desc - 1))) {
 			PRINT(KERN_ERR, ohci->host->id,
 			      "Buffer %d out of range",v.buffer);
 			return -EINVAL;
@@ -1030,7 +1030,7 @@ static long video1394_ioctl(struct file 
 		d = find_ctx(&ctx->context_list, OHCI_ISO_TRANSMIT, v.channel);
 		if (d = NULL) return -EFAULT;
 
*		if ((v.buffer<0) || (v.buffer>=d->num_desc - 1)) {
 			PRINT(KERN_ERR, ohci->host->id,
 			      "Buffer %d out of range",v.buffer);
 			return -EINVAL;
@@ -1137,7 +1137,7 @@ static long video1394_ioctl(struct file 
 		d = find_ctx(&ctx->context_list, OHCI_ISO_TRANSMIT, v.channel);
 		if (d = NULL) return -EFAULT;
 
*		if ((v.buffer<0) || (v.buffer>=d->num_desc-1)) {
 			PRINT(KERN_ERR, ohci->host->id,
 			      "Buffer %d out of range",v.buffer);
 			return -EINVAL;
diff -u -p a/drivers/macintosh/windfarm_smu_sat.c b/drivers/macintosh/windfarm_smu_sat.c
*** a/drivers/macintosh/windfarm_smu_sat.c 2008-03-12 14:13:13.000000000 +0100
@@ -88,7 +88,7 @@ struct smu_sdbp_header *smu_sat_get_sdb_
 	}
 
 	len = i2c_smbus_read_word_data(&sat->i2c, 9);
*	if (len < 0) {
 		printk(KERN_ERR "smu_sat_get_sdb_part rd len error\n");
 		return NULL;
 	}
diff -u -p a/drivers/media/video/bt8xx/bttv-driver.c b/drivers/media/video/bt8xx/bttv-driver.c
*** a/drivers/media/video/bt8xx/bttv-driver.c 2008-03-12 14:13:13.000000000 +0100
@@ -1287,7 +1287,7 @@ set_tvnorm(struct bttv *btv, unsigned in
 	const struct bttv_tvnorm *tvnorm;
 	v4l2_std_id id;
 
*	if (norm < 0 || norm >= BTTV_TVNORMS)
 		return -EINVAL;
 
 	tvnorm = &bttv_tvnorms[norm];
@@ -4607,7 +4607,7 @@ static int __init bttv_init_module(void)
 #endif
 	if (gbuffers < 2 || gbuffers > VIDEO_MAX_FRAME)
 		gbuffers = 2;
*	if (gbufsize < 0 || gbufsize > BTTV_MAX_FBUF)
 		gbufsize = BTTV_MAX_FBUF;
 	gbufsize = (gbufsize + PAGE_SIZE - 1) & PAGE_MASK;
 	if (bttv_verbose)
diff -u -p a/drivers/media/video/meye.c b/drivers/media/video/meye.c
*** a/drivers/media/video/meye.c 2008-03-12 14:13:13.000000000 +0100
@@ -2020,7 +2020,7 @@ static struct pci_driver meye_driver = {
 static int __init meye_init(void)
 {
 	gbuffers = max(2, min((int)gbuffers, MEYE_MAX_BUFNBRS));
*	if (gbufsize < 0 || gbufsize > MEYE_MAX_BUFSIZE)
 		gbufsize = MEYE_MAX_BUFSIZE;
 	gbufsize = PAGE_ALIGN(gbufsize);
 	printk(KERN_INFO "meye: using %d buffers with %dk (%dk total) "
diff -u -p a/drivers/media/video/mt20xx.c b/drivers/media/video/mt20xx.c
*** a/drivers/media/video/mt20xx.c 2008-03-12 14:13:13.000000000 +0100
@@ -150,7 +150,7 @@ static int mt2032_compute_freq(struct dv
 	tuner_dbg("mt2032: rfin=%d lo2=%d lo2n=%d lo2a=%d num=%d lo2freq=%d\n",
 		  rfin,lo2,lo2n,lo2a,lo2num,lo2freq);
 
*	if(lo1a<0 || lo1a>7 || lo1n<17 ||lo1n>48 || lo2a<0 ||lo2a >7 ||lo2n<17 || lo2n>30) {
 		tuner_info("mt2032: frequency parameters out of range: %d %d %d %d\n",
 			   lo1a, lo1n, lo2a,lo2n);
 		return(-1);
diff -u -p a/drivers/media/video/planb.c b/drivers/media/video/planb.c
*** a/drivers/media/video/planb.c 2008-03-12 14:13:13.000000000 +0100
@@ -878,7 +878,7 @@ static int vgrab(struct planb *pb, struc
 
 	if(pb->grabbing >= MAX_GBUFFERS)
 		return -ENOBUFS;
*	if(fr > (MAX_GBUFFERS - 1) || fr < 0)
 		return -EINVAL;
 	if(mp->height <= 0 || mp->width <= 0)
 		return -EINVAL;
@@ -1934,7 +1934,7 @@ chk_grab:
 
 			if(copy_from_user(&any, arg, sizeof(any)))
 				return -EFAULT;
*			if(any.offset < 0 || any.offset + any.bytes > 0x400)
 				return -EINVAL;
 			if(any.bytes > 128)
 				return -EINVAL;
diff -u -p a/drivers/media/video/saa7134/saa7134-video.c b/drivers/media/video/saa7134/saa7134-video.c
*** a/drivers/media/video/saa7134/saa7134-video.c 2008-03-12 14:13:13.000000000 +0100
@@ -1742,7 +1742,7 @@ static int saa7134_s_input(struct file *
 	if (0 != err)
 		return err;
 
*	if (i < 0  ||  i >= SAA7134_INPUT_MAX)
 		return -EINVAL;
 	if (NULL = card_in(dev, i).name)
 		return -EINVAL;
@@ -2427,7 +2427,7 @@ int saa7134_video_init1(struct saa7134_d
 	/* sanitycheck insmod options */
 	if (gbuffers < 2 || gbuffers > VIDEO_MAX_FRAME)
 		gbuffers = 2;
*	if (gbufsize < 0 || gbufsize > gbufsize_max)
 		gbufsize = gbufsize_max;
 	gbufsize = (gbufsize + PAGE_SIZE - 1) & PAGE_MASK;
 
diff -u -p a/drivers/media/video/usbvision/usbvision-video.c b/drivers/media/video/usbvision/usbvision-video.c
*** a/drivers/media/video/usbvision/usbvision-video.c 2008-03-12 14:13:13.000000000 +0100
@@ -644,7 +644,7 @@ static int vidioc_s_input (struct file *
 	struct usb_usbvision *usbvision  		(struct usb_usbvision *) video_get_drvdata(dev);
 
*	if ((input >= usbvision->video_inputs) || (input < 0) )
 		return -EINVAL;
 
 	mutex_lock(&usbvision->lock);
diff -u -p a/drivers/media/video/videodev.c b/drivers/media/video/videodev.c
*** a/drivers/media/video/videodev.c 2008-03-12 14:13:13.000000000 +0100
@@ -1213,7 +1213,7 @@ static int __video_do_ioctl(struct inode
 		v4l2_std_id id = vfd->tvnorms,curr_id=0;
 		unsigned int index = p->index,i;
 
*		if (index<0) {
 			ret=-EINVAL;
 			break;
 		}
diff -u -p a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
*** a/drivers/mfd/sm501.c 2008-03-12 14:13:13.000000000 +0100
@@ -1041,7 +1041,7 @@ static int sm501_plat_probe(struct platf
 	sm->mem_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
 	sm->platdata = dev->dev.platform_data;
 
*	if (sm->irq < 0) {
 		dev_err(&dev->dev, "failed to get irq resource\n");
 		err = sm->irq;
 		goto err_res;
diff -u -p a/drivers/net/gianfar.c b/drivers/net/gianfar.c
*** a/drivers/net/gianfar.c 2008-03-12 14:13:13.000000000 +0100
@@ -197,11 +197,11 @@ static int gfar_probe(struct platform_de
 		priv->interruptTransmit = platform_get_irq_byname(pdev, "tx");
 		priv->interruptReceive = platform_get_irq_byname(pdev, "rx");
 		priv->interruptError = platform_get_irq_byname(pdev, "error");
*		if (priv->interruptTransmit < 0 || priv->interruptReceive < 0 || priv->interruptError < 0)
 			goto regs_fail;
 	} else {
 		priv->interruptTransmit = platform_get_irq(pdev, 0);
*		if (priv->interruptTransmit < 0)
 			goto regs_fail;
 	}
 
diff -u -p a/drivers/net/r8169.c b/drivers/net/r8169.c
*** a/drivers/net/r8169.c 2008-03-12 14:13:14.000000000 +0100
@@ -1709,7 +1709,7 @@ rtl8169_init_one(struct pci_dev *pdev, c
 		if (tp->mac_version = rtl_chip_info[i].mac_version)
 			break;
 	}
*	if (i < 0) {
 		/* Unknown chip: assume array element #0, original RTL-8169 */
 		if (netif_msg_probe(tp)) {
 			dev_printk(KERN_DEBUG, &pdev->dev,
diff -u -p a/drivers/net/wireless/hermes.c b/drivers/net/wireless/hermes.c
*** a/drivers/net/wireless/hermes.c 2008-03-12 14:13:14.000000000 +0100
@@ -439,7 +439,7 @@ int hermes_read_ltv(hermes_t *hw, int ba
 	u16 rlength, rtype;
 	unsigned nwords;
 
*	if ( (bufsize < 0) || (bufsize % 2) )
 		return -EINVAL;
 
 	err = hermes_docmd_wait(hw, HERMES_CMD_ACCESS, rid, NULL);
diff -u -p a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
*** a/drivers/rtc/rtc-sh.c 2008-03-12 14:13:14.000000000 +0100
@@ -553,19 +553,19 @@ static int __devinit sh_rtc_probe(struct
 	spin_lock_init(&rtc->lock);
 
 	rtc->periodic_irq = platform_get_irq(pdev, 0);
*	if (unlikely(rtc->periodic_irq < 0)) {
 		dev_err(&pdev->dev, "No IRQ for period\n");
 		goto err_badres;
 	}
 
 	rtc->carry_irq = platform_get_irq(pdev, 1);
*	if (unlikely(rtc->carry_irq < 0)) {
 		dev_err(&pdev->dev, "No IRQ for carry\n");
 		goto err_badres;
 	}
 
 	rtc->alarm_irq = platform_get_irq(pdev, 2);
*	if (unlikely(rtc->alarm_irq < 0)) {
 		dev_err(&pdev->dev, "No IRQ for alarm\n");
 		goto err_badres;
 	}
diff -u -p a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
*** a/drivers/scsi/esp_scsi.c 2008-03-12 14:13:14.000000000 +0100
@@ -380,7 +380,7 @@ static void esp_advance_dma(struct esp *
 
 	p->cur_residue -= len;
 	p->tot_residue -= len;
*	if (p->cur_residue < 0 || p->tot_residue < 0) {
 		printk(KERN_ERR PFX "esp%d: Data transfer overflow.\n",
 		       esp->host->unique_id);
 		printk(KERN_ERR PFX "esp%d: cur_residue[%d] tot_residue[%d] "
diff -u -p a/drivers/scsi/u14-34f.c b/drivers/scsi/u14-34f.c
*** a/drivers/scsi/u14-34f.c 2008-03-12 14:13:14.000000000 +0100
@@ -1126,7 +1126,7 @@ static void map_dma(unsigned int i, unsi
 
    if (scsi_bufflen(SCpnt)) {
 	   count = scsi_dma_map(SCpnt);
*	   BUG_ON(count < 0);
 
 	   scsi_for_each_sg(SCpnt, sg, count, k) {
 		   cpp->sglist[k].address = H2DEV(sg_dma_address(sg));
diff -u -p a/drivers/spi/spi_s3c24xx.c b/drivers/spi/spi_s3c24xx.c
*** a/drivers/spi/spi_s3c24xx.c 2008-03-12 14:13:14.000000000 +0100
@@ -127,7 +127,7 @@ static int s3c24xx_spi_setupxfer(struct 
 
 	div = (div / 2) - 1;
 
*	if (div < 0)
 		div = 1;
 
 	if (div > 255)
diff -u -p a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
*** a/drivers/usb/host/ehci-dbg.c 2008-03-12 14:13:14.000000000 +0100
@@ -454,7 +454,7 @@ static void qh_lines (
 				(scratch >> 16) & 0x7fff,
 				scratch,
 				td->urb);
*		if (temp < 0)
 			temp = 0;
 		else if (size < temp)
 			temp = size;
@@ -465,7 +465,7 @@ static void qh_lines (
 	}
 
 	temp = snprintf (next, size, "\n");
*	if (temp < 0)
 		temp = 0;
 	else if (size < temp)
 		temp = size;
diff -u -p a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
*** a/drivers/usb/misc/usbtest.c 2008-03-12 14:13:14.000000000 +0100
@@ -1556,8 +1556,8 @@ usbtest_ioctl (struct usb_interface *int
 	if (code != USBTEST_REQUEST)
 		return -EOPNOTSUPP;
 
*	if (param->iterations <= 0 || param->length < 0
*			|| param->sglen < 0 || param->vary < 0)
 		return -EINVAL;
 
 	if (mutex_lock_interruptible(&dev->lock))
diff -u -p a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
*** a/drivers/usb/serial/mos7840.c 2008-03-12 14:13:14.000000000 +0100
@@ -1741,7 +1741,7 @@ static int mos7840_tiocmset(struct usb_s
 
 	status = 0;
 	status = mos7840_set_uart_reg(port, MODEM_CONTROL_REGISTER, mcr);
*	if (status < 0) {
 		dbg("setting MODEM_CONTROL_REGISTER Failed\n");
 		return -1;
 	}
diff -u -p a/drivers/watchdog/wdt285.c b/drivers/watchdog/wdt285.c
*** a/drivers/watchdog/wdt285.c 2008-03-12 14:13:14.000000000 +0100
@@ -162,7 +162,7 @@ watchdog_ioctl(struct inode *inode, stru
 			break;
 
 		/* Arbitrary, can't find the card's limits */
*		if (new_margin < 0 || new_margin > 60) {
 			ret = -EINVAL;
 			break;
 		}
diff -u -p a/fs/ext3/inode.c b/fs/ext3/inode.c
*** a/fs/ext3/inode.c 2008-03-12 14:13:14.000000000 +0100
@@ -1263,7 +1263,7 @@ static int ext3_ordered_write_end(struct
 			EXT3_I(inode)->i_disksize = new_i_size;
 		copied = ext3_generic_write_end(file, mapping, pos, len, copied,
 							page, fsdata);
*		if (copied < 0)
 			ret = copied;
 	}
 	ret2 = ext3_journal_stop(handle);
@@ -1291,7 +1291,7 @@ static int ext3_writeback_write_end(stru
 
 	copied = ext3_generic_write_end(file, mapping, pos, len, copied,
 							page, fsdata);
*	if (copied < 0)
 		ret = copied;
 
 	ret2 = ext3_journal_stop(handle);
diff -u -p a/fs/ext4/inode.c b/fs/ext4/inode.c
*** a/fs/ext4/inode.c 2008-03-12 14:13:14.000000000 +0100
@@ -1303,7 +1303,7 @@ static int ext4_ordered_write_end(struct
 			EXT4_I(inode)->i_disksize = new_i_size;
 		copied = ext4_generic_write_end(file, mapping, pos, len, copied,
 							page, fsdata);
*		if (copied < 0)
 			ret = copied;
 	}
 	ret2 = ext4_journal_stop(handle);
@@ -1331,7 +1331,7 @@ static int ext4_writeback_write_end(stru
 
 	copied = ext4_generic_write_end(file, mapping, pos, len, copied,
 							page, fsdata);
*	if (copied < 0)
 		ret = copied;
 
 	ret2 = ext4_journal_stop(handle);
diff -u -p a/kernel/relay.c b/kernel/relay.c
*** a/kernel/relay.c 2008-03-12 14:13:15.000000000 +0100
@@ -1134,7 +1134,7 @@ static int subbuf_splice_actor(struct fi
 		return 0;
 
 	ret = *nonpad_ret = splice_to_pipe(pipe, &spd);
*	if (ret < 0 || ret < total_len)
 		return ret;
 
         if (read_start + ret = nonpad_end)
diff -u -p a/mm/slab.c b/mm/slab.c
*** a/mm/slab.c 2008-03-12 14:13:15.000000000 +0100
@@ -3007,7 +3007,7 @@ retry:
 		 * there must be at least one object available for
 		 * allocation.
 		 */
*		BUG_ON(slabp->inuse < 0 || slabp->inuse >= cachep->num);
 
 		while (slabp->inuse < cachep->num && batchcount--) {
 			STATS_INC_ALLOCED(cachep);
diff -u -p a/net/irda/ircomm/ircomm_tty.c b/net/irda/ircomm/ircomm_tty.c
*** a/net/irda/ircomm/ircomm_tty.c 2008-03-12 14:13:15.000000000 +0100
@@ -371,7 +371,7 @@ static int ircomm_tty_open(struct tty_st
 	IRDA_DEBUG(2, "%s()\n", __FUNCTION__ );
 
 	line = tty->index;
*	if ((line < 0) || (line >= IRCOMM_TTY_PORTS)) {
 		return -ENODEV;
 	}
 
diff -u -p a/net/netfilter/xt_TCPOPTSTRIP.c b/net/netfilter/xt_TCPOPTSTRIP.c
*** a/net/netfilter/xt_TCPOPTSTRIP.c 2008-03-12 14:13:15.000000000 +0100
@@ -95,7 +95,7 @@ tcpoptstrip_tg6(struct sk_buff *skb, con
 
 	nexthdr = ipv6h->nexthdr;
 	tcphoff = ipv6_skip_exthdr(skb, sizeof(*ipv6h), &nexthdr);
*	if (tcphoff < 0)
 		return NF_DROP;
 
 	return tcpoptstrip_mangle_packet(skb, targinfo, tcphoff,
diff -u -p a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
*** a/sound/soc/codecs/cs4270.c 2008-03-12 14:13:15.000000000 +0100
@@ -399,7 +399,7 @@ static int cs4270_hw_params(struct snd_p
 	ret = snd_soc_write(codec, CS4270_PWRCTL, CS4270_PWRCTL_FREEZE |
 			    CS4270_PWRCTL_PDN_ADC | CS4270_PWRCTL_PDN_DAC |
 			    CS4270_PWRCTL_PDN);
*	if (ret < 0) {
 		printk(KERN_ERR "cs4270: I2C write failed\n");
 		return ret;
 	}
@@ -411,7 +411,7 @@ static int cs4270_hw_params(struct snd_p
 	reg |= cs4270_mode_ratios[i].speed_mode | cs4270_mode_ratios[i].mclk;
 
 	ret = snd_soc_write(codec, CS4270_MODE, reg);
*	if (ret < 0) {
 		printk(KERN_ERR "cs4270: I2C write failed\n");
 		return ret;
 	}
@@ -434,7 +434,7 @@ static int cs4270_hw_params(struct snd_p
 	}
 
 	ret = snd_soc_write(codec, CS4270_FORMAT, reg);
*	if (ret < 0) {
 		printk(KERN_ERR "cs4270: I2C write failed\n");
 		return ret;
 	}
@@ -445,7 +445,7 @@ static int cs4270_hw_params(struct snd_p
 	reg = snd_soc_read(codec, CS4270_MUTE);
 	reg &= ~CS4270_MUTE_AUTO;
 	ret = snd_soc_write(codec, CS4270_MUTE, reg);
*	if (ret < 0) {
 		printk(KERN_ERR "cs4270: I2C write failed\n");
 		return ret;
 	}
@@ -453,7 +453,7 @@ static int cs4270_hw_params(struct snd_p
 	/* Thaw and power-up the codec */
 
 	ret = snd_soc_write(codec, CS4270_PWRCTL, 0);
*	if (ret < 0) {
 		printk(KERN_ERR "cs4270: I2C write failed\n");
 		return ret;
 	}
