From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 27 Feb 2006 20:36:51 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/usb/gadget
Message-Id: <1141072611.32389.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59361996734184674=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============59361996734184674==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/usb to kzalloc usage.
Compile tested with allyes config.

I think there was a bug in drivers/usb/gadget/inode.c because
it used sizeof(*data) for the kmalloc() and sizeof(data) for
the memset(), since sizeof(data) just returns the size for a pointer.

I assume there is also a bug in drivers/usb/gadget/omap_udc.c
in omap_alloc_request(), req gets allocated via kmalloc() and
the function returns &req->req, no matter if req is NULL, which
looks like a NULL dereference to me, maybe someone who is more familar
with this code might have a look at it.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

diff -upr linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/dummy_hcd.c linux-2.6.16-rc4-mm2/drivers/usb/gadget/dummy_hcd.c
--- linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/dummy_hcd.c	2006-02-27 20:55:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/dummy_hcd.c	2006-02-27 20:57:14.000000000 +0100
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
diff -upr linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/goku_udc.c linux-2.6.16-rc4-mm2/drivers/usb/gadget/goku_udc.c
--- linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/goku_udc.c	2006-02-27 20:55:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/goku_udc.c	2006-02-27 20:57:14.000000000 +0100
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
diff -upr linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/inode.c linux-2.6.16-rc4-mm2/drivers/usb/gadget/inode.c
--- linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/inode.c	2006-02-27 20:55:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/inode.c	2006-02-27 20:57:14.000000000 +0100
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
diff -upr linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/lh7a40x_udc.c linux-2.6.16-rc4-mm2/drivers/usb/gadget/lh7a40x_udc.c
--- linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/lh7a40x_udc.c	2006-02-27 20:55:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/lh7a40x_udc.c	2006-02-27 20:57:14.000000000 +0100
@@ -1114,11 +1114,10 @@ static struct usb_request *lh7a40x_alloc
 
 	DEBUG("%s, %p\n", __FUNCTION__, ep);
 
-	req = kmalloc(sizeof *req, gfp_flags);
+	req = kzalloc(sizeof(*req), gfp_flags);
 	if (!req)
 		return 0;
 
-	memset(req, 0, sizeof *req);
 	INIT_LIST_HEAD(&req->queue);
 
 	return &req->req;
diff -upr linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/net2280.c linux-2.6.16-rc4-mm2/drivers/usb/gadget/net2280.c
--- linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/net2280.c	2006-02-27 20:55:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/net2280.c	2006-02-27 20:57:14.000000000 +0100
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
 
diff -upr linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/omap_udc.c linux-2.6.16-rc4-mm2/drivers/usb/gadget/omap_udc.c
--- linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/omap_udc.c	2006-02-27 20:55:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/omap_udc.c	2006-02-27 20:57:14.000000000 +0100
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
diff -upr linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/pxa2xx_udc.c linux-2.6.16-rc4-mm2/drivers/usb/gadget/pxa2xx_udc.c
--- linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/pxa2xx_udc.c	2006-02-27 20:55:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/pxa2xx_udc.c	2006-02-27 20:57:14.000000000 +0100
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
diff -upr linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/serial.c linux-2.6.16-rc4-mm2/drivers/usb/gadget/serial.c
--- linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/serial.c	2006-02-27 20:55:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/serial.c	2006-02-27 20:57:14.000000000 +0100
@@ -2178,10 +2178,9 @@ static int gs_alloc_ports(struct gs_dev 
 		return -EIO;
 
 	for (i=0; i<GS_NUM_PORTS; i++) {
-		if ((port=(struct gs_port *)kmalloc(sizeof(struct gs_port), kmalloc_flags)) == NULL)
+		if ((port=kzalloc(sizeof(struct gs_port), kmalloc_flags)) == NULL)
 			return -ENOMEM;
 
-		memset(port, 0, sizeof(struct gs_port));
 		port->port_dev = dev;
 		port->port_num = i;
 		port->port_line_coding.dwDTERate = cpu_to_le32(GS_DEFAULT_DTE_RATE);
diff -upr linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/zero.c linux-2.6.16-rc4-mm2/drivers/usb/gadget/zero.c
--- linux-2.6.16-rc4-mm2.orig/drivers/usb/gadget/zero.c	2006-02-27 20:55:38.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/zero.c	2006-02-27 20:57:14.000000000 +0100
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



--===============59361996734184674==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59361996734184674==--
