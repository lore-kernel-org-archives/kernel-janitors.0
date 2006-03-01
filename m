From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 01 Mar 2006 09:00:17 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/char
Message-Id: <1141203617.9000.6.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55565051894156037=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============55565051894156037==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/pci to kzalloc usage.
Compile tested with allyes config.

char/rio/rio_linux.c and char/sx.c had a ckmalloc()
function, which i removed and changed the callers
to kzalloc(). 

zft_kmalloc() in char/ftape/zftape/zftape-buffers.c
seems a bit strange to me, since it never returns, when
it cant get memory allocated. 

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4-mm2/drivers/char/ftape/lowlevel/ftape-buffer.c.orig	2006-03-01 09:04:01.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/ftape/lowlevel/ftape-buffer.c	2006-03-01 09:04:15.000000000 +0100
@@ -74,11 +74,10 @@ static int add_one_buffer(void)
 	if (ft_nr_buffers >= FT_MAX_NR_BUFFERS) {
 		TRACE_EXIT -ENOMEM;
 	}
-	ft_buffer[ft_nr_buffers] = kmalloc(sizeof(buffer_struct), GFP_KERNEL);
+	ft_buffer[ft_nr_buffers] = kzalloc(sizeof(buffer_struct), GFP_KERNEL);
 	if (ft_buffer[ft_nr_buffers] == NULL) {
 		TRACE_EXIT -ENOMEM;
 	}
