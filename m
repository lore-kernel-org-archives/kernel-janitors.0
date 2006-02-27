From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 27 Feb 2006 16:22:24 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/usb
Message-Id: <1141057344.30572.6.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50653246624246395=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============50653246624246395==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/usb to kzalloc usage.
Compile tested with allyes config.

This also fixes a bug in drivers/usb/serial/cp2101.c
where memset() was used before checking if kmalloc() returns NULL.

I think there also was a bug in drivers/usb/gadget/inode.c because
it used sizeof(*data) for the kmalloc() and sizeof(data) for
the memset(), since sizeof(data) just returns the size for a pointer.

I assume there is also a bug in drivers/usb/gadget/omap_udc.c
in omap_alloc_request(), req gets allocated via kmalloc() and
the function returns &req->req, no matter if req is NULL, which
looks like a NULL dereference to me, maybe someone who is more familar
with this code might have a look at it.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/drivers/usb/net/zd1201.c.orig	2006-02-27 16:26:16.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/net/zd1201.c	2006-02-27 16:26:47.000000000 +0100
@@ -621,10 +621,9 @@ static int zd1201_drvr_start(struct zd12
 	__le16 zdmax;
 	unsigned char *buffer;
 	
-	buffer = kmalloc(ZD1201_RXSIZE, GFP_KERNEL);
+	buffer = kzalloc(ZD1201_RXSIZE, GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
-	memset(buffer, 0, ZD1201_RXSIZE);
 
 	usb_fill_bulk_urb(zd->rx_urb, zd->usb, 
 	    usb_rcvbulkpipe(zd->usb, zd->endp_in), buffer, ZD1201_RXSIZE,
@@ -1750,11 +1749,9 @@ static int zd1201_probe(struct usb_inter
 
 	usb = interface_to_usbdev(interface);
 
-	zd = kmalloc(sizeof(struct zd1201), GFP_KERNEL);
-	if (!zd) {
+	zd = kzalloc(sizeof(struct zd1201), GFP_KERNEL);
+	if (!zd)
 		return -ENOMEM;
-	}
-	memset(zd, 0, sizeof(struct zd1201));
 	zd->ap = ap;
 	zd->usb = usb;
 	zd->removed = 0;
--- linux-2.6.16-rc4/drivers/usb/class/usb-midi.c.orig	2006-02-27 16:27:26.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/class/usb-midi.c	2006-02-27 16:28:15.000000000 +0100
@@ -995,12 +995,11 @@ static struct midi_in_endpoint *alloc_mi
 	bufSize = usb_maxpacket( d, pipe, 0 );
 	/* usb_pipein() = ! usb_pipeout() = true for an in Endpoint */
 
-	ep = (struct midi_in_endpoint *)kmalloc(sizeof(struct midi_in_endpoint), GFP_KERNEL);
+	ep = kzalloc(sizeof(struct midi_in_endpoint), GFP_KERNEL);
 	if ( !ep ) {
 		printk(KERN_ERR "usbmidi: no memory for midi in-endpoint\n");
 		return NULL;
 	}
-	memset( ep, 0, sizeof(struct midi_in_endpoint) );
 //      this sets cables[] and readers to 0, too.
 //      for (i=0; i<16; i++) ep->cables[i] = 0; // discard cable
 //      ep->readers = 0;
@@ -1065,12 +1064,11 @@ static struct midi_out_endpoint *alloc_m
 	pipe =  usb_sndbulkpipe( d, endPoint );
 	bufSize = usb_maxpacket( d, pipe, 1 );
 
-	ep = (struct midi_out_endpoint *)kmalloc(sizeof(struct midi_out_endpoint), GFP_KERNEL);
+	ep = kzalloc(sizeof(struct midi_out_endpoint), GFP_KERNEL);
 	if ( !ep ) {
 		printk(KERN_ERR "usbmidi: no memory for midi out-endpoint\n");
 		return NULL;
 	}
-	memset( ep, 0, sizeof(struct midi_out_endpoint) );
 
 	ep->endpoint = endPoint;
 	ep->buf = (unsigned char *)kmalloc(sizeof(unsigned char)*bufSize, GFP_KERNEL);
@@ -1958,11 +1956,10 @@ static int usb_midi_probe(struct usb_int
 	struct usb_device *dev = interface_to_usbdev(intf);
 	int ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
 
-	s = (struct usb_midi_state *)kmalloc(sizeof(struct usb_midi_state), GFP_KERNEL);
+	s = kzalloc(sizeof(struct usb_midi_state), GFP_KERNEL);
 	if ( !s )
 		return -ENOMEM;
 
-	memset( s, 0, sizeof(struct usb_midi_state) );
 	INIT_LIST_HEAD(&s->midiDevList);
 	INIT_LIST_HEAD(&s->inEndpointList);
 	INIT_LIST_HEAD(&s->outEndpointList);
--- linux-2.6.16-rc4/drivers/usb/class/audio.c.orig	2006-02-27 16:28:41.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/class/audio.c	2006-02-27 16:29:24.000000000 +0100
@@ -2804,9 +2804,8 @@ static void usb_audio_parsestreaming(str
 	unsigned char *fmt, *csep;
 	unsigned int i, j, k, format, idx;
 
-	if (!(as = kmalloc(sizeof(struct usb_audiodev), GFP_KERNEL)))
+	if (!(as = kzalloc(sizeof(struct usb_audiodev), GFP_KERNEL)))
 		return;
-	memset(as, 0, sizeof(struct usb_audiodev));
 	init_waitqueue_head(&as->usbin.dma.wait);
 	init_waitqueue_head(&as->usbout.dma.wait);
 	spin_lock_init(&as->lock);
@@ -3646,9 +3645,8 @@ static struct usb_audio_state *usb_audio
 	unsigned char *p1;
 	unsigned int i, j, k, numifin = 0, numifout = 0;
 	
-	if (!(s = kmalloc(sizeof(struct usb_audio_state), GFP_KERNEL)))
+	if (!(s = kzalloc(sizeof(struct usb_audio_state), GFP_KERNEL)))
 		return NULL;
-	memset(s, 0, sizeof(struct usb_audio_state));
 	INIT_LIST_HEAD(&s->audiolist);
 	INIT_LIST_HEAD(&s->mixerlist);
 	s->usbdev = dev;
--- linux-2.6.16-rc4/drivers/usb/media/pwc/pwc-if.c.orig	2006-02-27 16:29:40.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/media/pwc/pwc-if.c	2006-02-27 16:29:52.000000000 +0100
@@ -1871,12 +1871,11 @@ static int usb_pwc_probe(struct usb_inte
 		Info("Warning: more than 1 configuration available.\n");
 
 	/* Allocate structure, initialize pointers, mutexes, etc. and link it to the usb_device */
-	pdev = kmalloc(sizeof(struct pwc_device), GFP_KERNEL);
+	pdev = kzalloc(sizeof(struct pwc_device), GFP_KERNEL);
 	if (pdev == NULL) {
 		Err("Oops, could not allocate memory for pwc_device.\n");
 		return -ENOMEM;
 	}
-	memset(pdev, 0, sizeof(struct pwc_device));
 	pdev->type = type_id;
 	pdev->vsize = default_size;
 	pdev->vframes = default_fps;
--- linux-2.6.16-rc4/drivers/usb/media/w9968cf.c.orig	2006-02-27 16:30:29.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/media/w9968cf.c	2006-02-27 16:31:03.000000000 +0100
@@ -3532,21 +3532,19 @@ w9968cf_usb_probe(struct usb_interface* 
 

 	/* Allocate 2 bytes of memory for camera control USB transfers */
-	if (!(cam->control_buffer = kmalloc(2, GFP_KERNEL))) {
+	if (!(cam->control_buffer = kzalloc(2, GFP_KERNEL))) {
 		DBG(1,"Couldn't allocate memory for camera control transfers")
 		err = -ENOMEM;
 		goto fail;
 	}
-	memset(cam->control_buffer, 0, 2);
 
 	/* Allocate 8 bytes of memory for USB data transfers to the FSB */
-	if (!(cam->data_buffer = kmalloc(8, GFP_KERNEL))) {
+	if (!(cam->data_buffer = kzalloc(8, GFP_KERNEL))) {
 		DBG(1, "Couldn't allocate memory for data "
 		       "transfers to the FSB")
 		err = -ENOMEM;
 		goto fail;
 	}
-	memset(cam->data_buffer, 0, 8);
 
 	/* Register the V4L device */
 	cam->v4ldev = video_device_alloc();
--- linux-2.6.16-rc4/drivers/usb/media/dabusb.c.orig	2006-02-27 16:31:11.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/media/dabusb.c	2006-02-27 16:31:33.000000000 +0100
@@ -217,12 +217,11 @@ static int dabusb_alloc_buffers (pdabusb
 		 pipesize, packets, transfer_buffer_length);
 
 	while (buffers < (s->total_buffer_size << 10)) {
-		b = (pbuff_t) kmalloc (sizeof (buff_t), GFP_KERNEL);
+		b = kzalloc(sizeof (buff_t), GFP_KERNEL);
 		if (!b) {
 			err("kmalloc(sizeof(buff_t))==NULL");
 			goto err;
 		}
-		memset (b, 0, sizeof (buff_t));
 		b->s = s;
 		b->purb = usb_alloc_urb(packets, GFP_KERNEL);
 		if (!b->purb) {
--- linux-2.6.16-rc4/drivers/usb/media/se401.c.orig	2006-02-27 16:31:40.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/media/se401.c	2006-02-27 16:31:57.000000000 +0100
@@ -1345,13 +1345,11 @@ static int se401_probe(struct usb_interf
         /* We found one */
         info("SE401 camera found: %s", camera_name);
 
-        if ((se401 = kmalloc(sizeof(*se401), GFP_KERNEL)) == NULL) {
+        if ((se401 = kzalloc(sizeof(*se401), GFP_KERNEL)) == NULL) {
                 err("couldn't kmalloc se401 struct");
 		return -ENOMEM;
         }
 
-        memset(se401, 0, sizeof(*se401));
-
         se401->dev = dev;
         se401->iface = interface->bInterfaceNumber;
         se401->camera_name = camera_name;
--- linux-2.6.16-rc4/drivers/usb/media/ov511.c.orig	2006-02-27 16:32:05.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/media/ov511.c	2006-02-27 16:32:57.000000000 +0100
@@ -5686,13 +5686,11 @@ ov51x_probe(struct usb_interface *intf, 
 	if (idesc->bInterfaceSubClass != 0x00)
 		return -ENODEV;
 
-	if ((ov = kmalloc(sizeof(*ov), GFP_KERNEL)) == NULL) {
+	if ((ov = kzalloc(sizeof(*ov), GFP_KERNEL)) == NULL) {
 		err("couldn't kmalloc ov struct");
 		goto error_out;
 	}
 
-	memset(ov, 0, sizeof(*ov));
-
 	ov->dev = dev;
 	ov->iface = idesc->bInterfaceNumber;
 	ov->led_policy = led;
--- linux-2.6.16-rc4/drivers/usb/media/stv680.c.orig	2006-02-27 16:33:05.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/media/stv680.c	2006-02-27 16:33:34.000000000 +0100
@@ -317,12 +317,11 @@ static int stv_init (struct usb_stv *stv
 	unsigned char *buffer;
 	unsigned long int bufsize;
 
-	buffer = kmalloc (40, GFP_KERNEL);
+	buffer = kzalloc (40, GFP_KERNEL);
 	if (buffer == NULL) {
 		PDEBUG (0, "STV(e): Out of (small buf) memory");
 		return -1;
 	}
-	memset (buffer, 0, 40);
 	udelay (100);
 
 	/* set config 1, interface 0, alternate 0 */
@@ -1387,14 +1386,12 @@ static int stv680_probe (struct usb_inte
 		goto error;
 	}
 	/* We found one */
-	if ((stv680 = kmalloc (sizeof (*stv680), GFP_KERNEL)) == NULL) {
+	if ((stv680 = kzalloc (sizeof (*stv680), GFP_KERNEL)) == NULL) {
 		PDEBUG (0, "STV(e): couldn't kmalloc stv680 struct.");
 		retval = -ENOMEM;
 		goto error;
 	}
 
-	memset (stv680, 0, sizeof (*stv680));
-
 	stv680->udev = dev;
 	stv680->camera_name = camera_name;
 
--- linux-2.6.16-rc4/drivers/usb/image/mdc800.c.orig	2006-02-27 16:33:50.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/image/mdc800.c	2006-02-27 16:34:13.000000000 +0100
@@ -978,11 +978,10 @@ static int __init usb_mdc800_init (void)
 {
 	int retval = -ENODEV;
 	/* Allocate Memory */
-	mdc800=kmalloc (sizeof (struct mdc800_data), GFP_KERNEL);
+	mdc800 = kzalloc(sizeof(struct mdc800_data), GFP_KERNEL);
 	if (!mdc800)
 		goto cleanup_on_fail;
 
-	memset(mdc800, 0, sizeof(struct mdc800_data));
 	mdc800->dev = NULL;
 	mdc800->open=0;
 	mdc800->state=NOT_CONNECTED;
--- linux-2.6.16-rc4/drivers/usb/serial/visor.c.orig	2006-02-27 16:34:21.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/visor.c	2006-02-27 16:34:30.000000000 +0100
@@ -760,10 +760,9 @@ static int generic_startup(struct usb_se
 	int i;
 
 	for (i = 0; i < serial->num_ports; ++i) {
-		priv = kmalloc (sizeof(*priv), GFP_KERNEL);
+		priv = kzalloc (sizeof(*priv), GFP_KERNEL);
 		if (!priv)
 			return -ENOMEM;
-		memset (priv, 0x00, sizeof(*priv));
 		spin_lock_init(&priv->lock);
 		usb_set_serial_port_data(serial->port[i], priv);
 	}
--- linux-2.6.16-rc4/drivers/usb/serial/io_ti.c.orig	2006-02-27 16:34:38.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/io_ti.c	2006-02-27 16:35:24.000000000 +0100
@@ -2727,12 +2727,11 @@ static int edge_startup (struct usb_seri
 	dev = serial->dev;
 
 	/* create our private serial structure */
-	edge_serial = kmalloc (sizeof(struct edgeport_serial), GFP_KERNEL);
+	edge_serial = kzalloc(sizeof(struct edgeport_serial), GFP_KERNEL);
 	if (edge_serial == NULL) {
 		dev_err(&serial->dev->dev, "%s - Out of memory\n", __FUNCTION__);
 		return -ENOMEM;
 	}
-	memset (edge_serial, 0, sizeof(struct edgeport_serial));
 	sema_init(&edge_serial->es_sem, 1);
 	edge_serial->serial = serial;
 	usb_set_serial_data(serial, edge_serial);
@@ -2745,12 +2744,11 @@ static int edge_startup (struct usb_seri
 
 	/* set up our port private structures */
 	for (i = 0; i < serial->num_ports; ++i) {
-		edge_port = kmalloc (sizeof(struct edgeport_port), GFP_KERNEL);
+		edge_port = kzalloc(sizeof(struct edgeport_port), GFP_KERNEL);
 		if (edge_port == NULL) {
 			dev_err(&serial->dev->dev, "%s - Out of memory\n", __FUNCTION__);
 			goto cleanup;
 		}
-		memset (edge_port, 0, sizeof(struct edgeport_port));
 		spin_lock_init(&edge_port->ep_lock);
 		edge_port->ep_out_buf = edge_buf_alloc(EDGE_OUT_BUF_SIZE);
 		if (edge_port->ep_out_buf == NULL) {
--- linux-2.6.16-rc4/drivers/usb/serial/option.c.orig	2006-02-27 16:35:30.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/option.c	2006-02-27 16:35:51.000000000 +0100
@@ -631,13 +631,12 @@ static int option_startup(struct usb_ser
 	/* Now setup per port private data */
 	for (i = 0; i < serial->num_ports; i++) {
 		port = serial->port[i];
-		portdata = kmalloc(sizeof(*portdata), GFP_KERNEL);
+		portdata = kzalloc(sizeof(*portdata), GFP_KERNEL);
 		if (!portdata) {
 			dbg("%s: kmalloc for option_port_private (%d) failed!.",
 					__FUNCTION__, i);
 			return (1);
 		}
-		memset(portdata, 0, sizeof(struct option_port_private));
 
 		usb_set_serial_port_data(port, portdata);
 
--- linux-2.6.16-rc4/drivers/usb/serial/cp2101.c.orig	2006-02-27 16:36:00.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/cp2101.c	2006-02-27 16:36:31.000000000 +0100
@@ -169,9 +169,7 @@ static int cp2101_get_config(struct usb_
 	/* Number of integers required to contain the array */
 	length = (((size - 1) | 3) + 1)/4;
 
-	buf = kmalloc (length * sizeof(u32), GFP_KERNEL);
-	memset(buf, 0, length * sizeof(u32));
-
+	buf = kcalloc(length, sizeof(u32), GFP_KERNEL);
 	if (!buf) {
 		dev_err(&port->dev, "%s - out of memory.\n", __FUNCTION__);
 		return -ENOMEM;
--- linux-2.6.16-rc4/drivers/usb/serial/ti_usb_3410_5052.c.orig	2006-02-27 16:36:59.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/ti_usb_3410_5052.c	2006-02-27 16:37:08.000000000 +0100
@@ -416,12 +416,11 @@ static int ti_startup(struct usb_serial 
 	    dev->actconfig->desc.bConfigurationValue);
 
 	/* create device structure */
-	tdev = kmalloc(sizeof(struct ti_device), GFP_KERNEL);
+	tdev = kzalloc(sizeof(struct ti_device), GFP_KERNEL);
 	if (tdev == NULL) {
 		dev_err(&dev->dev, "%s - out of memory\n", __FUNCTION__);
 		return -ENOMEM;
 	}
-	memset(tdev, 0, sizeof(struct ti_device));
 	sema_init(&tdev->td_open_close_sem, 1);
 	tdev->td_serial = serial;
 	usb_set_serial_data(serial, tdev);
--- linux-2.6.16-rc4/drivers/usb/serial/kobil_sct.c.orig	2006-02-27 16:37:16.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/kobil_sct.c	2006-02-27 16:38:43.000000000 +0100
@@ -255,11 +255,9 @@ static int kobil_open (struct usb_serial
 	}
 	
 	// allocate memory for transfer buffer
-	transfer_buffer = (unsigned char *) kmalloc(transfer_buffer_length, GFP_KERNEL);  
+	transfer_buffer = kzalloc(transfer_buffer_length, GFP_KERNEL);  
 	if (! transfer_buffer) {
 		return -ENOMEM;
-	} else {
-		memset(transfer_buffer, 0, transfer_buffer_length);
 	}
 	
 	// allocate write_urb
@@ -383,11 +381,10 @@ static void kobil_read_int_callback( str
 		
 		// BEGIN DEBUG
 		/*
-		  dbg_data = (unsigned char *) kmalloc((3 *  purb->actual_length + 10) * sizeof(char), GFP_KERNEL);
+		  dbg_data = kzalloc((3 *  purb->actual_length + 10) * sizeof(char), GFP_KERNEL);
 		  if (! dbg_data) {
 		  return;
 		  }
-		  memset(dbg_data, 0, (3 *  purb->actual_length + 10));
 		  for (i = 0; i < purb->actual_length; i++) { 
 		  sprintf(dbg_data +3*i, "%02X ", data[i]); 
 		  }
@@ -518,11 +515,10 @@ static int kobil_tiocmget(struct usb_ser
 	}
 
 	// allocate memory for transfer buffer
-	transfer_buffer = (unsigned char *) kmalloc(transfer_buffer_length, GFP_KERNEL);  
+	transfer_buffer = kzalloc(transfer_buffer_length, GFP_KERNEL);  
 	if (!transfer_buffer) {
 		return -ENOMEM;
 	}
-	memset(transfer_buffer, 0, transfer_buffer_length);
 
 	result = usb_control_msg( port->serial->dev, 
 				  usb_rcvctrlpipe(port->serial->dev, 0 ), 
@@ -564,11 +560,10 @@ static int  kobil_tiocmset(struct usb_se
 	}
 
 	// allocate memory for transfer buffer
-	transfer_buffer = (unsigned char *) kmalloc(transfer_buffer_length, GFP_KERNEL);
+	transfer_buffer = kzalloc(transfer_buffer_length, GFP_KERNEL);
 	if (! transfer_buffer) {
 		return -ENOMEM;
 	}
-	memset(transfer_buffer, 0, transfer_buffer_length);
 
 	if (set & TIOCM_RTS)
 		rts = 1;
@@ -655,11 +650,10 @@ static int  kobil_ioctl(struct usb_seria
 						   (struct termios __user *)arg))
 			return -EFAULT;
 		
-		settings = (unsigned char *) kmalloc(50, GFP_KERNEL);  
+		settings = kzalloc(50, GFP_KERNEL);  
 		if (! settings) {
 			return -ENOBUFS;
 		}
-		memset(settings, 0, 50);
 
 		switch (priv->internal_termios.c_cflag & CBAUD) {
 		case B1200:
--- linux-2.6.16-rc4/drivers/usb/serial/pl2303.c.orig	2006-02-27 16:38:53.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/pl2303.c	2006-02-27 16:39:21.000000000 +0100
@@ -218,10 +218,9 @@ static int pl2303_startup (struct usb_se
 	dbg("device type: %d", type);
 
 	for (i = 0; i < serial->num_ports; ++i) {
-		priv = kmalloc (sizeof (struct pl2303_private), GFP_KERNEL);
+		priv = kzalloc(sizeof(struct pl2303_private), GFP_KERNEL);
 		if (!priv)
 			goto cleanup;
-		memset (priv, 0x00, sizeof (struct pl2303_private));
 		spin_lock_init(&priv->lock);
 		priv->buf = pl2303_buf_alloc(PL2303_BUF_SIZE);
 		if (priv->buf == NULL) {
@@ -383,12 +382,11 @@ static void pl2303_set_termios (struct u
 		}
 	}
 
-	buf = kmalloc (7, GFP_KERNEL);
+	buf = kzalloc (7, GFP_KERNEL);
 	if (!buf) {
 		dev_err(&port->dev, "%s - out of memory.\n", __FUNCTION__);
 		return;
 	}
-	memset (buf, 0x00, 0x07);
 	
 	i = usb_control_msg (serial->dev, usb_rcvctrlpipe (serial->dev, 0),
 			     GET_LINE_REQUEST, GET_LINE_REQUEST_TYPE,
--- linux-2.6.16-rc4/drivers/usb/serial/keyspan.c.orig	2006-02-27 16:39:28.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/keyspan.c	2006-02-27 16:40:19.000000000 +0100
@@ -2250,12 +2250,11 @@ static int keyspan_startup (struct usb_s
 	}
 
 	/* Setup private data for serial driver */
-	s_priv = kmalloc(sizeof(struct keyspan_serial_private), GFP_KERNEL);
+	s_priv = kzalloc(sizeof(struct keyspan_serial_private), GFP_KERNEL);
 	if (!s_priv) {
 		dbg("%s - kmalloc for keyspan_serial_private failed.", __FUNCTION__);
 		return -ENOMEM;
 	}
-	memset(s_priv, 0, sizeof(struct keyspan_serial_private));
 
 	s_priv->device_details = d_details;
 	usb_set_serial_data(serial, s_priv);
@@ -2263,12 +2262,11 @@ static int keyspan_startup (struct usb_s
 	/* Now setup per port private data */
 	for (i = 0; i < serial->num_ports; i++) {
 		port = serial->port[i];
-		p_priv = kmalloc(sizeof(struct keyspan_port_private), GFP_KERNEL);
+		p_priv = kzalloc(sizeof(struct keyspan_port_private), GFP_KERNEL);
 		if (!p_priv) {
 			dbg("%s - kmalloc for keyspan_port_private (%d) failed!.", __FUNCTION__, i);
 			return (1);
 		}
-		memset(p_priv, 0, sizeof(struct keyspan_port_private));
 		p_priv->device_details = d_details;
 		usb_set_serial_port_data(port, p_priv);
 	}
--- linux-2.6.16-rc4/drivers/usb/serial/io_edgeport.c.orig	2006-02-27 16:40:33.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/io_edgeport.c	2006-02-27 16:40:49.000000000 +0100
@@ -2725,12 +2725,11 @@ static int edge_startup (struct usb_seri
 	dev = serial->dev;
 
 	/* create our private serial structure */
-	edge_serial = kmalloc (sizeof(struct edgeport_serial), GFP_KERNEL);
+	edge_serial = kzalloc(sizeof(struct edgeport_serial), GFP_KERNEL);
 	if (edge_serial == NULL) {
 		dev_err(&serial->dev->dev, "%s - Out of memory\n", __FUNCTION__);
 		return -ENOMEM;
 	}
-	memset (edge_serial, 0, sizeof(struct edgeport_serial));
 	spin_lock_init(&edge_serial->es_lock);
 	edge_serial->serial = serial;
 	usb_set_serial_data(serial, edge_serial);
--- linux-2.6.16-rc4/drivers/usb/serial/usb-serial.c.orig	2006-02-27 16:41:00.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/usb-serial.c	2006-02-27 16:41:25.000000000 +0100
@@ -564,12 +564,11 @@ static struct usb_serial * create_serial
 {
 	struct usb_serial *serial;
 
-	serial = kmalloc (sizeof (*serial), GFP_KERNEL);
+	serial = kzalloc(sizeof(*serial), GFP_KERNEL);
 	if (!serial) {
 		dev_err(&dev->dev, "%s - out of memory\n", __FUNCTION__);
 		return NULL;
 	}
-	memset (serial, 0, sizeof(*serial));
 	serial->dev = usb_get_dev(dev);
 	serial->type = driver;
 	serial->interface = interface;
@@ -778,10 +777,9 @@ int usb_serial_probe(struct usb_interfac
 	serial->num_port_pointers = max_endpoints;
 	dbg("%s - setting up %d port structures for this device", __FUNCTION__, max_endpoints);
 	for (i = 0; i < max_endpoints; ++i) {
-		port = kmalloc(sizeof(struct usb_serial_port), GFP_KERNEL);
+		port = kzalloc(sizeof(struct usb_serial_port), GFP_KERNEL);
 		if (!port)
 			goto probe_error;
-		memset(port, 0x00, sizeof(struct usb_serial_port));
 		port->number = i + serial->minor;
 		port->serial = serial;
 		spin_lock_init(&port->lock);
--- linux-2.6.16-rc4/drivers/usb/serial/cypress_m8.c.orig	2006-02-27 16:41:33.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/cypress_m8.c	2006-02-27 16:41:44.000000000 +0100
@@ -435,11 +435,10 @@ static int generic_startup (struct usb_s
 
 	dbg("%s - port %d", __FUNCTION__, serial->port[0]->number);
 
-	priv = kmalloc(sizeof (struct cypress_private), GFP_KERNEL);
+	priv = kzalloc(sizeof (struct cypress_private), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	memset(priv, 0x00, sizeof (struct cypress_private));
 	spin_lock_init(&priv->lock);
 	priv->buf = cypress_buf_alloc(CYPRESS_BUF_SIZE);
 	if (priv->buf == NULL) {
--- linux-2.6.16-rc4/drivers/usb/serial/ftdi_sio.c.orig	2006-02-27 16:41:56.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/ftdi_sio.c	2006-02-27 16:42:10.000000000 +0100
@@ -1135,12 +1135,11 @@ static int ftdi_sio_attach (struct usb_s
 	
 	dbg("%s",__FUNCTION__);
 
-	priv = kmalloc(sizeof(struct ftdi_private), GFP_KERNEL);
+	priv = kzalloc(sizeof(struct ftdi_private), GFP_KERNEL);
 	if (!priv){
 		err("%s- kmalloc(%Zd) failed.", __FUNCTION__, sizeof(struct ftdi_private));
 		return -ENOMEM;
 	}
-	memset(priv, 0, sizeof(*priv));
 
 	spin_lock_init(&priv->rx_lock);
         init_waitqueue_head(&priv->delta_msr_wait);
--- linux-2.6.16-rc4/drivers/usb/serial/mct_u232.c.orig	2006-02-27 16:42:16.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/mct_u232.c	2006-02-27 16:42:33.000000000 +0100
@@ -348,10 +348,9 @@ static int mct_u232_startup (struct usb_
 	struct mct_u232_private *priv;
 	struct usb_serial_port *port, *rport;
 
-	priv = kmalloc(sizeof(struct mct_u232_private), GFP_KERNEL);
+	priv = kzalloc(sizeof(struct mct_u232_private), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-	memset(priv, 0, sizeof(struct mct_u232_private));
 	spin_lock_init(&priv->lock);
 	usb_set_serial_port_data(serial->port[0], priv);
 
--- linux-2.6.16-rc4/drivers/usb/serial/garmin_gps.c.orig	2006-02-27 16:42:40.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/garmin_gps.c	2006-02-27 16:42:54.000000000 +0100
@@ -1422,12 +1422,11 @@ static int garmin_attach (struct usb_ser
 
 	dbg("%s", __FUNCTION__);
 
-	garmin_data_p = kmalloc (sizeof(struct garmin_data), GFP_KERNEL);
+	garmin_data_p = kzalloc(sizeof(struct garmin_data), GFP_KERNEL);
 	if (garmin_data_p == NULL) {
 		dev_err(&port->dev, "%s - Out of memory\n", __FUNCTION__);
 		return -ENOMEM;
 	}
-	memset (garmin_data_p, 0, sizeof(struct garmin_data));
 	init_timer(&garmin_data_p->timer);
 	spin_lock_init(&garmin_data_p->lock);
 	INIT_LIST_HEAD(&garmin_data_p->pktlist);
--- linux-2.6.16-rc4/drivers/usb/serial/ir-usb.c.orig	2006-02-27 16:43:04.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/serial/ir-usb.c	2006-02-27 16:43:17.000000000 +0100
@@ -184,10 +184,9 @@ static struct irda_class_desc *irda_usb_
 	struct irda_class_desc *desc;
 	int ret;
 		
-	desc = kmalloc(sizeof (struct irda_class_desc), GFP_KERNEL);
+	desc = kzalloc(sizeof (struct irda_class_desc), GFP_KERNEL);
 	if (desc == NULL) 
 		return NULL;
-	memset(desc, 0, sizeof(struct irda_class_desc));
 	
 	ret = usb_control_msg(dev, usb_rcvctrlpipe(dev,0),
 			IU_REQ_GET_CLASS_DESC,
--- linux-2.6.16-rc4/drivers/usb/host/hc_crisv10.c.orig	2006-02-27 16:45:36.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/host/hc_crisv10.c	2006-02-27 16:46:30.000000000 +0100
@@ -2137,10 +2137,9 @@ static int etrax_usb_submit_bulk_urb(str
 	urb->status = -EINPROGRESS;
 
 	/* Setup the hcpriv data. */
-	urb_priv = kmalloc(sizeof(etrax_urb_priv_t), KMALLOC_FLAG);
+	urb_priv = kzalloc(sizeof(etrax_urb_priv_t), KMALLOC_FLAG);
 	assert(urb_priv != NULL);
 	/* This sets rx_offset to 0. */
-	memset(urb_priv, 0, sizeof(etrax_urb_priv_t));
 	urb_priv->urb_state = NOT_STARTED;
 	urb->hcpriv = urb_priv;
 
@@ -2475,10 +2474,9 @@ static int etrax_usb_submit_ctrl_urb(str
 	urb->status = -EINPROGRESS;
 
 	/* Setup the hcpriv data. */
-	urb_priv = kmalloc(sizeof(etrax_urb_priv_t), KMALLOC_FLAG);
+	urb_priv = kzalloc(sizeof(etrax_urb_priv_t), KMALLOC_FLAG);
 	assert(urb_priv != NULL);
 	/* This sets rx_offset to 0. */
-	memset(urb_priv, 0, sizeof(etrax_urb_priv_t));
 	urb_priv->urb_state = NOT_STARTED;
 	urb->hcpriv = urb_priv;
 
@@ -2767,9 +2765,8 @@ static void etrax_usb_add_to_intr_sb_lis
 	maxlen = usb_maxpacket(urb->dev, urb->pipe, usb_pipeout(urb->pipe));
 	interval = urb->interval;
 
-	urb_priv = kmalloc(sizeof(etrax_urb_priv_t), KMALLOC_FLAG);
+	urb_priv = kzalloc(sizeof(etrax_urb_priv_t), KMALLOC_FLAG);
 	assert(urb_priv != NULL);
-	memset(urb_priv, 0, sizeof(etrax_urb_priv_t));
 	urb->hcpriv = urb_priv;
 
 	first_ep = &TxIntrEPList[0];
@@ -2997,9 +2994,8 @@ static void etrax_usb_add_to_isoc_sb_lis
 
 	prev_sb_desc = next_sb_desc = temp_sb_desc = NULL;
 
-	urb_priv = kmalloc(sizeof(etrax_urb_priv_t), GFP_ATOMIC);
+	urb_priv = kzalloc(sizeof(etrax_urb_priv_t), GFP_ATOMIC);
 	assert(urb_priv != NULL);
-	memset(urb_priv, 0, sizeof(etrax_urb_priv_t));
 
 	urb->hcpriv = urb_priv;
 	urb_priv->epid = epid;
--- linux-2.6.16-rc4/drivers/usb/host/sl811_cs.c.orig	2006-02-27 16:46:40.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/host/sl811_cs.c	2006-02-27 16:46:50.000000000 +0100
@@ -330,10 +330,9 @@ static int sl811_cs_attach(struct pcmcia
 	local_info_t *local;
 	dev_link_t *link;
 
-	local = kmalloc(sizeof(local_info_t), GFP_KERNEL);
+	local = kzalloc(sizeof(local_info_t), GFP_KERNEL);
 	if (!local)
 		return -ENOMEM;
-	memset(local, 0, sizeof(local_info_t));
 	link = &local->link;
 	link->priv = local;
 
--- linux-2.6.16-rc4/drivers/usb/host/ehci-sched.c.orig	2006-02-27 16:46:59.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/host/ehci-sched.c	2006-02-27 16:47:17.000000000 +0100
@@ -863,9 +863,8 @@ iso_sched_alloc (unsigned packets, gfp_t
 	int			size = sizeof *iso_sched;
 
 	size += packets * sizeof (struct ehci_iso_packet);
-	iso_sched = kmalloc (size, mem_flags);
+	iso_sched = kzalloc(size, mem_flags);
 	if (likely (iso_sched != NULL)) {
-		memset(iso_sched, 0, size);
 		INIT_LIST_HEAD (&iso_sched->td_list);
 	}
 	return iso_sched;
--- linux-2.6.16-rc4/drivers/usb/host/ehci-mem.c.orig	2006-02-27 16:47:25.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/host/ehci-mem.c	2006-02-27 16:48:23.000000000 +0100
@@ -221,13 +221,9 @@ static int ehci_mem_init (struct ehci_hc
 		ehci->periodic [i] = EHCI_LIST_END;
 
 	/* software shadow of hardware table */
-	ehci->pshadow = kmalloc (ehci->periodic_size * sizeof (void *), flags);
-	if (ehci->pshadow == NULL) {
-		goto fail;
-	}
-	memset (ehci->pshadow, 0, ehci->periodic_size * sizeof (void *));
-
-	return 0;
+	ehci->pshadow = kcalloc(ehci->periodic_size, sizeof(void *), flags);
+	if (ehci->pshadow != NULL)
+		return 0;
 
 fail:
 	ehci_dbg (ehci, "couldn't init memory\n");
--- linux-2.6.16-rc4/drivers/usb/storage/jumpshot.c.orig	2006-02-27 16:48:59.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/storage/jumpshot.c	2006-02-27 16:49:16.000000000 +0100
@@ -441,12 +441,11 @@ int jumpshot_transport(struct scsi_cmnd 
 	};
 
 	if (!us->extra) {
-		us->extra = kmalloc(sizeof(struct jumpshot_info), GFP_NOIO);
+		us->extra = kzalloc(sizeof(struct jumpshot_info), GFP_NOIO);
 		if (!us->extra) {
 			US_DEBUGP("jumpshot_transport:  Gah! Can't allocate storage for jumpshot info struct!\n");
 			return USB_STOR_TRANSPORT_ERROR;
 		}
-		memset(us->extra, 0, sizeof(struct jumpshot_info));
 		us->extra_destructor = jumpshot_info_destructor;
 	}
 
--- linux-2.6.16-rc4/drivers/usb/storage/shuttle_usbat.c.orig	2006-02-27 16:49:22.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/storage/shuttle_usbat.c	2006-02-27 16:49:35.000000000 +0100
@@ -1318,12 +1318,11 @@ int init_usbat(struct us_data *us)
 	unsigned char subcountL = USBAT_ATA_LBA_ME;
 	unsigned char *status = us->iobuf;
 
-	us->extra = kmalloc(sizeof(struct usbat_info), GFP_NOIO);
+	us->extra = kzalloc(sizeof(struct usbat_info), GFP_NOIO);
 	if (!us->extra) {
 		US_DEBUGP("init_usbat: Gah! Can't allocate storage for usbat info struct!\n");
 		return 1;
 	}
-	memset(us->extra, 0, sizeof(struct usbat_info));
 	info = (struct usbat_info *) (us->extra);
 
 	/* Enable peripheral control signals */
--- linux-2.6.16-rc4/drivers/usb/storage/isd200.c.orig	2006-02-27 16:49:44.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/storage/isd200.c	2006-02-27 16:51:25.000000000 +0100
@@ -1360,22 +1360,18 @@ static int isd200_init_info(struct us_da
 	int retStatus = ISD200_GOOD;
 	struct isd200_info *info;
 
-	info = (struct isd200_info *)
-			kmalloc(sizeof(struct isd200_info), GFP_KERNEL);
+	info = kzalloc(sizeof(struct isd200_info), GFP_KERNEL);
+	
 	if (!info)
 		retStatus = ISD200_ERROR;
 	else {
-		memset(info, 0, sizeof(struct isd200_info));
-		info->id = (struct hd_driveid *)
-				kmalloc(sizeof(struct hd_driveid), GFP_KERNEL);
-		info->RegsBuf = (unsigned char *)
-				kmalloc(sizeof(info->ATARegs), GFP_KERNEL);
+		info->id = kzalloc(sizeof(struct hd_driveid), GFP_KERNEL);
+		info->RegsBuf = kmalloc(sizeof(info->ATARegs), GFP_KERNEL);
 		if (!info->id || !info->RegsBuf) {
 			isd200_free_info_ptrs(info);
 			kfree(info);
 			retStatus = ISD200_ERROR;
-		} else
-			memset(info->id, 0, sizeof(struct hd_driveid));
+		}
 	}
 
 	if (retStatus == ISD200_GOOD) {
@@ -1384,7 +1380,7 @@ static int isd200_init_info(struct us_da
 	} else
 		US_DEBUGP("ERROR - kmalloc failure\n");
 
-	return(retStatus);
+	return retStatus;
 }
 
 /**************************************************************************
--- linux-2.6.16-rc4/drivers/usb/storage/sddr55.c.orig	2006-02-27 16:51:35.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/storage/sddr55.c	2006-02-27 16:52:18.000000000 +0100
@@ -751,11 +751,10 @@ int sddr55_transport(struct scsi_cmnd *s
 	struct sddr55_card_info *info;
 
 	if (!us->extra) {
-		us->extra = kmalloc(
+		us->extra = kzalloc(
 			sizeof(struct sddr55_card_info), GFP_NOIO);
 		if (!us->extra)
 			return USB_STOR_TRANSPORT_ERROR;
-		memset(us->extra, 0, sizeof(struct sddr55_card_info));
 		us->extra_destructor = sddr55_card_info_destructor;
 	}
 
--- linux-2.6.16-rc4/drivers/usb/misc/idmouse.c.orig	2006-02-27 16:52:43.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/misc/idmouse.c	2006-02-27 16:52:51.000000000 +0100
@@ -340,10 +340,9 @@ static int idmouse_probe(struct usb_inte
 		return -ENODEV;
 
 	/* allocate memory for our device state and initialize it */
-	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL)
 		return -ENOMEM;
-	memset(dev, 0x00, sizeof(*dev));
 
 	init_MUTEX(&dev->sem);
 	dev->udev = udev;
--- linux-2.6.16-rc4/drivers/usb/misc/usblcd.c.orig	2006-02-27 16:52:59.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/misc/usblcd.c	2006-02-27 16:53:12.000000000 +0100
@@ -270,12 +270,11 @@ static int lcd_probe(struct usb_interfac
 	int retval = -ENOMEM;
 
 	/* allocate memory for our device state and initialize it */
-	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL) {
 		err("Out of memory");
 		goto error;
 	}
-	memset(dev, 0x00, sizeof(*dev));
 	kref_init(&dev->kref);
 
 	dev->udev = usb_get_dev(interface_to_usbdev(interface));
--- linux-2.6.16-rc4/drivers/usb/misc/usbtest.c.orig	2006-02-27 16:53:19.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/misc/usbtest.c	2006-02-27 16:54:22.000000000 +0100
@@ -382,12 +382,11 @@ alloc_sglist (int nents, int max, int va
 	for (i = 0; i < nents; i++) {
 		char		*buf;
 
-		buf = kmalloc (size, SLAB_KERNEL);
+		buf = kzalloc (size, SLAB_KERNEL);
 		if (!buf) {
 			free_sglist (sg, i);
 			return NULL;
 		}
-		memset (buf, 0, size);
 
 		/* kmalloc pages are always physically contiguous! */
 		sg_init_one(&sg[i], buf, size);
@@ -842,10 +841,9 @@ test_ctrl_queue (struct usbtest_dev *dev
 	 * as with bulk/intr sglists, sglen is the queue depth; it also
 	 * controls which subtests run (more tests than sglen) or rerun.
 	 */
-	urb = kmalloc (param->sglen * sizeof (struct urb *), SLAB_KERNEL);
+	urb = kcalloc(param->sglen, sizeof(struct urb *), SLAB_KERNEL);
 	if (!urb)
 		return -ENOMEM;
-	memset (urb, 0, param->sglen * sizeof (struct urb *));
 	for (i = 0; i < param->sglen; i++) {
 		int			pipe = usb_rcvctrlpipe (udev, 0);
 		unsigned		len;
@@ -1865,10 +1863,9 @@ usbtest_probe (struct usb_interface *int
 	}
 #endif
 
-	dev = kmalloc (sizeof *dev, SLAB_KERNEL);
+	dev = kzalloc(sizeof(*dev), SLAB_KERNEL);
 	if (!dev)
 		return -ENOMEM;
-	memset (dev, 0, sizeof *dev);
 	info = (struct usbtest_info *) id->driver_info;
 	dev->info = info;
 	init_MUTEX (&dev->sem);
--- linux-2.6.16-rc4/drivers/usb/misc/ldusb.c.orig	2006-02-27 16:54:30.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/misc/ldusb.c	2006-02-27 16:54:47.000000000 +0100
@@ -626,12 +626,11 @@ static int ld_usb_probe(struct usb_inter
 
 	/* allocate memory for our device state and intialize it */
 
-	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL) {
 		dev_err(&intf->dev, "Out of memory\n");
 		goto exit;
 	}
-	memset(dev, 0x00, sizeof(*dev));
 	init_MUTEX(&dev->sem);
 	dev->intf = intf;
 	init_waitqueue_head(&dev->read_wait);
--- linux-2.6.16-rc4/drivers/usb/misc/phidgetservo.c.orig	2006-02-27 16:54:56.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/misc/phidgetservo.c	2006-02-27 16:55:16.000000000 +0100
@@ -252,12 +252,11 @@ servo_probe(struct usb_interface *interf
 	struct usb_device *udev = interface_to_usbdev(interface);
 	struct phidget_servo *dev;
 
-	dev = kmalloc(sizeof (struct phidget_servo), GFP_KERNEL);
+	dev = kzalloc(sizeof(struct phidget_servo), GFP_KERNEL);
 	if (dev == NULL) {
 		dev_err(&interface->dev, "%s - out of memory\n", __FUNCTION__);
 		return -ENOMEM;
 	}
-	memset(dev, 0x00, sizeof (*dev));
 
 	dev->udev = usb_get_dev(udev);
 	dev->type = id->driver_info;
--- linux-2.6.16-rc4/drivers/usb/misc/usbled.c.orig	2006-02-27 16:55:27.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/misc/usbled.c	2006-02-27 16:55:47.000000000 +0100
@@ -106,12 +106,11 @@ static int led_probe(struct usb_interfac
 	struct usb_led *dev = NULL;
 	int retval = -ENOMEM;
 
-	dev = kmalloc(sizeof(struct usb_led), GFP_KERNEL);
+	dev = kzalloc(sizeof(struct usb_led), GFP_KERNEL);
 	if (dev == NULL) {
 		dev_err(&interface->dev, "Out of memory\n");
 		goto error;
 	}
-	memset (dev, 0x00, sizeof (*dev));
 
 	dev->udev = usb_get_dev(udev);
 
--- linux-2.6.16-rc4/drivers/usb/misc/auerswald.c.orig	2006-02-27 16:55:54.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/misc/auerswald.c	2006-02-27 16:56:36.000000000 +0100
@@ -570,10 +570,9 @@ static int auerchain_setup (pauerchain_t
 
         /* fill the list of free elements */
         for (;numElements; numElements--) {
-                acep = (pauerchainelement_t) kmalloc (sizeof (auerchainelement_t), GFP_KERNEL);
+                acep = kzalloc(sizeof(auerchainelement_t), GFP_KERNEL);
                 if (!acep)
 			goto ac_fail;
-		memset (acep, 0, sizeof (auerchainelement_t));
                 INIT_LIST_HEAD (&acep->list);
                 list_add_tail (&acep->list, &acp->free_list);
         }
@@ -761,10 +760,9 @@ static int auerbuf_setup (pauerbufctl_t 
 
         /* fill the list of free elements */
         for (;numElements; numElements--) {
-                bep = (pauerbuf_t) kmalloc (sizeof (auerbuf_t), GFP_KERNEL);
+                bep = kzalloc(sizeof(auerbuf_t), GFP_KERNEL);
                 if (!bep)
 			goto bl_fail;
-	        memset (bep, 0, sizeof (auerbuf_t));
                 bep->list = bcp;
                 INIT_LIST_HEAD (&bep->buff_list);
                 bep->bufp = kmalloc (bufsize, GFP_KERNEL);
--- linux-2.6.16-rc4/drivers/usb/misc/cytherm.c.orig	2006-02-27 16:56:42.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/misc/cytherm.c	2006-02-27 16:57:00.000000000 +0100
@@ -351,12 +351,11 @@ static int cytherm_probe(struct usb_inte
 	struct usb_cytherm *dev = NULL;
 	int retval = -ENOMEM;
 
-	dev = kmalloc (sizeof(struct usb_cytherm), GFP_KERNEL);
+	dev = kzalloc(sizeof(struct usb_cytherm), GFP_KERNEL);
 	if (dev == NULL) {
 		dev_err (&interface->dev, "Out of memory\n");
 		goto error;
 	}
-	memset (dev, 0x00, sizeof (*dev));
 
 	dev->udev = usb_get_dev(udev);
 
--- linux-2.6.16-rc4/drivers/usb/misc/phidgetkit.c.orig	2006-02-27 16:58:02.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/misc/phidgetkit.c	2006-02-27 16:58:11.000000000 +0100
@@ -406,12 +406,11 @@ static int interfacekit_probe(struct usb
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
 	maxp = usb_maxpacket(dev, pipe, usb_pipeout(pipe));
 	
-	kit = kmalloc(sizeof(*kit), GFP_KERNEL);
+	kit = kzalloc(sizeof(*kit), GFP_KERNEL);
 	if (kit  == NULL) {
 		dev_err(&intf->dev, "%s - out of memory\n", __FUNCTION__);
 		return -ENOMEM;
 	}
-	memset(kit, 0, sizeof(*kit));
 	kit->ifkit = ifkit;
 
 	kit->data = usb_buffer_alloc(dev, 8, SLAB_ATOMIC, &kit->data_dma);
--- linux-2.6.16-rc4/drivers/usb/mon/mon_text.c.orig	2006-02-27 16:58:21.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/mon/mon_text.c	2006-02-27 16:58:30.000000000 +0100
@@ -212,12 +212,11 @@ static int mon_text_open(struct inode *i
 	mbus = inode->u.generic_ip;
 	ubus = mbus->u_bus;
 
-	rp = kmalloc(sizeof(struct mon_reader_text), GFP_KERNEL);
+	rp = kzalloc(sizeof(struct mon_reader_text), GFP_KERNEL);
 	if (rp == NULL) {
 		rc = -ENOMEM;
 		goto err_alloc;
 	}
-	memset(rp, 0, sizeof(struct mon_reader_text));
 	INIT_LIST_HEAD(&rp->e_list);
 	init_waitqueue_head(&rp->wait);
 	init_MUTEX(&rp->printf_lock);
--- linux-2.6.16-rc4/drivers/usb/mon/mon_main.c.orig	2006-02-27 16:58:37.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/mon/mon_main.c	2006-02-27 16:58:47.000000000 +0100
@@ -276,9 +276,8 @@ static void mon_bus_init(struct dentry *
 	char name[NAMESZ];
 	int rc;
 
-	if ((mbus = kmalloc(sizeof(struct mon_bus), GFP_KERNEL)) == NULL)
+	if ((mbus = kzalloc(sizeof(struct mon_bus), GFP_KERNEL)) == NULL)
 		goto err_alloc;
-	memset(mbus, 0, sizeof(struct mon_bus));
 	kref_init(&mbus->ref);
 	spin_lock_init(&mbus->lock);
 	INIT_LIST_HEAD(&mbus->r_list);
--- linux-2.6.16-rc4/drivers/usb/gadget/lh7a40x_udc.c.orig	2006-02-27 16:59:07.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/gadget/lh7a40x_udc.c	2006-02-27 16:59:22.000000000 +0100
@@ -1114,11 +1114,10 @@ static struct usb_request *lh7a40x_alloc
 
 	DEBUG("%s, %p\n", __FUNCTION__, ep);
 
-	req = kmalloc(sizeof *req, gfp_flags);
+	req = kzalloc(sizeof(*req), gfp_flags);
 	if (!req)
 		return 0;
 
-	memset(req, 0, sizeof *req);
 	INIT_LIST_HEAD(&req->queue);
 
 	return &req->req;
--- linux-2.6.16-rc4/drivers/usb/gadget/inode.c.orig	2006-02-27 16:59:34.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/gadget/inode.c	2006-02-27 17:00:42.000000000 +0100
@@ -170,10 +170,9 @@ static struct dev_data *dev_new (void)
 {
 	struct dev_data		*dev;
 
-	dev = kmalloc (sizeof *dev, GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return NULL;
-	memset (dev, 0, sizeof *dev);
 	dev->state = STATE_DEV_DISABLED;
 	atomic_set (&dev->count, 1);
 	spin_lock_init (&dev->lock);
@@ -1592,10 +1591,9 @@ static int activate_ep_files (struct dev
 	gadget_for_each_ep (ep, dev->gadget) {
 		struct ep_data	*data;
 
-		data = kmalloc (sizeof *data, GFP_KERNEL);
+		data = kzalloc(sizeof(*data), GFP_KERNEL);
 		if (!data)
 			goto enomem;
-		memset (data, 0, sizeof data);
 		data->state = STATE_EP_DISABLED;
 		init_MUTEX (&data->lock);
 		init_waitqueue_head (&data->wait);
--- linux-2.6.16-rc4/drivers/usb/gadget/goku_udc.c.orig	2006-02-27 17:00:51.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/gadget/goku_udc.c	2006-02-27 17:01:03.000000000 +0100
@@ -275,11 +275,10 @@ goku_alloc_request(struct usb_ep *_ep, g
 
 	if (!_ep)
 		return NULL;
-	req = kmalloc(sizeof *req, gfp_flags);
+	req = kzalloc(sizeof *req, gfp_flags);
 	if (!req)
 		return NULL;
 
-	memset(req, 0, sizeof *req);
 	req->req.dma = DMA_ADDR_INVALID;
 	INIT_LIST_HEAD(&req->queue);
 	return &req->req;
--- linux-2.6.16-rc4/drivers/usb/gadget/pxa2xx_udc.c.orig	2006-02-27 17:01:12.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/gadget/pxa2xx_udc.c	2006-02-27 17:01:27.000000000 +0100
@@ -335,11 +335,10 @@ pxa2xx_ep_alloc_request (struct usb_ep *
 {
 	struct pxa2xx_request *req;
 
-	req = kmalloc (sizeof *req, gfp_flags);
+	req = kzalloc(sizeof(*req), gfp_flags);
 	if (!req)
 		return NULL;
 
-	memset (req, 0, sizeof *req);
 	INIT_LIST_HEAD (&req->queue);
 	return &req->req;
 }
--- linux-2.6.16-rc4/drivers/usb/gadget/dummy_hcd.c.orig	2006-02-27 17:01:35.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/gadget/dummy_hcd.c	2006-02-27 17:01:52.000000000 +0100
@@ -478,10 +478,9 @@ dummy_alloc_request (struct usb_ep *_ep,
 		return NULL;
 	ep = usb_ep_to_dummy_ep (_ep);
 
-	req = kmalloc (sizeof *req, mem_flags);
+	req = kzalloc(sizeof(*req), mem_flags);
 	if (!req)
 		return NULL;
-	memset (req, 0, sizeof *req);
 	INIT_LIST_HEAD (&req->queue);
 	return &req->req;
 }
--- linux-2.6.16-rc4/drivers/usb/gadget/zero.c.orig	2006-02-27 17:02:00.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/gadget/zero.c	2006-02-27 17:02:17.000000000 +0100
@@ -1188,10 +1188,9 @@ autoconf_fail:
 

 	/* ok, we made sense of the hardware ... */
-	dev = kmalloc (sizeof *dev, SLAB_KERNEL);
+	dev = kzalloc(sizeof(*dev), SLAB_KERNEL);
 	if (!dev)
 		return -ENOMEM;
-	memset (dev, 0, sizeof *dev);
 	spin_lock_init (&dev->lock);
 	dev->gadget = gadget;
 	set_gadget_data (gadget, dev);
--- linux-2.6.16-rc4/drivers/usb/gadget/serial.c.orig	2006-02-27 17:02:22.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/gadget/serial.c	2006-02-27 17:02:51.000000000 +0100
@@ -2178,10 +2178,9 @@ static int gs_alloc_ports(struct gs_dev 
 		return -EIO;
 
 	for (i=0; i<GS_NUM_PORTS; i++) {
-		if ((port=(struct gs_port *)kmalloc(sizeof(struct gs_port), kmalloc_flags)) == NULL)
+		if ((port=(struct gs_port *)kzalloc(sizeof(struct gs_port), kmalloc_flags)) == NULL)
 			return -ENOMEM;
 
-		memset(port, 0, sizeof(struct gs_port));
 		port->port_dev = dev;
 		port->port_num = i;
 		port->port_line_coding.dwDTERate = cpu_to_le32(GS_DEFAULT_DTE_RATE);
--- linux-2.6.16-rc4/drivers/usb/gadget/net2280.c.orig	2006-02-27 17:03:01.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/gadget/net2280.c	2006-02-27 17:03:17.000000000 +0100
@@ -386,11 +386,10 @@ net2280_alloc_request (struct usb_ep *_e
 		return NULL;
 	ep = container_of (_ep, struct net2280_ep, ep);
 
-	req = kmalloc (sizeof *req, gfp_flags);
+	req = kzalloc(sizeof(*req), gfp_flags);
 	if (!req)
 		return NULL;
 
-	memset (req, 0, sizeof *req);
 	req->req.dma = DMA_ADDR_INVALID;
 	INIT_LIST_HEAD (&req->queue);
 
--- linux-2.6.16-rc4/drivers/usb/gadget/omap_udc.c.orig	2006-02-27 17:03:27.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/gadget/omap_udc.c	2006-02-27 17:04:54.000000000 +0100
@@ -273,9 +273,8 @@ omap_alloc_request(struct usb_ep *ep, gf
 {
 	struct omap_req	*req;
 
-	req = kmalloc(sizeof *req, gfp_flags);
+	req = kzalloc(sizeof(*req), gfp_flags);
 	if (req) {
-		memset (req, 0, sizeof *req);
 		req->req.dma = DMA_ADDR_INVALID;
 		INIT_LIST_HEAD (&req->queue);
 	}
@@ -2586,11 +2585,10 @@ omap_udc_setup(struct platform_device *o
 	/* UDC_PULLUP_EN gates the chip clock */
 	// OTG_SYSCON_1_REG |= DEV_IDLE_EN;
 
-	udc = kmalloc (sizeof *udc, SLAB_KERNEL);
+	udc = kzalloc(sizeof(*udc), SLAB_KERNEL);
 	if (!udc)
 		return -ENOMEM;
 
-	memset(udc, 0, sizeof *udc);
 	spin_lock_init (&udc->lock);
 
 	udc->gadget.ops = &omap_gadget_ops;
--- linux-2.6.16-rc4/drivers/usb/input/hiddev.c.orig	2006-02-27 17:05:06.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/input/hiddev.c	2006-02-27 17:05:26.000000000 +0100
@@ -257,9 +257,8 @@ static int hiddev_open(struct inode * in
 	if (i >= HIDDEV_MINORS || !hiddev_table[i])
 		return -ENODEV;
 
-	if (!(list = kmalloc(sizeof(struct hiddev_list), GFP_KERNEL)))
+	if (!(list = kzalloc(sizeof(struct hiddev_list), GFP_KERNEL)))
 		return -ENOMEM;
-	memset(list, 0, sizeof(struct hiddev_list));
 
 	list->hiddev = hiddev_table[i];
 	list->next = hiddev_table[i]->list;
@@ -754,9 +753,8 @@ int hiddev_connect(struct hid_device *hi
 	if (i == hid->maxcollection && (hid->quirks & HID_QUIRK_HIDDEV) == 0)
 		return -1;
 
-	if (!(hiddev = kmalloc(sizeof(struct hiddev), GFP_KERNEL)))
+	if (!(hiddev = kzalloc(sizeof(struct hiddev), GFP_KERNEL)))
 		return -1;
-	memset(hiddev, 0, sizeof(struct hiddev));
 
 	retval = usb_register_dev(hid->intf, &hiddev_class);
 	if (retval) {
--- linux-2.6.16-rc4/drivers/usb/input/hid-core.c.orig	2006-02-27 17:05:33.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/input/hid-core.c	2006-02-27 17:06:42.000000000 +0100
@@ -66,9 +66,8 @@ static struct hid_report *hid_register_r
 	if (report_enum->report_id_hash[id])
 		return report_enum->report_id_hash[id];
 
-	if (!(report = kmalloc(sizeof(struct hid_report), GFP_KERNEL)))
+	if (!(report = kzalloc(sizeof(struct hid_report), GFP_KERNEL)))
 		return NULL;
-	memset(report, 0, sizeof(struct hid_report));
 
 	if (id != 0)
 		report_enum->numbered = 1;
@@ -651,17 +650,14 @@ static struct hid_device *hid_parse_repo
 		hid_parser_reserved
 	};
 
-	if (!(device = kmalloc(sizeof(struct hid_device), GFP_KERNEL)))
+	if (!(device = kzalloc(sizeof(struct hid_device), GFP_KERNEL)))
 		return NULL;
-	memset(device, 0, sizeof(struct hid_device));
 
-	if (!(device->collection = kmalloc(sizeof(struct hid_collection) *
+	if (!(device->collection = kzalloc(sizeof(struct hid_collection) *
 				   HID_DEFAULT_NUM_COLLECTIONS, GFP_KERNEL))) {
 		kfree(device);
 		return NULL;
 	}
-	memset(device->collection, 0, sizeof(struct hid_collection) *
-		HID_DEFAULT_NUM_COLLECTIONS);
 	device->collection_size = HID_DEFAULT_NUM_COLLECTIONS;
 
 	for (i = 0; i < HID_REPORT_TYPES; i++)
--- linux-2.6.16-rc4/drivers/usb/input/hid-lgff.c.orig	2006-02-27 17:06:49.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/input/hid-lgff.c	2006-02-27 17:06:58.000000000 +0100
@@ -154,10 +154,9 @@ int hid_lgff_init(struct hid_device* hid
 		return -1;
 	}
 
-	private = kmalloc(sizeof(struct lgff_device), GFP_KERNEL);
+	private = kzalloc(sizeof(struct lgff_device), GFP_KERNEL);
 	if (!private)
 		return -1;
-	memset(private, 0, sizeof(struct lgff_device));
 	hid->ff_private = private;
 
 	/* Input init */
--- linux-2.6.16-rc4/drivers/usb/input/hid-tmff.c.orig	2006-02-27 17:07:04.000000000 +0100
+++ linux-2.6.16-rc4/drivers/usb/input/hid-tmff.c	2006-02-27 17:07:16.000000000 +0100
@@ -113,11 +113,10 @@ int hid_tmff_init(struct hid_device *hid
 	struct hid_input *hidinput = list_entry(hid->inputs.next, struct hid_input, list);
 	struct input_dev *input_dev = hidinput->input;
 
-	private = kmalloc(sizeof(struct tmff_device), GFP_KERNEL);
+	private = kzalloc(sizeof(struct tmff_device), GFP_KERNEL);
 	if (!private)
 		return -ENOMEM;
 
-	memset(private, 0, sizeof(struct tmff_device));
 	hid->ff_private = private;
 
 	/* Find the report to use */



--===============50653246624246395==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50653246624246395==--
