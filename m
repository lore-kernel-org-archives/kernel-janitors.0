From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Apr 2008 15:20:29 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <Pine.LNX.4.58.0804191718510.1187@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 19 Apr 2008, Matthew Wilcox wrote:

> On Fri, Apr 18, 2008 at 09:08:55PM +0200, Julia Lawall wrote:
> > I found 63 occurrences of this problem with the following semantic match
> > (http://www.emn.fr/x-info/coccinelle/):
> >
> > @@ unsigned int i; @@
> >
> > * i < 0
>
> Could you also look for unsigned long?

Attached.  Many of these are in the "a < X || a > Y" category.

julia

-----------------------

diff -u -p a/arch/m32r/kernel/ptrace.c b/arch/m32r/kernel/ptrace.c
*** a/arch/m32r/kernel/ptrace.c 2008-03-12 14:13:12.000000000 +0100
@@ -78,7 +78,7 @@ static int ptrace_read_user(struct task_
 	struct user * dummy = NULL;
 #endif

*	if ((off & 3) || (off < 0) || (off > sizeof(struct user) - 3))
 		return -EIO;

 	off >>= 2;
@@ -140,7 +140,7 @@ static int ptrace_write_user(struct task
 	struct user * dummy = NULL;
 #endif

*	if ((off & 3) || off < 0 ||
 	    off > sizeof(struct user) - 3)
 		return -EIO;

diff -u -p a/arch/mips/kernel/irixelf.c b/arch/mips/kernel/irixelf.c
*** a/arch/mips/kernel/irixelf.c 2008-03-12 14:13:12.000000000 +0100
@@ -587,7 +587,7 @@ static void irix_map_prda_page(void)
 	v =  do_brk(PRDA_ADDRESS, PAGE_SIZE);
 	up_write(&current->mm->mmap_sem);

*	if (v < 0)
 		return;

 	pp = (struct prda *) v;
diff -u -p a/drivers/atm/fore200e.c b/drivers/atm/fore200e.c
*** a/drivers/atm/fore200e.c 2008-03-12 14:13:13.000000000 +0100
@@ -1031,7 +1031,7 @@ int bsq_audit(int where, struct host_bsq
 		   where, scheme, magn, buffer->index, buffer->scheme);
 	}

*	if ((buffer->index < 0) || (buffer->index >= fore200e_rx_buf_nbr[ scheme ][ magn ])) {
 	    printk(FORE200E "bsq_audit(%d): queue %d.%d, out of range buffer index = %ld !\n",
 		   where, scheme, magn, buffer->index);
 	}
diff -u -p a/drivers/char/dsp56k.c b/drivers/char/dsp56k.c
*** a/drivers/char/dsp56k.c 2008-03-12 14:13:13.000000000 +0100
@@ -395,7 +395,7 @@ static int dsp56k_ioctl(struct inode *in
 			return put_user(status, &hf->status);
 		}
 		case DSP56K_HOST_CMD:
*			if (arg > 31 || arg < 0)
 				return -EINVAL;
 			dsp56k_host_interface.cvr = (u_char)((arg & DSP56K_CVR_HV_MASK) |
 							     DSP56K_CVR_HC);
diff -u -p a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
*** a/drivers/hid/usbhid/hiddev.c 2008-03-12 14:13:13.000000000 +0100
@@ -420,7 +420,7 @@ static int hiddev_ioctl(struct inode *in
 		return put_user(HID_VERSION, (int __user *)arg);

 	case HIDIOCAPPLICATION:
*		if (arg < 0 || arg >= hid->maxapplication)
 			return -EINVAL;

 		for (i = 0; i < hid->maxcollection; i++)
diff -u -p a/drivers/hwmon/fscpos.c b/drivers/hwmon/fscpos.c
*** a/drivers/hwmon/fscpos.c 2008-03-12 14:13:13.000000000 +0100
@@ -230,7 +230,7 @@ static ssize_t set_pwm(struct i2c_client
 	unsigned long v = simple_strtoul(buf, NULL, 10);

 	/* Range: 0..255 */
*	if (v < 0) v = 0;
 	if (v > 255) v = 255;

 	mutex_lock(&data->update_lock);
diff -u -p a/drivers/i2c/chips/tsl2550.c b/drivers/i2c/chips/tsl2550.c
*** a/drivers/i2c/chips/tsl2550.c 2008-03-12 14:13:13.000000000 +0100
@@ -221,7 +221,7 @@ static ssize_t tsl2550_store_power_state
 	unsigned long val = simple_strtoul(buf, NULL, 10);
 	int ret;

*	if (val < 0 || val > 1)
 		return -EINVAL;

 	mutex_lock(&data->update_lock);
@@ -253,7 +253,7 @@ static ssize_t tsl2550_store_operating_m
 	unsigned long val = simple_strtoul(buf, NULL, 10);
 	int ret;

*	if (val < 0 || val > 1)
 		return -EINVAL;

 	if (data->power_state = 0)
diff -u -p a/drivers/ide/ide-cd.c b/drivers/ide/ide-cd.c
*** a/drivers/ide/ide-cd.c 2008-03-12 14:13:13.000000000 +0100
@@ -182,7 +182,7 @@ void cdrom_analyze_sense_data(ide_drive_
 			sector &= ~(bio_sectors -1);
 			valid = (sector - failed_command->sector) << 9;

*			if (valid < 0)
 				valid = 0;
 			if (sector < get_capacity(info->disk) &&
 				drive->probed_capacity - sector < 4 * 75) {
diff -u -p a/drivers/message/i2o/i2o_block.c b/drivers/message/i2o/i2o_block.c
*** a/drivers/message/i2o/i2o_block.c 2008-03-12 14:13:13.000000000 +0100
@@ -670,7 +670,7 @@ static int i2o_block_ioctl(struct inode
 	case BLKI2OGWSTRAT:
 		return put_user(dev->wcache, (int __user *)arg);
 	case BLKI2OSRSTRAT:
*		if (arg < 0 || arg > CACHE_SMARTFETCH)
 			return -EINVAL;
 		dev->rcache = arg;
 		break;
diff -u -p a/drivers/misc/intel_menlow.c b/drivers/misc/intel_menlow.c
*** a/drivers/misc/intel_menlow.c 2008-03-12 14:13:13.000000000 +0100
@@ -121,7 +121,7 @@ static int memory_set_cur_bandwidth(stru
 	if (memory_get_int_max_bandwidth(cdev, &max_state))
 		return -EFAULT;

*	if (max_state < 0 || state > max_state)
 		return -EINVAL;

 	arg_list.count = 1;
diff -u -p a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
*** a/drivers/mtd/devices/slram.c 2008-03-12 14:13:13.000000000 +0100
@@ -270,7 +270,7 @@ static int parse_cmdline(char *devname,
 	}
 	T("slram: devname=%s, devstart=0x%lx, devlength=0x%lx\n",
 			devname, devstart, devlength);
*	if ((devstart < 0) || (devlength < 0) || (devlength % SLRAM_BLK_SZ != 0)) {
 		E("slram: Illegal start / length parameter.\n");
 		return(-EINVAL);
 	}
diff -u -p a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
*** a/drivers/mtd/ubi/build.c 2008-03-12 14:13:13.000000000 +0100
@@ -1059,7 +1059,7 @@ static int __init bytes_str_to_int(const
 	unsigned long result;

 	result = simple_strtoul(str, &endp, 0);
*	if (str = endp || result < 0) {
 		printk(KERN_ERR "UBI error: incorrect bytes count: \"%s\"\n",
 		       str);
 		return -EINVAL;
diff -u -p a/drivers/telephony/ixj.c b/drivers/telephony/ixj.c
*** a/drivers/telephony/ixj.c 2008-03-12 14:13:14.000000000 +0100
@@ -6598,7 +6598,7 @@ static int ixj_ioctl(struct inode *inode
 			retval = ixj_init_filter_raw(j, &jfr);
 		break;
 	case IXJCTL_GET_FILTER_HIST:
*		if(arg<0||arg>3)
 			retval = -EINVAL;
 		else
 			retval = j->filter_hist[arg];
@@ -6633,7 +6633,7 @@ static int ixj_ioctl(struct inode *inode
 		}
 		break;
 	case IXJCTL_INTERCOM_STOP:
*		if(arg < 0 || arg >= IXJMAX)
 			return -EINVAL;
 		j->intercom = -1;
 		ixj_record_stop(j);
@@ -6645,7 +6645,7 @@ static int ixj_ioctl(struct inode *inode
 		idle(get_ixj(arg));
 		break;
 	case IXJCTL_INTERCOM_START:
*		if(arg < 0 || arg >= IXJMAX)
 			return -EINVAL;
 		j->intercom = arg;
 		ixj_record_start(j);
diff -u -p a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
*** a/drivers/usb/misc/usbtest.c 2008-03-12 14:13:14.000000000 +0100
@@ -212,7 +212,7 @@ static struct urb *simple_alloc_urb (
 {
 	struct urb		*urb;

*	if (bytes < 0)
 		return NULL;
 	urb = usb_alloc_urb (0, GFP_KERNEL);
 	if (!urb)
diff -u -p a/drivers/video/atmel_lcdfb.c b/drivers/video/atmel_lcdfb.c
*** a/drivers/video/atmel_lcdfb.c 2008-03-12 14:13:14.000000000 +0100
@@ -743,7 +743,7 @@ static int __init atmel_lcdfb_probe(stru
 	}

 	sinfo->irq_base = platform_get_irq(pdev, 0);
*	if (sinfo->irq_base < 0) {
 		dev_err(dev, "unable to get irq\n");
 		ret = sinfo->irq_base;
 		goto stop_clk;
diff -u -p a/kernel/softlockup.c b/kernel/softlockup.c
*** a/kernel/softlockup.c 2008-03-12 14:13:15.000000000 +0100
@@ -154,7 +154,7 @@ static void check_hung_task(struct task_
 	if ((long)(now - t->last_switch_timestamp) <
 					sysctl_hung_task_timeout_secs)
 		return;
*	if (sysctl_hung_task_warnings < 0)
 		return;
 	sysctl_hung_task_warnings--;

diff -u -p a/kernel/sys.c b/kernel/sys.c
*** a/kernel/sys.c 2008-03-12 14:13:15.000000000 +0100
@@ -1647,7 +1647,7 @@ asmlinkage long sys_prctl(int option, un
 			error = get_dumpable(current->mm);
 			break;
 		case PR_SET_DUMPABLE:
*			if (arg2 < 0 || arg2 > 1) {
 				error = -EINVAL;
 				break;
 			}
diff -u -p a/sound/oss/dmabuf.c b/sound/oss/dmabuf.c
*** a/sound/oss/dmabuf.c 2008-03-12 14:13:15.000000000 +0100
@@ -797,7 +797,7 @@ static int find_output_space(int dev, ch
 #else
 	active_offs = DMAbuf_get_buffer_pointer(dev, dmap, DMODE_OUTPUT);
 	/* Check for pointer wrapping situation */
*	if (active_offs < 0 || active_offs >= dmap->bytes_in_use)
 		active_offs = 0;
 	active_offs += dmap->byte_counter;
 #endif
diff -u -p a/sound/oss/trident.c b/sound/oss/trident.c
*** a/sound/oss/trident.c 2008-03-12 14:13:15.000000000 +0100
@@ -4039,7 +4039,7 @@ ali_write_proc(struct file *file, const
 	unsigned long flags;
 	char c;

*	if (count < 0)
 		return -EINVAL;
 	if (count = 0)
 		return 0;
diff -u -p a/sound/spi/at73c213.c b/sound/spi/at73c213.c
*** a/sound/spi/at73c213.c 2008-03-12 14:13:15.000000000 +0100
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

