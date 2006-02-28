From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 28 Feb 2006 09:20:25 +0000
Subject: [KJ] Re: [Patch] kzalloc() conversion in drivers/usb/gadget
Message-Id: <1141118425.11561.0.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============035764497033801135=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060227193309.GA9991@suse.de>
In-Reply-To: <20060227193309.GA9991@suse.de>
To: kernel-janitors@vger.kernel.org

--===============035764497033801135==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,
> > I assume there is also a bug in drivers/usb/gadget/omap_udc.c
> > in omap_alloc_request(), req gets allocated via kmalloc() and
> > the function returns &req->req, no matter if req is NULL, which
> > looks like a NULL dereference to me, maybe someone who is more familar
> > with this code might have a look at it.
> 
> That should get fixed too.  Please roll a patch for that.
> 
> I'll sign off the conversion patch and forward it to Greg.
> Thanks!

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4-mm2/drivers/usb/gadget/omap_udc.c.orig	2006-02-28 10:17:39.000000000 +0100
+++ linux-2.6.16-rc4-mm2/drivers/usb/gadget/omap_udc.c	2006-02-28 10:18:53.000000000 +0100
@@ -273,12 +273,13 @@ omap_alloc_request(struct usb_ep *ep, gf
 {
 	struct omap_req	*req;
 
-	req = kmalloc(sizeof *req, gfp_flags);
-	if (req) {
-		memset (req, 0, sizeof *req);
-		req->req.dma = DMA_ADDR_INVALID;
-		INIT_LIST_HEAD (&req->queue);
-	}
+	req = kzalloc(sizeof *req, gfp_flags);
+	if (!req)
+		return NULL;
+	
+	req->req.dma = DMA_ADDR_INVALID;
+	INIT_LIST_HEAD (&req->queue);
+	
 	return &req->req;
 }
 



--===============035764497033801135==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============035764497033801135==--