-	memset(ft_buffer[ft_nr_buffers], 0, sizeof(buffer_struct));
 	ft_buffer[ft_nr_buffers]->address = dmaalloc(FT_BUFF_SIZE);
 	if (ft_buffer[ft_nr_buffers]->address == NULL) {
 		kfree(ft_buffer[ft_nr_buffers]);
--- linux-2.6.16-rc4-mm2/drivers/char/ftape/zftape/zftape-buffers.c.orig	2006-03-01 09:04:42.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/ftape/zftape/zftape-buffers.c	2006-03-01 09:06:13.000000000 +0100
@@ -112,10 +112,9 @@ void *zft_kmalloc(size_t size)
 {
 	void *new;
 
-	while ((new = kmalloc(size, GFP_KERNEL)) == NULL) {
+	while ((new = kzalloc(size, GFP_KERNEL)) == NULL) {
 		msleep_interruptible(100);
 	}
-	memset(new, 0, size);
 	used_memory += size;
 	if (peak_memory < used_memory) {
 		peak_memory = used_memory;
--- linux-2.6.16-rc4-mm2/drivers/char/hvcs.c.orig	2006-03-01 09:06:27.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/hvcs.c	2006-03-01 09:06:50.000000000 +0100
@@ -623,13 +623,10 @@ static int __devinit hvcs_probe(
 		return -EFAULT;
 	}
 
-	hvcsd = kmalloc(sizeof(*hvcsd), GFP_KERNEL);
+	hvcsd = kzalloc(sizeof(*hvcsd), GFP_KERNEL);
 	if (!hvcsd)
 		return -ENODEV;
 
-	/* hvcsd->tty is zeroed out with the memset */
-	memset(hvcsd, 0x00, sizeof(*hvcsd));
-
 	spin_lock_init(&hvcsd->lock);
 	/* Automatically incs the refcount the first time */
 	kobject_init(&hvcsd->kobj);
--- linux-2.6.16-rc4-mm2/drivers/char/hvc_console.c.orig	2006-03-01 09:06:58.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/hvc_console.c	2006-03-01 09:07:07.000000000 +0100
@@ -744,12 +744,10 @@ struct hvc_struct __devinit *hvc_alloc(u
 	struct hvc_struct *hp;
 	int i;
 
-	hp = kmalloc(sizeof(*hp), GFP_KERNEL);
+	hp = kzalloc(sizeof(*hp), GFP_KERNEL);
 	if (!hp)
 		return ERR_PTR(-ENOMEM);
 
-	memset(hp, 0x00, sizeof(*hp));
-
 	hp->vtermno = vtermno;
 	hp->irq = irq;
 	hp->ops = ops;
--- linux-2.6.16-rc4-mm2/drivers/char/tty_io.c.orig	2006-03-01 09:07:21.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/tty_io.c	2006-03-01 09:10:01.000000000 +0100
@@ -158,12 +158,7 @@ static void release_mem(struct tty_struc
 
 static struct tty_struct *alloc_tty_struct(void)
 {
-	struct tty_struct *tty;
-
-	tty = kmalloc(sizeof(struct tty_struct), GFP_KERNEL);
-	if (tty)
-		memset(tty, 0, sizeof(struct tty_struct));
-	return tty;
+	return kzalloc(sizeof(struct tty_struct), GFP_KERNEL);
 }
 
 static void tty_buffer_free_all(struct tty_struct *);
@@ -1506,11 +1501,9 @@ static int init_dev(struct tty_driver *d
 	}
 
 	if (!*ltp_loc) {
-		ltp = (struct termios *) kmalloc(sizeof(struct termios),
-						 GFP_KERNEL);
+		ltp = kzalloc(sizeof(struct termios), GFP_KERNEL);
 		if (!ltp)
 			goto free_mem_out;
-		memset(ltp, 0, sizeof(struct termios));
 	}
 
 	if (driver->type == TTY_DRIVER_TYPE_PTY) {
@@ -1539,11 +1532,9 @@ static int init_dev(struct tty_driver *d
 		}
 
 		if (!*o_ltp_loc) {
-			o_ltp = (struct termios *)
-				kmalloc(sizeof(struct termios), GFP_KERNEL);
+			o_ltp = kzalloc(sizeof(struct termios), GFP_KERNEL);
 			if (!o_ltp)
 				goto free_mem_out;
-			memset(o_ltp, 0, sizeof(struct termios));
 		}
 
 		/*
@@ -2997,9 +2988,8 @@ struct tty_driver *alloc_tty_driver(int 
 {
 	struct tty_driver *driver;
 
-	driver = kmalloc(sizeof(struct tty_driver), GFP_KERNEL);
+	driver = kzalloc(sizeof(struct tty_driver), GFP_KERNEL);
 	if (driver) {
-		memset(driver, 0, sizeof(struct tty_driver));
 		driver->magic = TTY_DRIVER_MAGIC;
 		driver->num = lines;
 		/* later we'll move allocation of tables here */
@@ -3058,10 +3048,9 @@ int tty_register_driver(struct tty_drive
 		return 0;
 
 	if (!(driver->flags & TTY_DRIVER_DEVPTS_MEM)) {
-		p = kmalloc(driver->num * 3 * sizeof(void *), GFP_KERNEL);
+		p = kcalloc(driver->num, 3 * sizeof(void *), GFP_KERNEL);
 		if (!p)
 			return -ENOMEM;
-		memset(p, 0, driver->num * 3 * sizeof(void *));
 	}
 
 	if (!driver->major) {
--- linux-2.6.16-rc4-mm2/drivers/char/ipmi/ipmi_si_intf.c.orig	2006-03-01 09:10:14.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/ipmi/ipmi_si_intf.c	2006-03-01 09:10:55.000000000 +0100
@@ -1242,12 +1242,11 @@ static int try_init_port(int intf_num, s
 			      ports[intf_num]))
 		return -ENODEV;
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (! info) {
 		printk(KERN_ERR "ipmi_si: Could not allocate SI data (1)\n");
 		return -ENOMEM;
 	}
-	memset(info, 0, sizeof(*info));
 
 	info->io_setup = port_setup;
 	info->io.info = &(ports[intf_num]);
@@ -1403,12 +1402,11 @@ static int try_init_mem(int intf_num, st
 			      addrs[intf_num]))
 		return -ENODEV;
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (! info) {
 		printk(KERN_ERR "ipmi_si: Could not allocate SI data (2)\n");
 		return -ENOMEM;
 	}
-	memset(info, 0, sizeof(*info));
 
 	info->io_setup = mem_setup;
 	info->io.info = &addrs[intf_num];
@@ -1602,12 +1600,11 @@ static int try_init_acpi(int intf_num, s
 		return -EIO;
 	}
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (! info) {
 		printk(KERN_ERR "ipmi_si: Could not allocate SI data (3)\n");
 		return -ENOMEM;
 	}
-	memset(info, 0, sizeof(*info));
 
 	if (spmi->InterruptType & 1) {
 		/* We've got a GPE interrupt. */
@@ -1780,12 +1777,11 @@ static int try_init_smbios(int intf_num,
 			return -EIO;
 	}
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (! info) {
 		printk(KERN_ERR "ipmi_si: Could not allocate SI data (4)\n");
 		return -ENOMEM;
 	}
-	memset(info, 0, sizeof(*info));
 
 	if (ipmi_data->addr_space == 1) {
 		io_type = "memory";
@@ -1886,13 +1882,12 @@ static int find_pci_smic(int intf_num, s
 		return -ENODEV;
 	}
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (! info) {
 		pci_dev_put(pci_dev);
 		printk(KERN_ERR "ipmi_si: Could not allocate SI data (5)\n");
 		return -ENOMEM;
 	}
-	memset(info, 0, sizeof(*info));
 
 	info->io_setup = port_setup;
 	ports[intf_num] = base_addr;
--- linux-2.6.16-rc4-mm2/drivers/char/ipmi/ipmi_msghandler.c.orig	2006-03-01 09:11:05.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/ipmi/ipmi_msghandler.c	2006-03-01 09:11:14.000000000 +0100
@@ -1825,10 +1825,9 @@ int ipmi_register_smi(struct ipmi_smi_ha
 			return -ENODEV;
 	}
 
-	intf = kmalloc(sizeof(*intf), GFP_KERNEL);
+	intf = kzalloc(sizeof(*intf), GFP_KERNEL);
 	if (!intf)
 		return -ENOMEM;
-	memset(intf, 0, sizeof(*intf));
 	intf->intf_num = -1;
 	kref_init(&intf->refcount);
 	intf->version_major = version_major;
--- linux-2.6.16-rc4-mm2/drivers/char/amiserial.c.orig	2006-03-01 09:11:25.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/amiserial.c	2006-03-01 09:11:38.000000000 +0100
@@ -1742,12 +1742,11 @@ static int get_async_struct(int line, st
 		*ret_info = sstate->info;
 		return 0;
 	}
-	info = kmalloc(sizeof(struct async_struct), GFP_KERNEL);
+	info = kzalloc(sizeof(struct async_struct), GFP_KERNEL);
 	if (!info) {
 		sstate->count--;
 		return -ENOMEM;
 	}
-	memset(info, 0, sizeof(struct async_struct));
 #ifdef DECLARE_WAITQUEUE
 	init_waitqueue_head(&info->open_wait);
 	init_waitqueue_head(&info->close_wait);
--- linux-2.6.16-rc4-mm2/drivers/char/random.c.orig	2006-03-01 09:11:45.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/random.c	2006-03-01 09:13:21.000000000 +0100
@@ -912,11 +912,9 @@ void rand_initialize_irq(int irq)
 	 * If kmalloc returns null, we just won't use that entropy
 	 * source.
 	 */
-	state = kmalloc(sizeof(struct timer_rand_state), GFP_KERNEL);
-	if (state) {
-		memset(state, 0, sizeof(struct timer_rand_state));
+	state = kzalloc(sizeof(struct timer_rand_state), GFP_KERNEL);
+	if (state)
 		irq_timer_state[irq] = state;
-	}
 }
 
 void rand_initialize_disk(struct gendisk *disk)
@@ -927,11 +925,9 @@ void rand_initialize_disk(struct gendisk
 	 * If kmalloc returns null, we just won't use that entropy
 	 * source.
 	 */
-	state = kmalloc(sizeof(struct timer_rand_state), GFP_KERNEL);
-	if (state) {
-		memset(state, 0, sizeof(struct timer_rand_state));
+	state = kzalloc(sizeof(struct timer_rand_state), GFP_KERNEL);
+	if (state)
 		disk->random = state;
-	}
 }
 
 static ssize_t
--- linux-2.6.16-rc4-mm2/drivers/char/consolemap.c.orig	2006-03-01 09:13:30.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/consolemap.c	2006-03-01 09:14:41.000000000 +0100
@@ -193,11 +193,10 @@ static void set_inverse_transl(struct vc
 	q = p->inverse_translations[i];
 
 	if (!q) {
-		q = p->inverse_translations[i] = (unsigned char *) 
-			kmalloc(MAX_GLYPH, GFP_KERNEL);
+		q = p->inverse_translations[i] =
+			kzalloc(MAX_GLYPH, GFP_KERNEL);
 		if (!q) return;
 	}
-	memset(q, 0, MAX_GLYPH);
 
 	for (j = 0; j < E_TABSZ; j++) {
 		glyph = conv_uni_to_pc(conp, t[j]);
@@ -444,12 +443,11 @@ int con_clear_unimap(struct vc_data *vc,
 	p = (struct uni_pagedir *)*vc->vc_uni_pagedir_loc;
 	if (p && p->readonly) return -EIO;
 	if (!p || --p->refcount) {
-		q = (struct uni_pagedir *)kmalloc(sizeof(*p), GFP_KERNEL);
+		q = kzalloc(sizeof(*p), GFP_KERNEL);
 		if (!q) {
 			if (p) p->refcount++;
 			return -ENOMEM;
 		}
-		memset(q, 0, sizeof(*q));
 		q->refcount=1;
 		*vc->vc_uni_pagedir_loc = (unsigned long)q;
 	} else {
--- linux-2.6.16-rc4-mm2/drivers/char/rio/rio_linux.c.orig	2006-03-01 09:54:52.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/rio/rio_linux.c	2006-03-01 09:55:53.000000000 +0100
@@ -844,19 +844,6 @@ static int rio_init_drivers(void)
 	return 1;
 }
 
-
-static void *ckmalloc(int size)
-{
-	void *p;
-
-	p = kmalloc(size, GFP_KERNEL);
-	if (p)
-		memset(p, 0, size);
-	return p;
-}
-
-
-
 static int rio_init_datastructures(void)
 {
 	int i;
@@ -875,18 +862,18 @@ static int rio_init_datastructures(void)
 #define TMIO_SZ sizeof(struct termios *)
 	rio_dprintk(RIO_DEBUG_INIT, "getting : %d %d %d %d %d bytes\n", RI_SZ, RIO_HOSTS * HOST_SZ, RIO_PORTS * PORT_SZ, RIO_PORTS * TMIO_SZ, RIO_PORTS * TMIO_SZ);
 
-	if (!(p = ckmalloc(RI_SZ)))
+	if (!(p = kzalloc(RI_SZ, GFP_KERNEL)))
 		goto free0;
-	if (!(p->RIOHosts = ckmalloc(RIO_HOSTS * HOST_SZ)))
+	if (!(p->RIOHosts = kzalloc(RIO_HOSTS * HOST_SZ, GFP_KERNEL)))
 		goto free1;
-	if (!(p->RIOPortp = ckmalloc(RIO_PORTS * PORT_SZ)))
+	if (!(p->RIOPortp = kzalloc(RIO_PORTS * PORT_SZ, GFP_KERNEL)))
 		goto free2;
 	p->RIOConf = RIOConf;
 	rio_dprintk(RIO_DEBUG_INIT, "Got : %p %p %p\n", p, p->RIOHosts, p->RIOPortp);
 
 #if 1
 	for (i = 0; i < RIO_PORTS; i++) {
-		port = p->RIOPortp[i] = ckmalloc(sizeof(struct Port));
+		port = p->RIOPortp[i] = kzalloc(sizeof(struct Port), GFP_KERNEL);
 		if (!port) {
 			goto free6;
 		}
--- linux-2.6.16-rc4-mm2/drivers/char/watchdog/pcwd_usb.c.orig	2006-03-01 09:17:03.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/watchdog/pcwd_usb.c	2006-03-01 09:17:34.000000000 +0100
@@ -597,12 +597,11 @@ static int usb_pcwd_probe(struct usb_int
 	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
 
 	/* allocate memory for our device and initialize it */
-	usb_pcwd = kmalloc (sizeof(struct usb_pcwd_private), GFP_KERNEL);
+	usb_pcwd = kzalloc(sizeof(struct usb_pcwd_private), GFP_KERNEL);
 	if (usb_pcwd == NULL) {
 		printk(KERN_ERR PFX "Out of memory\n");
 		goto error;
 	}
-	memset (usb_pcwd, 0x00, sizeof (*usb_pcwd));
 
 	usb_pcwd_device = usb_pcwd;
 
--- linux-2.6.16-rc4-mm2/drivers/char/watchdog/mpcore_wdt.c.orig	2006-03-01 09:17:46.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/watchdog/mpcore_wdt.c	2006-03-01 09:17:55.000000000 +0100
@@ -329,12 +329,11 @@ static int __devinit mpcore_wdt_probe(st
 		goto err_out;
 	}
 
-	wdt = kmalloc(sizeof(struct mpcore_wdt), GFP_KERNEL);
+	wdt = kzalloc(sizeof(struct mpcore_wdt), GFP_KERNEL);
 	if (!wdt) {
 		ret = -ENOMEM;
 		goto err_out;
 	}
-	memset(wdt, 0, sizeof(struct mpcore_wdt));
 
 	wdt->dev = &dev->dev;
 	wdt->irq = platform_get_irq(dev, 0);
--- linux-2.6.16-rc4-mm2/drivers/char/rocket.c.orig	2006-03-01 09:18:04.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/rocket.c	2006-03-01 09:18:27.000000000 +0100
@@ -654,12 +654,11 @@ static void init_r_port(int board, int a
 	ctlp = sCtlNumToCtlPtr(board);
 
 	/*  Get a r_port struct for the port, fill it in and save it globally, indexed by line number */
-	info = kmalloc(sizeof (struct r_port), GFP_KERNEL);
+	info = kzalloc(sizeof(struct r_port), GFP_KERNEL);
 	if (!info) {
 		printk(KERN_INFO "Couldn't allocate info struct for line #%d\n", line);
 		return;
 	}
-	memset(info, 0, sizeof (struct r_port));
 
 	info->magic = RPORT_MAGIC;
 	info->line = line;
--- linux-2.6.16-rc4-mm2/drivers/char/n_hdlc.c.orig	2006-03-01 09:18:41.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/n_hdlc.c	2006-03-01 09:18:55.000000000 +0100
@@ -802,13 +802,11 @@ static struct n_hdlc *n_hdlc_alloc(void)
 {
 	struct n_hdlc_buf *buf;
 	int i;
-	struct n_hdlc *n_hdlc = kmalloc(sizeof(*n_hdlc), GFP_KERNEL);
+	struct n_hdlc *n_hdlc = kzalloc(sizeof(*n_hdlc), GFP_KERNEL);
 
 	if (!n_hdlc)
 		return NULL;
 
-	memset(n_hdlc, 0, sizeof(*n_hdlc));
-
 	n_hdlc_buf_list_init(&n_hdlc->rx_free_buf_list);
 	n_hdlc_buf_list_init(&n_hdlc->tx_free_buf_list);
 	n_hdlc_buf_list_init(&n_hdlc->rx_buf_list);
--- linux-2.6.16-rc4-mm2/drivers/char/keyboard.c.orig	2006-03-01 09:19:17.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/keyboard.c	2006-03-01 09:19:29.000000000 +0100
@@ -1193,9 +1193,8 @@ static struct input_handle *kbd_connect(
 	if (i == BTN_MISC && !test_bit(EV_SND, dev->evbit))
 		return NULL;
 
-	if (!(handle = kmalloc(sizeof(struct input_handle), GFP_KERNEL)))
+	if (!(handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL)))
 		return NULL;
-	memset(handle, 0, sizeof(struct input_handle));
 
 	handle->dev = dev;
 	handle->handler = handler;
--- linux-2.6.16-rc4-mm2/drivers/char/ip2main.c.orig	2006-03-01 09:19:40.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/ip2main.c	2006-03-01 09:19:58.000000000 +0100
@@ -648,10 +648,9 @@ ip2_loadmain(int *iop, int *irqp, unsign
 	}	/* for */
 	for ( i = 0; i < IP2_MAX_BOARDS; ++i ) {
 		if ( ip2config.addr[i] ) {
-			pB = kmalloc( sizeof(i2eBordStr), GFP_KERNEL);
+			pB = kzalloc(sizeof(i2eBordStr), GFP_KERNEL);
 			if ( pB != NULL ) {
 				i2BoardPtrTable[i] = pB;
-				memset( pB, 0, sizeof(i2eBordStr) );
 				iiSetAddress( pB, ip2config.addr[i], ii2DelayTimer );
 				iiReset( pB );
 			} else {
--- linux-2.6.16-rc4-mm2/drivers/char/vt.c.orig	2006-03-01 09:20:07.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/vt.c	2006-03-01 09:20:21.000000000 +0100
@@ -709,10 +709,9 @@ int vc_allocate(unsigned int currcons)	/
 	    /* although the numbers above are not valid since long ago, the
 	       point is still up-to-date and the comment still has its value
 	       even if only as a historical artifact.  --mj, July 1998 */
-	    vc = kmalloc(sizeof(struct vc_data), GFP_KERNEL);
+	    vc = kzalloc(sizeof(struct vc_data), GFP_KERNEL);
 	    if (!vc)
 		return -ENOMEM;
-	    memset(vc, 0, sizeof(*vc));
 	    vc_cons[currcons].d = vc;
 	    visual_init(vc, currcons, 1);
 	    if (!*vc->vc_uni_pagedir_loc)
--- linux-2.6.16-rc4-mm2/drivers/char/sx.c.orig	2006-03-01 09:20:28.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/sx.c	2006-03-01 09:21:57.000000000 +0100
@@ -2274,18 +2274,6 @@ static int sx_init_drivers(void)
 	return 0;
 }
 
-
-static void * ckmalloc (int size)
-{
-	void *p;
-
-	p = kmalloc(size, GFP_KERNEL);
-	if (p) 
-		memset(p, 0, size);
-	return p;
-}
-
-
 static int sx_init_portstructs (int nboards, int nports)
 {
 	struct sx_board *board;
@@ -2298,7 +2286,7 @@ static int sx_init_portstructs (int nboa
 
 	/* Many drivers statically allocate the maximum number of ports
 	   There is no reason not to allocate them dynamically. Is there? -- REW */
-	sx_ports          = ckmalloc(nports * sizeof (struct sx_port));
+	sx_ports          = kcalloc(nports, sizeof(struct sx_port), GFP_KERNEL);
 	if (!sx_ports)
 		return -ENOMEM;
 
--- linux-2.6.16-rc4-mm2/drivers/char/synclink.c.orig	2006-03-01 09:22:09.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/synclink.c	2006-03-01 09:22:48.000000000 +0100
@@ -4352,13 +4352,11 @@ static struct mgsl_struct* mgsl_allocate
 {
 	struct mgsl_struct *info;
 	
-	info = (struct mgsl_struct *)kmalloc(sizeof(struct mgsl_struct),
-		 GFP_KERNEL);
+	info = kzalloc(sizeof(struct mgsl_struct), GFP_KERNEL);
 		 
 	if (!info) {
 		printk("Error can't allocate device instance data\n");
 	} else {
-		memset(info, 0, sizeof(struct mgsl_struct));
 		info->magic = MGSL_MAGIC;
 		INIT_WORK(&info->task, mgsl_bh_handler, info);
 		info->max_frame_size = 4096;
--- linux-2.6.16-rc4-mm2/drivers/char/drm/ffb_drv.c.orig	2006-03-01 09:23:02.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/drm/ffb_drv.c	2006-03-01 09:23:14.000000000 +0100
@@ -219,10 +219,9 @@ static int ffb_presetup(drm_device_t * d
 		return -ENODEV;
 
 	/* code used to use numdevs no numdevs anymore */
-	ffb_priv = kmalloc(sizeof(ffb_dev_priv_t), GFP_KERNEL);
+	ffb_priv = kzalloc(sizeof(ffb_dev_priv_t), GFP_KERNEL);
 	if (!ffb_priv)
 		return -ENOMEM;
-	memset(ffb_priv, 0, sizeof(*ffb_priv));
 	dev->dev_private = ffb_priv;
 
 	ret = ffb_init_one(dev, ffb_position[i].node, ffb_position[i].root, i);
--- linux-2.6.16-rc4-mm2/drivers/char/drm/via_dmablit.c.orig	2006-03-01 09:23:33.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/char/drm/via_dmablit.c	2006-03-01 09:24:35.000000000 +0100
@@ -268,10 +268,10 @@ via_alloc_desc_pages(drm_via_sg_info_t *
 	vsg->num_desc_pages = (vsg->num_desc + vsg->descriptors_per_page - 1) / 
 		vsg->descriptors_per_page;
 
-	if (NULL ==  (vsg->desc_pages = kmalloc(sizeof(void *) * vsg->num_desc_pages, GFP_KERNEL))) 
+	if (NULL ==  (vsg->desc_pages = kcalloc(vsg->num_desc_pages,
+					sizeof(void *), GFP_KERNEL))) 
 		return DRM_ERR(ENOMEM);
 	
-	memset(vsg->desc_pages, 0, sizeof(void *) * vsg->num_desc_pages);
 	vsg->state = dr_via_desc_pages_alloc;
 	for (i=0; i<vsg->num_desc_pages; ++i) {
 		if (NULL == (vsg->desc_pages[i] = 



--===============55565051894156037==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55565051894156037==--
