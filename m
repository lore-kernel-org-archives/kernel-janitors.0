From: "Badai Aqrandista" <badaiaqrandista@gmail.com>
Date: Tue, 26 Dec 2006 00:33:02 +0000
Subject: [KJ] [PATCH for review] Changed DPRINTK to pr_debug
Message-Id: <4b4be04a0612251633j4b86e7efqaa5e7742a542f64b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I'm learning to hack on linux kernel. This is a patch to do one of the
point in the kernel janitor todo list. What do you think? Should I
continue working on this or should I choose different point in the
todo list?

My basic concern is that the author of via82cxxx_audio.c is expecting
VIA_DEBUG symbol when he is working with the code.

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index b0c4a05..484a401 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -203,7 +203,7 @@ extern void dump_stack(void);
 #ifdef DEBUG
 /* If you are writing a driver, please use dev_dbg instead */
 #define pr_debug(fmt,arg...) \
-	printk(KERN_DEBUG fmt,##arg)
+	printk(KERN_DEBUG "[%s] " fmt, __FUNCTION__, ##arg)
 #else
 static inline int __attribute__ ((format (printf, 1, 2)))
pr_debug(const char * fmt, ...)
 {
diff --git a/sound/oss/via82cxxx_audio.c b/sound/oss/via82cxxx_audio.c
index c96cc8c..605be65 100644
--- a/sound/oss/via82cxxx_audio.c
+++ b/sound/oss/via82cxxx_audio.c
@@ -45,14 +45,6 @@
 #include "mpu401.h"


-#undef VIA_DEBUG	/* define to enable debugging output and checks */
-#ifdef VIA_DEBUG
-/* note: prints function name for you */
-#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt,
__FUNCTION__ , ## args)
-#else
-#define DPRINTK(fmt, args...)
-#endif
-
 #undef VIA_NDEBUG	/* define to disable lightweight runtime checks */
 #ifdef VIA_NDEBUG
 #define assert(expr)
@@ -450,13 +442,13 @@ static inline void via_chan_status_clear (long iobase)

 static inline void sg_begin (struct via_channel *chan)
 {
-	DPRINTK("Start with intmask %d\n", chan->intmask);
-	DPRINTK("About to start from %d to %d\n",
+	pr_debug("Start with intmask %d\n", chan->intmask);
+	pr_debug("About to start from %d to %d\n",
 		inl(chan->iobase + VIA_PCM_BLOCK_COUNT),
 		inb(chan->iobase + VIA_PCM_STOPRATE + 3));
 	outb (VIA_SGD_START|chan->intmask, chan->iobase + VIA_PCM_CONTROL);
-	DPRINTK("Status is now %02X\n", inb(chan->iobase + VIA_PCM_STATUS));
-	DPRINTK("Control is now %02X\n", inb(chan->iobase + VIA_PCM_CONTROL));
+	pr_debug("Status is now %02X\n", inb(chan->iobase + VIA_PCM_STATUS));
+	pr_debug("Control is now %02X\n", inb(chan->iobase + VIA_PCM_CONTROL));
 }


@@ -529,7 +521,7 @@ static void via_stop_everything (struct via_info *card)
 {
 	u8 tmp, new_tmp;

-	DPRINTK ("ENTER\n");
+	pr_debug("ENTER\n");

 	assert (card != NULL);

@@ -586,7 +578,7 @@ static void via_stop_everything (struct via_info *card)
 	via_chan_status_clear (card->baseaddr + VIA_BASE0_PCM_IN_CHAN);
 	via_chan_status_clear (card->baseaddr + VIA_BASE0_FM_OUT_CHAN);

-	DPRINTK ("EXIT\n");
+	pr_debug("EXIT\n");
 }


@@ -611,7 +603,7 @@ static int via_set_rate (struct ac97_codec *ac97,
 	u32 mast_vol, phone_vol, mono_vol, pcm_vol;
 	u32 mute_vol = 0x8000;	/* The mute volume? -- Seems to work! */

-	DPRINTK ("ENTER, rate = %d\n", rate);
+	pr_debug("ENTER, rate = %d\n", rate);

 	if (chan->rate = rate)
 		goto out;
@@ -666,7 +658,7 @@ static int via_set_rate (struct ac97_codec *ac97,
 	}

 out:
-	DPRINTK ("EXIT, returning rate %d Hz\n", chan->rate);
+	pr_debug("EXIT, returning rate %d Hz\n", chan->rate);
 	return chan->rate;
 }

@@ -700,7 +692,7 @@ static void via_chan_init_defaults (struct
via_info *card, struct via_channel *c
 		{
 			chan->iobase = card->baseaddr + VIA_BASE0_MULTI_OUT_CHAN;
 			chan->is_multi = 1;
-			DPRINTK("Using multichannel for pcm out\n");
+			pr_debug("Using multichannel for pcm out\n");
 		}
 		else
 			chan->iobase = card->baseaddr + VIA_BASE0_PCM_OUT_CHAN;
@@ -742,7 +734,7 @@ static void via_chan_init_defaults (struct
via_info *card, struct via_channel *c
 static void via_chan_init (struct via_info *card, struct via_channel *chan)
 {

-        DPRINTK ("ENTER\n");
+        pr_debug("ENTER\n");

 	/* bzero channel structure, and init members to defaults */
         via_chan_init_defaults (card, chan);
@@ -752,7 +744,7 @@ static void via_chan_init (struct via_info *card,
struct via_channel *chan)
         via_chan_status_clear (chan->iobase);
         via_chan_pcm_fmt (chan, 1);

-	DPRINTK ("EXIT\n");
+	pr_debug("EXIT\n");
 }

 /**
@@ -779,7 +771,7 @@ static int via_chan_buffer_init (struct via_info
*card, struct via_channel *chan
 	int page, offset;
 	int i;

-	DPRINTK ("ENTER\n");
+	pr_debug("ENTER\n");


 	chan->intmask = 0;
@@ -787,7 +779,7 @@ static int via_chan_buffer_init (struct via_info
*card, struct via_channel *chan
 		chan->intmask = 0x23;	/* Turn on the IRQ bits */
 		
 	if (chan->sgtable != NULL) {
-		DPRINTK ("EXIT\n");
+		pr_debug("EXIT\n");
 		return 0;
 	}

@@ -797,7 +789,7 @@ static int via_chan_buffer_init (struct via_info
*card, struct via_channel *chan
 		&chan->sgt_handle);
 	if (!chan->sgtable) {
 		printk (KERN_ERR PFX "DMA table alloc fail, aborting\n");
-		DPRINTK ("EXIT\n");
+		pr_debug("EXIT\n");
 		return -ENOMEM;
 	}

@@ -823,7 +815,7 @@ static int via_chan_buffer_init (struct via_info
*card, struct via_channel *chan
 #endif

 #if 1
-                DPRINTK ("dmabuf_pg #%d (h=%lx, v2p=%lx, a=%p)\n",
+                pr_debug("dmabuf_pg #%d (h=%lx, v2p=%lx, a=%p)\n",
 			i, (long)chan->pgtbl[i].handle,
 			virt_to_phys(chan->pgtbl[i].cpuaddr),
 			chan->pgtbl[i].cpuaddr);
@@ -839,7 +831,7 @@ static int via_chan_buffer_init (struct via_info
*card, struct via_channel *chan
 		chan->sgtable[i].addr = cpu_to_le32 (chan->pgtbl[page].handle + offset);

 #if 1
-		DPRINTK ("dmabuf #%d (32(h)=%lx)\n",
+		pr_debug("dmabuf #%d (32(h)=%lx)\n",
 			 i,
 			 (long)chan->sgtable[i].addr);
 #endif
@@ -849,7 +841,7 @@ static int via_chan_buffer_init (struct via_info
*card, struct via_channel *chan
 	chan->sgtable[chan->frag_number - 1].count = cpu_to_le32
(chan->frag_size | VIA_EOL);

 	/* set location of DMA-able scatter-gather info table */
-	DPRINTK ("outl (0x%X, 0x%04lX)\n",
+	pr_debug("outl (0x%X, 0x%04lX)\n",
 		chan->sgt_handle, chan->iobase + VIA_PCM_TABLE_ADDR);

 	via_ac97_wait_idle (card);
@@ -867,17 +859,17 @@ static int via_chan_buffer_init (struct via_info
*card, struct via_channel *chan
 		}
 	}

-	DPRINTK ("inl (0x%lX) = %x\n",
+	pr_debug("inl (0x%lX) = %x\n",
 		chan->iobase + VIA_PCM_TABLE_ADDR,
 		inl(chan->iobase + VIA_PCM_TABLE_ADDR));

-	DPRINTK ("EXIT\n");
+	pr_debug("EXIT\n");
 	return 0;

 err_out_nomem:
 	printk (KERN_ERR PFX "DMA buffer alloc fail, aborting\n");
 	via_chan_buffer_free (card, chan);
-	DPRINTK ("EXIT\n");
+	pr_debug("EXIT\n");
 	return -ENOMEM;
 }

@@ -898,7 +890,7 @@ err_out_nomem:

 static void via_chan_free (struct via_info *card, struct via_channel *chan)
 {
-	DPRINTK ("ENTER\n");
+	pr_debug("ENTER\n");

 	spin_lock_irq (&card->lock);

@@ -911,14 +903,14 @@ static void via_chan_free (struct via_info
*card, struct via_channel *chan)

 	synchronize_irq(card->pdev->irq);

-	DPRINTK ("EXIT\n");
+	pr_debug("EXIT\n");
 }

 static void via_chan_buffer_free (struct via_info *card, struct
via_channel *chan)
 {
 	int i;

-        DPRINTK ("ENTER\n");
+        pr_debug("ENTER\n");

 	/* zero location of DMA-able scatter-gather info table */
 	via_ac97_wait_idle(card);
@@ -942,7 +934,7 @@ static void via_chan_buffer_free (struct via_info
*card, struct via_channel *cha
 		chan->sgtable = NULL;
 	}

-	DPRINTK ("EXIT\n");
+	pr_debug("EXIT\n");
 }


@@ -963,7 +955,7 @@ static void via_chan_buffer_free (struct via_info
*card, struct via_channel *cha

 static void via_chan_pcm_fmt (struct via_channel *chan, int reset)
 {
-	DPRINTK ("ENTER, pcm_fmt=0x%02X, reset=%s\n",
+	pr_debug("ENTER, pcm_fmt=0x%02X, reset=%s\n",
 		 chan->pcm_fmt, reset ? "yes" : "no");

 	assert (chan != NULL);
@@ -985,7 +977,7 @@ static void via_chan_pcm_fmt (struct via_channel
*chan, int reset)
 	if (!chan->is_record)
 		chan->pcm_fmt |= VIA_CHAN_TYPE_INT_SELECT;
 	
-	DPRINTK("SET FMT - %02x %02x\n", chan->intmask , chan->is_multi);
+	pr_debug("SET FMT - %02x %02x\n", chan->intmask , chan->is_multi);
 	
 	if(chan->intmask)
 	{
@@ -1062,7 +1054,7 @@ static void via_chan_pcm_fmt (struct via_channel
*chan, int reset)
 		outb (chan->pcm_fmt, chan->iobase + VIA_PCM_TYPE);


-	DPRINTK ("EXIT, pcm_fmt = 0x%02X, reg = 0x%02X\n",
+	pr_debug("EXIT, pcm_fmt = 0x%02X, reg = 0x%02X\n",
 		 chan->pcm_fmt,
 		 inb (chan->iobase + VIA_PCM_TYPE));
 }
@@ -1079,7 +1071,7 @@ static void via_chan_pcm_fmt (struct via_channel
*chan, int reset)

 static void via_chan_clear (struct via_info *card, struct via_channel *chan)
 {
-	DPRINTK ("ENTER\n");
+	pr_debug("ENTER\n");
 	via_chan_stop (chan->iobase);
 	via_chan_buffer_free(card, chan);
 	chan->is_active = 0;
@@ -1089,7 +1081,7 @@ static void via_chan_clear (struct via_info
*card, struct via_channel *chan)
 	chan->sw_ptr = 0;
 	chan->n_irqs = 0;
 	atomic_set (&chan->hw_ptr, 0);
-	DPRINTK ("EXIT\n");
+	pr_debug("EXIT\n");
 }


@@ -1111,13 +1103,13 @@ static void via_chan_clear (struct via_info
*card, struct via_channel *chan)
 static int via_chan_set_speed (struct via_info *card,
 			       struct via_channel *chan, int val)
 {
-	DPRINTK ("ENTER, requested rate = %d\n", val);
+	pr_debug ("ENTER, requested rate = %d\n", val);

 	via_chan_clear (card, chan);

 	val = via_set_rate (card->ac97, chan, val);

-	DPRINTK ("EXIT, returning %d\n", val);
+	pr_debug ("EXIT, returning %d\n", val);
 	return val;
 }

@@ -1140,7 +1132,7 @@ static int via_chan_set_speed (struct via_info *card,
 static int via_chan_set_fmt (struct via_info *card,
 			     struct via_channel *chan, int val)
 {
-	DPRINTK ("ENTER, val=%s\n",
+	pr_debug ("ENTER, val=%s\n",
 		 val = AFMT_U8 ? "AFMT_U8" :
 	 	 val = AFMT_S16_LE ? "AFMT_S16_LE" :
 		 "unknown");
@@ -1165,11 +1157,11 @@ static int via_chan_set_fmt (struct via_info *card,
 		break;

 	default:
-		DPRINTK ("unknown AFMT: 0x%X\n", val);
+		pr_debug ("unknown AFMT: 0x%X\n", val);
 		val = AFMT_S16_LE;
 	}

-	DPRINTK ("EXIT\n");
+	pr_debug ("EXIT\n");
 	return val;
 }

@@ -1192,7 +1184,7 @@ static int via_chan_set_fmt (struct via_info *card,
 static int via_chan_set_stereo (struct via_info *card,
 			        struct via_channel *chan, int val)
 {
-	DPRINTK ("ENTER, channels = %d\n", val);
+	pr_debug ("ENTER, channels = %d\n", val);

 	via_chan_clear (card, chan);

@@ -1226,7 +1218,7 @@ static int via_chan_set_stereo (struct via_info *card,
 		break;
 	}

-	DPRINTK ("EXIT, returning %d\n", val);
+	pr_debug ("EXIT, returning %d\n", val);
 	return val;
 }

@@ -1235,11 +1227,11 @@ static int via_chan_set_buffering (struct
via_info *card,
 {
 	int shift;

-        DPRINTK ("ENTER\n");
+        pr_debug ("ENTER\n");

 	/* in both cases the buffer cannot be changed */
 	if (chan->is_active || chan->is_mapped) {
-		DPRINTK ("EXIT\n");
+		pr_debug ("EXIT\n");
 		return -EINVAL;
 	}

@@ -1250,7 +1242,7 @@ static int via_chan_set_buffering (struct via_info *card,
 		if (chan->frag_size && chan->frag_number)
 			goto out;

-		DPRINTK ("\n");
+		pr_debug ("\n");

 		chan->frag_size = (VIA_DEFAULT_FRAG_TIME * chan->rate * chan->channels
 				   * ((chan->pcm_fmt & VIA_PCM_FMT_16BIT) ? 2 : 1)) / 1000 - 1;
@@ -1264,12 +1256,12 @@ static int via_chan_set_buffering (struct
via_info *card,

 		chan->frag_number = (VIA_DEFAULT_BUFFER_TIME / VIA_DEFAULT_FRAG_TIME);

-		DPRINTK ("setting default values %d %d\n", chan->frag_size,
chan->frag_number);
+		pr_debug ("setting default values %d %d\n", chan->frag_size,
chan->frag_number);
 	} else {
 		chan->frag_size = 1 << (val & 0xFFFF);
 		chan->frag_number = (val >> 16) & 0xFFFF;

-		DPRINTK ("using user values %d %d\n", chan->frag_size, chan->frag_number);
+		pr_debug ("using user values %d %d\n", chan->frag_size, chan->frag_number);
 	}

 	/* quake3 wants frag_number to be a power of two */
@@ -1299,7 +1291,7 @@ out:
 	else
 		atomic_set (&chan->n_frags, chan->frag_number);

-	DPRINTK ("EXIT\n");
+	pr_debug ("EXIT\n");

 	return 0;
 }
@@ -1318,13 +1310,13 @@ static void via_chan_dump_bufs (struct
via_channel *chan)
 	int i;

 	for (i = 0; i < chan->frag_number; i++) {
-		DPRINTK ("#%02d: addr=%x, count=%u, flag=%d, eol=%d\n",
+		pr_debug ("#%02d: addr=%x, count=%u, flag=%d, eol=%d\n",
 			 i, chan->sgtable[i].addr,
 			 chan->sgtable[i].count & 0x00FFFFFF,
 			 chan->sgtable[i].count & VIA_FLAG ? 1 : 0,
 			 chan->sgtable[i].count & VIA_EOL ? 1 : 0);
 	}
-	DPRINTK ("buf_in_use = %d, nextbuf = %d\n",
+	pr_debug ("buf_in_use = %d, nextbuf = %d\n",
 		 atomic_read (&chan->buf_in_use),
 		 atomic_read (&chan->sw_ptr));
 }
@@ -1340,7 +1332,7 @@ static void via_chan_dump_bufs (struct via_channel *chan)

 static void via_chan_flush_frag (struct via_channel *chan)
 {
-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (chan->slop_len > 0);

@@ -1354,7 +1346,7 @@ static void via_chan_flush_frag (struct via_channel *chan)
 	assert (atomic_read (&chan->n_frags) > 0);
 	atomic_dec (&chan->n_frags);

-	DPRINTK ("EXIT\n");
+	pr_debug ("EXIT\n");
 }


@@ -1371,11 +1363,11 @@ static inline void via_chan_maybe_start
(struct via_channel *chan)
 {
 	assert (chan->is_active = sg_active(chan->iobase));

-	DPRINTK ("MAYBE START %s\n", chan->name);
+	pr_debug ("MAYBE START %s\n", chan->name);
 	if (!chan->is_active && chan->is_enabled) {
 		chan->is_active = 1;
 		sg_begin (chan);
-		DPRINTK ("starting channel %s\n", chan->name);
+		pr_debug ("starting channel %s\n", chan->name);
 	}
 }

@@ -1401,7 +1393,7 @@ static u8 via_ac97_wait_idle (struct via_info *card)
 	u8 tmp8;
 	int counter = VIA_COUNTER_LIMIT;

-	DPRINTK ("ENTER/EXIT\n");
+	pr_debug ("ENTER/EXIT\n");

 	assert (card != NULL);
 	assert (card->pdev != NULL);
@@ -1439,7 +1431,7 @@ static u16 via_ac97_read_reg (struct ac97_codec
*codec, u8 reg)
 	struct via_info *card;
 	int counter;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (codec != NULL);
 	assert (codec->private_data != NULL);
@@ -1475,7 +1467,7 @@ out:
 	outb (0x02, card->baseaddr + 0x83);

 	if (((data & 0x007F0000) >> 16) = reg) {
-		DPRINTK ("EXIT, success, data=0x%lx, retval=0x%lx\n",
+		pr_debug ("EXIT, success, data=0x%lx, retval=0x%lx\n",
 			 data, data & 0x0000FFFF);
 		spin_unlock(&card->ac97_lock);
 		return data & 0x0000FFFF;
@@ -1486,7 +1478,7 @@ out:

 err_out:
 	spin_unlock(&card->ac97_lock);
-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return 0;
 }

@@ -1510,7 +1502,7 @@ static void via_ac97_write_reg (struct
ac97_codec *codec, u8 reg, u16 value)
 	struct via_info *card;
 	int counter;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (codec != NULL);
 	assert (codec->private_data != NULL);
@@ -1534,7 +1526,7 @@ static void via_ac97_write_reg (struct
ac97_codec *codec, u8 reg, u16 value)

 out:
 	spin_unlock(&card->ac97_lock);
-	DPRINTK ("EXIT\n");
+	pr_debug ("EXIT\n");
 }


@@ -1545,7 +1537,7 @@ static int via_mixer_open (struct inode *inode,
struct file *file)
 	struct pci_dev *pdev = NULL;
 	struct pci_driver *drvr;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
 		drvr = pci_dev_driver (pdev);
@@ -1558,14 +1550,14 @@ static int via_mixer_open (struct inode
*inode, struct file *file)
 		}
 	}

-	DPRINTK ("EXIT, returning -ENODEV\n");
+	pr_debug ("EXIT, returning -ENODEV\n");
 	return -ENODEV;

 match:
 	pci_dev_put(pdev);
 	file->private_data = card->ac97;

-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return nonseekable_open(inode, file);
 }

@@ -1577,7 +1569,7 @@ static int via_mixer_ioctl (struct inode *inode,
struct file *file, unsigned int
 	int nonblock = (file->f_flags & O_NONBLOCK);
 	int rc;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (codec != NULL);
 	card = codec->private_data;
@@ -1614,7 +1606,7 @@ static int via_mixer_ioctl (struct inode *inode,
struct file *file, unsigned int
 	mutex_unlock(&card->syscall_mutex);

 out:
-	DPRINTK ("EXIT, returning %d\n", rc);
+	pr_debug ("EXIT, returning %d\n", rc);
 	return rc;
 }

@@ -1633,7 +1625,7 @@ static int __devinit via_ac97_reset (struct
via_info *card)
 	u8 tmp8;
 	u16 tmp16;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (pdev != NULL);

@@ -1646,11 +1638,11 @@ static int __devinit via_ac97_reset (struct
via_info *card)
 		pci_read_config_byte (card->pdev, 0x43, &r43);
 		pci_read_config_byte (card->pdev, 0x44, &r44);
 		pci_read_config_byte (card->pdev, 0x48, &r48);
-		DPRINTK ("PCI config: %02X %02X %02X %02X %02X %02X\n",
+		pr_debug ("PCI config: %02X %02X %02X %02X %02X %02X\n",
 			r40,r41,r42,r43,r44,r48);

 		spin_lock_irq (&card->lock);
-		DPRINTK ("regs=%02X %02X %02X %08X %08X %08X %08X\n",
+		pr_debug ("regs=%02X %02X %02X %08X %08X %08X %08X\n",
 			 inb (card->baseaddr + 0x00),
 			 inb (card->baseaddr + 0x01),
 			 inb (card->baseaddr + 0x02),
@@ -1725,7 +1717,7 @@ static int __devinit via_ac97_reset (struct
via_info *card)
  	if ((tmp16 & 1) = 0)
  		via_ac97_write_reg (card->ac97, AC97_EXTENDED_STATUS, tmp16 | 1);

-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return 0;
 }

@@ -1742,7 +1734,7 @@ static int __devinit via_ac97_init (struct via_info *card)
 	int rc;
 	u16 tmp16;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (card != NULL);

@@ -1758,7 +1750,7 @@ static int __devinit via_ac97_init (struct via_info *card)
 	card->ac97->dev_mixer = register_sound_mixer (&via_mixer_fops, -1);
 	if (card->ac97->dev_mixer < 0) {
 		printk (KERN_ERR PFX "unable to register AC97 mixer, aborting\n");
-		DPRINTK ("EXIT, returning -EIO\n");
+		pr_debug ("EXIT, returning -EIO\n");
 		ac97_release_codec(card->ac97);
 		return -EIO;
 	}
@@ -1795,12 +1787,12 @@ static int __devinit via_ac97_init (struct
via_info *card)
  		}
  	}

-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return 0;

 err_out:
 	unregister_sound_mixer (card->ac97->dev_mixer);
-	DPRINTK ("EXIT, returning %d\n", rc);
+	pr_debug ("EXIT, returning %d\n", rc);
 	ac97_release_codec(card->ac97);
 	return rc;
 }
@@ -1808,7 +1800,7 @@ err_out:

 static void via_ac97_cleanup (struct via_info *card)
 {
-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (card != NULL);
 	assert (card->ac97->dev_mixer >= 0);
@@ -1816,7 +1808,7 @@ static void via_ac97_cleanup (struct via_info *card)
 	unregister_sound_mixer (card->ac97->dev_mixer);
 	ac97_release_codec(card->ac97);

-	DPRINTK ("EXIT\n");
+	pr_debug ("EXIT\n");
 }


@@ -1903,11 +1895,11 @@ static void via_intr_channel (struct via_info
*card, struct via_channel *chan)
 	/* wake up anyone listening to see when interrupts occur */
 	wake_up_all (&chan->wait);

-	DPRINTK ("%s intr, status=0x%02X, hwptr=0x%lX, chan->hw_ptr=%d\n",
+	pr_debug ("%s intr, status=0x%02X, hwptr=0x%lX, chan->hw_ptr=%d\n",
 		 chan->name, status, (long) inl (chan->iobase + 0x04),
 		 atomic_read (&chan->hw_ptr));

-	DPRINTK ("%s intr, channel n_frags = %d, missed %d\n", chan->name,
+	pr_debug ("%s intr, channel n_frags = %d, missed %d\n", chan->name,
 		 atomic_read (&chan->n_frags), missed);
 }

@@ -1931,7 +1923,7 @@ static irqreturn_t  via_interrupt(int irq, void *dev_id)
 #endif
 		return IRQ_HANDLED;
     	}
-	DPRINTK ("intr, status32 = 0x%08X\n", status32);
+	pr_debug ("intr, status32 = 0x%08X\n", status32);

 	/* synchronize interrupt handling under SMP.  this spinlock
 	 * goes away completely on UP
@@ -1990,7 +1982,7 @@ static int via_interrupt_init (struct via_info *card)
 {
 	u8 tmp8;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (card != NULL);
 	assert (card->pdev != NULL);
@@ -1999,7 +1991,7 @@ static int via_interrupt_init (struct via_info *card)
 	if (card->pdev->irq < 2) {
 		printk (KERN_ERR PFX "insane IRQ %d, aborting\n",
 			card->pdev->irq);
-		DPRINTK ("EXIT, returning -EIO\n");
+		pr_debug ("EXIT, returning -EIO\n");
 		return -EIO;
 	}

@@ -2017,7 +2009,7 @@ static int via_interrupt_init (struct via_info *card)
 		if (request_irq (card->pdev->irq, via_interrupt, IRQF_SHARED,
VIA_MODULE_NAME, card)) {
 			printk (KERN_ERR PFX "unable to obtain IRQ %d, aborting\n",
 				card->pdev->irq);
-			DPRINTK ("EXIT, returning -EBUSY\n");
+			pr_debug ("EXIT, returning -EBUSY\n");
 			return -EBUSY;
 		}
 	}
@@ -2026,12 +2018,12 @@ static int via_interrupt_init (struct via_info *card)
 		if (request_irq (card->pdev->irq, via_new_interrupt, IRQF_SHARED,
VIA_MODULE_NAME, card)) {
 			printk (KERN_ERR PFX "unable to obtain IRQ %d, aborting\n",
 				card->pdev->irq);
-			DPRINTK ("EXIT, returning -EBUSY\n");
+			pr_debug ("EXIT, returning -EBUSY\n");
 			return -EBUSY;
 		}
 	}

-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return 0;
 }

@@ -2059,7 +2051,7 @@ static int __devinit via_dsp_init (struct via_info *card)
 {
 	u8 tmp8;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (card != NULL);

@@ -2077,17 +2069,17 @@ static int __devinit via_dsp_init (struct
via_info *card)

 	card->dev_dsp = register_sound_dsp (&via_dsp_fops, -1);
 	if (card->dev_dsp < 0) {
-		DPRINTK ("EXIT, returning -ENODEV\n");
+		pr_debug ("EXIT, returning -ENODEV\n");
 		return -ENODEV;
 	}
-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return 0;
 }


 static void via_dsp_cleanup (struct via_info *card)
 {
-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (card != NULL);
 	assert (card->dev_dsp >= 0);
@@ -2096,7 +2088,7 @@ static void via_dsp_cleanup (struct via_info *card)

 	unregister_sound_dsp (card->dev_dsp);

-	DPRINTK ("EXIT\n");
+	pr_debug ("EXIT\n");
 }


@@ -2109,18 +2101,18 @@ static struct page * via_mm_nopage (struct
vm_area_struct * vma,
 	unsigned long pgoff;
 	int rd, wr;

-	DPRINTK ("ENTER, start %lXh, ofs %lXh, pgoff %ld, addr %lXh\n",
+	pr_debug ("ENTER, start %lXh, ofs %lXh, pgoff %ld, addr %lXh\n",
 		 vma->vm_start,
 		 address - vma->vm_start,
 		 (address - vma->vm_start) >> PAGE_SHIFT,
 		 address);

         if (address > vma->vm_end) {
-		DPRINTK ("EXIT, returning NOPAGE_SIGBUS\n");
+		pr_debug ("EXIT, returning NOPAGE_SIGBUS\n");
 		return NOPAGE_SIGBUS; /* Disallow mremap */
 	}
         if (!card) {
-		DPRINTK ("EXIT, returning NOPAGE_SIGBUS\n");
+		pr_debug ("EXIT, returning NOPAGE_SIGBUS\n");
 		return NOPAGE_SIGBUS;	/* Nothing allocated */
 	}

@@ -2148,7 +2140,7 @@ static struct page * via_mm_nopage (struct
vm_area_struct * vma,
 	assert ((((unsigned long)chan->pgtbl[pgoff].cpuaddr) % PAGE_SIZE) = 0);

 	dmapage = virt_to_page (chan->pgtbl[pgoff].cpuaddr);
-	DPRINTK ("EXIT, returning page %p for cpuaddr %lXh\n",
+	pr_debug ("EXIT, returning page %p for cpuaddr %lXh\n",
 		 dmapage, (unsigned long) chan->pgtbl[pgoff].cpuaddr);
 	get_page (dmapage);
 	if (type)
@@ -2186,7 +2178,7 @@ static int via_dsp_mmap(struct file *file,
struct vm_area_struct *vma)
 	card = file->private_data;
 	assert (card != NULL);

-	DPRINTK ("ENTER, start %lXh, size %ld, pgoff %ld\n",
+	pr_debug ("ENTER, start %lXh, size %ld, pgoff %ld\n",
 		 vma->vm_start,
 		 vma->vm_end - vma->vm_start,
 		 vma->vm_pgoff);
@@ -2234,7 +2226,7 @@ static int via_dsp_mmap(struct file *file,
struct vm_area_struct *vma)
 	rc = 0;

 out:
-	DPRINTK ("EXIT, returning %d\n", rc);
+	pr_debug ("EXIT, returning %d\n", rc);
 	return rc;
 }

@@ -2290,7 +2282,7 @@ handle_one_block:

 		mutex_unlock(&card->syscall_mutex);

-		DPRINTK ("Sleeping on block %d\n", n);
+		pr_debug ("Sleeping on block %d\n", n);
 		schedule();

 		ret = via_syscall_down (card, nonblock);
@@ -2354,10 +2346,10 @@ handle_one_block:
 	/* we are at a block boundary, there is no fragment data */
 	chan->slop_len = 0;

-	DPRINTK ("Flushed block %u, sw_ptr now %u, n_frags now %d\n",
+	pr_debug ("Flushed block %u, sw_ptr now %u, n_frags now %d\n",
 		n, chan->sw_ptr, atomic_read (&chan->n_frags));

-	DPRINTK ("regs=%02X %02X %02X %08X %08X %08X %08X\n",
+	pr_debug ("regs=%02X %02X %02X %08X %08X %08X %08X\n",
 		 inb (card->baseaddr + 0x00),
 		 inb (card->baseaddr + 0x01),
 		 inb (card->baseaddr + 0x02),
@@ -2380,7 +2372,7 @@ static ssize_t via_dsp_read(struct file *file,
char __user *buffer, size_t count
 	int nonblock = (file->f_flags & O_NONBLOCK);
 	int rc;

-	DPRINTK ("ENTER, file=%p, buffer=%p, count=%u, ppos=%lu\n",
+	pr_debug ("ENTER, file=%p, buffer=%p, count=%u, ppos=%lu\n",
 		 file, buffer, count, ppos ? ((unsigned long)*ppos) : 0);

 	assert (file != NULL);
@@ -2406,7 +2398,7 @@ static ssize_t via_dsp_read(struct file *file,
char __user *buffer, size_t count
 out_up:
 	mutex_unlock(&card->syscall_mutex);
 out:
-	DPRINTK ("EXIT, returning %ld\n",(long) rc);
+	pr_debug ("EXIT, returning %ld\n",(long) rc);
 	return rc;
 }

@@ -2460,7 +2452,7 @@ handle_one_block:

 		mutex_unlock(&card->syscall_mutex);

-		DPRINTK ("Sleeping on page %d, tmp=%d, ir=%d\n", n, tmp, chan->is_record);
+		pr_debug ("Sleeping on page %d, tmp=%d, ir=%d\n", n, tmp, chan->is_record);
 		schedule();

 		ret = via_syscall_down (card, nonblock);
@@ -2533,10 +2525,10 @@ handle_one_block:
 	/* if SGD has not yet been started, start it */
 	via_chan_maybe_start (chan);

-	DPRINTK ("Flushed block %u, sw_ptr now %u, n_frags now %d\n",
+	pr_debug ("Flushed block %u, sw_ptr now %u, n_frags now %d\n",
 		n, chan->sw_ptr, atomic_read (&chan->n_frags));

-	DPRINTK ("regs=S=%02X C=%02X TP=%02X BP=%08X RT=%08X SG=%08X
CC=%08X SS=%08X\n",
+	pr_debug ("regs=S=%02X C=%02X TP=%02X BP=%08X RT=%08X SG=%08X
CC=%08X SS=%08X\n",
 		 inb (card->baseaddr + 0x00),
 		 inb (card->baseaddr + 0x01),
 		 inb (card->baseaddr + 0x02),
@@ -2563,7 +2555,7 @@ static ssize_t via_dsp_write(struct file *file,
const char __user *buffer, size_
 	ssize_t rc;
 	int nonblock = (file->f_flags & O_NONBLOCK);

-	DPRINTK ("ENTER, file=%p, buffer=%p, count=%u, ppos=%lu\n",
+	pr_debug ("ENTER, file=%p, buffer=%p, count=%u, ppos=%lu\n",
 		 file, buffer, count, ppos ? ((unsigned long)*ppos) : 0);

 	assert (file != NULL);
@@ -2589,7 +2581,7 @@ static ssize_t via_dsp_write(struct file *file,
const char __user *buffer, size_
 out_up:
 	mutex_unlock(&card->syscall_mutex);
 out:
-	DPRINTK ("EXIT, returning %ld\n",(long) rc);
+	pr_debug ("EXIT, returning %ld\n",(long) rc);
 	return rc;
 }

@@ -2600,7 +2592,7 @@ static unsigned int via_dsp_poll(struct file
*file, struct poll_table_struct *wa
 	struct via_channel *chan;
 	unsigned int mask = 0;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (file != NULL);
 	card = file->private_data;
@@ -2622,7 +2614,7 @@ static unsigned int via_dsp_poll(struct file
*file, struct poll_table_struct *wa
 			mask |= POLLOUT | POLLWRNORM;
 	}

-	DPRINTK ("EXIT, returning %u\n", mask);
+	pr_debug ("EXIT, returning %u\n", mask);
 	return mask;
 }

@@ -2645,7 +2637,7 @@ static int via_dsp_drain_playback (struct via_info *card,
         DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;

-	DPRINTK ("ENTER, nonblock = %d\n", nonblock);
+	pr_debug ("ENTER, nonblock = %d\n", nonblock);

 	if (chan->slop_len > 0)
 		via_chan_flush_frag (chan);
@@ -2657,13 +2649,13 @@ static int via_dsp_drain_playback (struct
via_info *card,

 	add_wait_queue(&chan->wait, &wait);
 	for (;;) {
-		DPRINTK ("FRAGS %d FRAGNUM %d\n", atomic_read(&chan->n_frags),
chan->frag_number);
+		pr_debug ("FRAGS %d FRAGNUM %d\n", atomic_read(&chan->n_frags),
chan->frag_number);
 		__set_current_state(TASK_INTERRUPTIBLE);
 		if (atomic_read (&chan->n_frags) >= chan->frag_number)
 			break;

 		if (nonblock) {
-			DPRINTK ("EXIT, returning -EAGAIN\n");
+			pr_debug ("EXIT, returning -EAGAIN\n");
 			ret = -EAGAIN;
 			break;
 		}
@@ -2677,10 +2669,10 @@ static int via_dsp_drain_playback (struct
via_info *card,
 		pci_read_config_byte (card->pdev, 0x43, &r43);
 		pci_read_config_byte (card->pdev, 0x44, &r44);
 		pci_read_config_byte (card->pdev, 0x48, &r48);
-		DPRINTK ("PCI config: %02X %02X %02X %02X %02X %02X\n",
+		pr_debug ("PCI config: %02X %02X %02X %02X %02X %02X\n",
 			r40,r41,r42,r43,r44,r48);

-		DPRINTK ("regs=%02X %02X %02X %08X %08X %08X %08X\n",
+		pr_debug ("regs=%02X %02X %02X %08X %08X %08X %08X\n",
 			 inb (card->baseaddr + 0x00),
 			 inb (card->baseaddr + 0x01),
 			 inb (card->baseaddr + 0x02),
@@ -2696,14 +2688,14 @@ static int via_dsp_drain_playback (struct
via_info *card,

 		mutex_unlock(&card->syscall_mutex);

-		DPRINTK ("sleeping, nbufs=%d\n", atomic_read (&chan->n_frags));
+		pr_debug ("sleeping, nbufs=%d\n", atomic_read (&chan->n_frags));
 		schedule();

 		if ((ret = via_syscall_down (card, nonblock)))
 			break;

 		if (signal_pending (current)) {
-			DPRINTK ("EXIT, returning -ERESTARTSYS\n");
+			pr_debug ("EXIT, returning -ERESTARTSYS\n");
 			ret = -ERESTARTSYS;
 			break;
 		}
@@ -2720,10 +2712,10 @@ static int via_dsp_drain_playback (struct
via_info *card,
 		pci_read_config_byte (card->pdev, 0x43, &r43);
 		pci_read_config_byte (card->pdev, 0x44, &r44);
 		pci_read_config_byte (card->pdev, 0x48, &r48);
-		DPRINTK ("PCI config: %02X %02X %02X %02X %02X %02X\n",
+		pr_debug ("PCI config: %02X %02X %02X %02X %02X %02X\n",
 			r40,r41,r42,r43,r44,r48);

-		DPRINTK ("regs=%02X %02X %02X %08X %08X %08X %08X\n",
+		pr_debug ("regs=%02X %02X %02X %08X %08X %08X %08X\n",
 			 inb (card->baseaddr + 0x00),
 			 inb (card->baseaddr + 0x01),
 			 inb (card->baseaddr + 0x02),
@@ -2732,12 +2724,12 @@ static int via_dsp_drain_playback (struct
via_info *card,
 			 inl (card->baseaddr + 0x80),
 			 inl (card->baseaddr + 0x84));

-		DPRINTK ("final nbufs=%d\n", atomic_read (&chan->n_frags));
+		pr_debug ("final nbufs=%d\n", atomic_read (&chan->n_frags));
 	}
 #endif

 out:
-	DPRINTK ("EXIT, returning %d\n", ret);
+	pr_debug ("EXIT, returning %d\n", ret);
 	return ret;
 }

@@ -2777,7 +2769,7 @@ static int via_dsp_ioctl_space (struct via_info *card,
 	if (chan->slop_len % chan->frag_size > 0)
 		info.bytes += chan->frag_size - (chan->slop_len % chan->frag_size);

-	DPRINTK ("EXIT, returning fragstotal=%d, fragsize=%d, fragments=%d,
bytes=%d\n",
+	pr_debug ("EXIT, returning fragstotal=%d, fragsize=%d, fragments=%d,
bytes=%d\n",
 		info.fragstotal,
 		info.fragsize,
 		info.fragments,
@@ -2822,7 +2814,7 @@ static int via_dsp_ioctl_ptr (struct via_info *card,
 		info.ptr = 0;
 	}

-	DPRINTK ("EXIT, returning bytes=%d, blocks=%d, ptr=%d\n",
+	pr_debug ("EXIT, returning bytes=%d, blocks=%d, ptr=%d\n",
 		info.bytes,
 		info.blocks,
 		info.ptr);
@@ -2848,7 +2840,7 @@ static int via_dsp_ioctl_trigger (struct
via_channel *chan, int val)
 		do_something = 0;
 	}

-	DPRINTK ("enable=%d, do_something=%d\n",
+	pr_debug ("enable=%d, do_something=%d\n",
 		 enable, do_something);

 	if (chan->is_active && do_something)
@@ -2857,12 +2849,12 @@ static int via_dsp_ioctl_trigger (struct
via_channel *chan, int val)
 	if (do_something = 1) {
 		chan->is_enabled = 1;
 		via_chan_maybe_start (chan);
-		DPRINTK ("Triggering input\n");
+		pr_debug ("Triggering input\n");
 	}

 	else if (do_something = -1) {
 		chan->is_enabled = 0;
-		DPRINTK ("Setup input trigger\n");
+		pr_debug ("Setup input trigger\n");
 	}

 	return 0;
@@ -2897,13 +2889,13 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,

 	/* OSS API version.  XXX unverified */
 	case OSS_GETVERSION:
-		DPRINTK ("ioctl OSS_GETVERSION, EXIT, returning SOUND_VERSION\n");
+		pr_debug ("ioctl OSS_GETVERSION, EXIT, returning SOUND_VERSION\n");
 		rc = put_user (SOUND_VERSION, ip);
 		break;

 	/* list of supported PCM data formats */
 	case SNDCTL_DSP_GETFMTS:
-		DPRINTK ("DSP_GETFMTS, EXIT, returning AFMT U8|S16_LE\n");
+		pr_debug ("DSP_GETFMTS, EXIT, returning AFMT U8|S16_LE\n");
                 rc = put_user (AFMT_U8 | AFMT_S16_LE, ip);
 		break;

@@ -2913,7 +2905,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 			rc = -EFAULT;
 			break;
 		}
-		DPRINTK ("DSP_SETFMT, val=%d\n", val);
+		pr_debug ("DSP_SETFMT, val=%d\n", val);
 		if (val != AFMT_QUERY) {
 			rc = 0;

@@ -2934,7 +2926,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 			else
 				val = AFMT_U8;
 		}
-		DPRINTK ("SETFMT EXIT, returning %d\n", val);
+		pr_debug ("SETFMT EXIT, returning %d\n", val);
                 rc = put_user (val, ip);
 		break;

@@ -2944,7 +2936,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 			rc = -EFAULT;
 			break;
 		}
-		DPRINTK ("DSP_CHANNELS, val=%d\n", val);
+		pr_debug ("DSP_CHANNELS, val=%d\n", val);
 		if (val != 0) {
 			rc = 0;

@@ -2964,7 +2956,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 			else
 				val = card->ch_out.channels;
 		}
-		DPRINTK ("CHANNELS EXIT, returning %d\n", val);
+		pr_debug ("CHANNELS EXIT, returning %d\n", val);
                 rc = put_user (val, ip);
 		break;

@@ -2974,7 +2966,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 			rc = -EFAULT;
 			break;
 		}
-		DPRINTK ("DSP_STEREO, val=%d\n", val);
+		pr_debug ("DSP_STEREO, val=%d\n", val);
 		rc = 0;

 		if (rd)
@@ -2987,7 +2979,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,

 		val = rc - 1;

-		DPRINTK ("STEREO EXIT, returning %d\n", val);
+		pr_debug ("STEREO EXIT, returning %d\n", val);
 		rc = put_user(val, ip);
 		break;

@@ -2997,7 +2989,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 			rc = -EFAULT;
 			break;
 		}
-		DPRINTK ("DSP_SPEED, val=%d\n", val);
+		pr_debug ("DSP_SPEED, val=%d\n", val);
 		if (val < 0) {
 			rc = -EINVAL;
 			break;
@@ -3022,23 +3014,23 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 			else
 				val = 0;
 		}
-		DPRINTK ("SPEED EXIT, returning %d\n", val);
+		pr_debug ("SPEED EXIT, returning %d\n", val);
                 rc = put_user (val, ip);
 		break;

 	/* wait until all buffers have been played, and then stop device */
 	case SNDCTL_DSP_SYNC:
-		DPRINTK ("DSP_SYNC\n");
+		pr_debug ("DSP_SYNC\n");
 		rc = 0;
 		if (wr) {
-			DPRINTK ("SYNC EXIT (after calling via_dsp_drain_playback)\n");
+			pr_debug ("SYNC EXIT (after calling via_dsp_drain_playback)\n");
 			rc = via_dsp_drain_playback (card, &card->ch_out, nonblock);
 		}
 		break;

 	/* stop recording/playback immediately */
         case SNDCTL_DSP_RESET:
-		DPRINTK ("DSP_RESET\n");
+		pr_debug ("DSP_RESET\n");
 		if (rd) {
 			via_chan_clear (card, &card->ch_in);
 			card->ch_in.frag_number = 0;
@@ -3063,13 +3055,13 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,

 	/* obtain bitmask of device capabilities, such as mmap, full duplex, etc. */
 	case SNDCTL_DSP_GETCAPS:
-		DPRINTK ("DSP_GETCAPS\n");
+		pr_debug ("DSP_GETCAPS\n");
 		rc = put_user(VIA_DSP_CAP, ip);
 		break;

 	/* obtain buffer fragment size */
 	case SNDCTL_DSP_GETBLKSIZE:
-		DPRINTK ("DSP_GETBLKSIZE\n");
+		pr_debug ("DSP_GETBLKSIZE\n");

 		if (rd) {
 			via_chan_set_buffering(card, &card->ch_in, -1);
@@ -3082,28 +3074,28 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,

 	/* obtain information about input buffering */
 	case SNDCTL_DSP_GETISPACE:
-		DPRINTK ("DSP_GETISPACE\n");
+		pr_debug ("DSP_GETISPACE\n");
 		if (rd)
 			rc = via_dsp_ioctl_space (card, &card->ch_in, p);
 		break;

 	/* obtain information about output buffering */
 	case SNDCTL_DSP_GETOSPACE:
-		DPRINTK ("DSP_GETOSPACE\n");
+		pr_debug ("DSP_GETOSPACE\n");
 		if (wr)
 			rc = via_dsp_ioctl_space (card, &card->ch_out, p);
 		break;

 	/* obtain information about input hardware pointer */
 	case SNDCTL_DSP_GETIPTR:
-		DPRINTK ("DSP_GETIPTR\n");
+		pr_debug ("DSP_GETIPTR\n");
 		if (rd)
 			rc = via_dsp_ioctl_ptr (card, &card->ch_in, p);
 		break;

 	/* obtain information about output hardware pointer */
 	case SNDCTL_DSP_GETOPTR:
-		DPRINTK ("DSP_GETOPTR\n");
+		pr_debug ("DSP_GETOPTR\n");
 		if (wr)
 			rc = via_dsp_ioctl_ptr (card, &card->ch_out, p);
 		break;
@@ -3111,7 +3103,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 	/* return number of bytes remaining to be played by DMA engine */
 	case SNDCTL_DSP_GETODELAY:
 		{
-		DPRINTK ("DSP_GETODELAY\n");
+		pr_debug ("DSP_GETODELAY\n");

 		chan = &card->ch_out;

@@ -3134,7 +3126,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,

 		assert (val <= (chan->frag_size * chan->frag_number));

-		DPRINTK ("GETODELAY EXIT, val = %d bytes\n", val);
+		pr_debug ("GETODELAY EXIT, val = %d bytes\n", val);
                 rc = put_user (val, ip);
 		break;
 		}
@@ -3148,7 +3140,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 			rc = -EFAULT;
 			break;
 		}
-		DPRINTK ("DSP_SETTRIGGER, rd=%d, wr=%d, act=%d/%d, en=%d/%d\n",
+		pr_debug ("DSP_SETTRIGGER, rd=%d, wr=%d, act=%d/%d, en=%d/%d\n",
 			rd, wr, card->ch_in.is_active, card->ch_out.is_active,
 			card->ch_in.is_enabled, card->ch_out.is_enabled);

@@ -3175,7 +3167,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 	 * with O_RDWR, this is mainly a no-op that always returns success.
 	 */
 	case SNDCTL_DSP_SETDUPLEX:
-		DPRINTK ("DSP_SETDUPLEX\n");
+		pr_debug ("DSP_SETDUPLEX\n");
 		if (!rd || !wr)
 			break;
 		rc = 0;
@@ -3187,7 +3179,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 			rc = -EFAULT;
 			break;
 		}
-		DPRINTK ("DSP_SETFRAGMENT, val=%d\n", val);
+		pr_debug ("DSP_SETFRAGMENT, val=%d\n", val);

 		if (rd)
 			rc = via_chan_set_buffering(card, &card->ch_in, val);
@@ -3195,7 +3187,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,
 		if (wr)
 			rc = via_chan_set_buffering(card, &card->ch_out, val);

-		DPRINTK ("SNDCTL_DSP_SETFRAGMENT (fragshift=0x%04X (%d),
maxfrags=0x%04X (%d))\n",
+		pr_debug ("SNDCTL_DSP_SETFRAGMENT (fragshift=0x%04X (%d),
maxfrags=0x%04X (%d))\n",
 			 val & 0xFFFF,
 			 val & 0xFFFF,
 			 (val >> 16) & 0xFFFF,
@@ -3206,7 +3198,7 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,

 	/* inform device of an upcoming pause in input (or output). */
 	case SNDCTL_DSP_POST:
-		DPRINTK ("DSP_POST\n");
+		pr_debug ("DSP_POST\n");
 		if (wr) {
 			if (card->ch_out.slop_len > 0)
 				via_chan_flush_frag (&card->ch_out);
@@ -3218,13 +3210,13 @@ static int via_dsp_ioctl (struct inode *inode,
struct file *file,

 	/* not implemented */
 	default:
-		DPRINTK ("unhandled ioctl, cmd=%u, arg=%p\n",
+		pr_debug ("unhandled ioctl, cmd=%u, arg=%p\n",
 			 cmd, p);
 		break;
 	}

 	mutex_unlock(&card->syscall_mutex);
-	DPRINTK ("EXIT, returning %d\n", rc);
+	pr_debug ("EXIT, returning %d\n", rc);
 	return rc;
 }

@@ -3238,10 +3230,10 @@ static int via_dsp_open (struct inode *inode,
struct file *file)
 	struct pci_driver *drvr;
 	int nonblock = (file->f_flags & O_NONBLOCK);

-	DPRINTK ("ENTER, minor=%d, file->f_mode=0x%x\n", minor, file->f_mode);
+	pr_debug ("ENTER, minor=%d, file->f_mode=0x%x\n", minor, file->f_mode);

 	if (!(file->f_mode & (FMODE_READ | FMODE_WRITE))) {
-		DPRINTK ("EXIT, returning -EINVAL\n");
+		pr_debug ("EXIT, returning -EINVAL\n");
 		return -EINVAL;
 	}

@@ -3252,7 +3244,7 @@ static int via_dsp_open (struct inode *inode,
struct file *file)
 			assert (pci_get_drvdata (pdev) != NULL);

 			card = pci_get_drvdata (pdev);
-			DPRINTK ("dev_dsp = %d, minor = %d, assn = %d\n",
+			pr_debug ("dev_dsp = %d, minor = %d, assn = %d\n",
 				 card->dev_dsp, minor,
 				 (card->dev_dsp ^ minor) & ~0xf);

@@ -3261,25 +3253,25 @@ static int via_dsp_open (struct inode *inode,
struct file *file)
 		}
 	}

-	DPRINTK ("no matching %s found\n", card ? "minor" : "driver");
+	pr_debug ("no matching %s found\n", card ? "minor" : "driver");
 	return -ENODEV;

 match:
 	pci_dev_put(pdev);
 	if (nonblock) {
 		if (!mutex_trylock(&card->open_mutex)) {
-			DPRINTK ("EXIT, returning -EAGAIN\n");
+			pr_debug ("EXIT, returning -EAGAIN\n");
 			return -EAGAIN;
 		}
 	} else {
 		if (mutex_lock_interruptible(&card->open_mutex)) {
-			DPRINTK ("EXIT, returning -ERESTARTSYS\n");
+			pr_debug ("EXIT, returning -ERESTARTSYS\n");
 			return -ERESTARTSYS;
 		}
 	}

 	file->private_data = card;
-	DPRINTK ("file->f_mode = 0x%x\n", file->f_mode);
+	pr_debug ("file->f_mode = 0x%x\n", file->f_mode);

 	/* handle input from analog source */
 	if (file->f_mode & FMODE_READ) {
@@ -3321,7 +3313,7 @@ match:
 		}
 	}

-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return nonseekable_open(inode, file);
 }

@@ -3332,7 +3324,7 @@ static int via_dsp_release(struct inode *inode,
struct file *file)
 	int nonblock = (file->f_flags & O_NONBLOCK);
 	int rc;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (file != NULL);
 	card = file->private_data;
@@ -3340,7 +3332,7 @@ static int via_dsp_release(struct inode *inode,
struct file *file)

 	rc = via_syscall_down (card, nonblock);
 	if (rc) {
-		DPRINTK ("EXIT (syscall_down error), rc=%d\n", rc);
+		pr_debug ("EXIT (syscall_down error), rc=%d\n", rc);
 		return rc;
 	}

@@ -3361,7 +3353,7 @@ static int via_dsp_release(struct inode *inode,
struct file *file)
 	mutex_unlock(&card->syscall_mutex);
 	mutex_unlock(&card->open_mutex);

-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return 0;
 }

@@ -3382,7 +3374,7 @@ static int __devinit via_init_one (struct
pci_dev *pdev, const struct pci_device
 	struct via_info *card;
 	static int printed_version;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	if (printed_version++ = 0)
 		printk (KERN_INFO "Via 686a/8233/8235 audio driver " VIA_VERSION "\n");
@@ -3513,7 +3505,7 @@ static int __devinit via_init_one (struct
pci_dev *pdev, const struct pci_device
 	}
 #endif

-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return 0;

 err_out_have_dsp:
@@ -3536,7 +3528,7 @@ err_out_disable:

 err_out:
 	pci_set_drvdata (pdev, NULL);
-	DPRINTK ("EXIT - returning %d\n", rc);
+	pr_debug ("EXIT - returning %d\n", rc);
 	return rc;
 }

@@ -3545,7 +3537,7 @@ static void __devexit via_remove_one (struct
pci_dev *pdev)
 {
 	struct via_info *card;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	assert (pdev != NULL);
 	card = pci_get_drvdata (pdev);
@@ -3571,7 +3563,7 @@ static void __devexit via_remove_one (struct
pci_dev *pdev)
 	pci_disable_device (pdev);
 	pci_set_power_state (pdev, 3); /* ...zzzzzz */

-	DPRINTK ("EXIT\n");
+	pr_debug ("EXIT\n");
 	return;
 }

@@ -3587,26 +3579,26 @@ static int __init init_via82cxxx_audio(void)
 {
 	int rc;

-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	rc = pci_register_driver (&via_driver);
 	if (rc) {
-		DPRINTK ("EXIT, returning %d\n", rc);
+		pr_debug ("EXIT, returning %d\n", rc);
 		return rc;
 	}

-	DPRINTK ("EXIT, returning 0\n");
+	pr_debug ("EXIT, returning 0\n");
 	return 0;
 }


 static void __exit cleanup_via82cxxx_audio(void)
 {
-	DPRINTK ("ENTER\n");
+	pr_debug ("ENTER\n");

 	pci_unregister_driver (&via_driver);

-	DPRINTK ("EXIT\n");
+	pr_debug ("EXIT\n");
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
