From: Greg KH <gregkh@suse.de>
Date: Mon, 27 Feb 2006 19:33:09 +0000
Subject: [KJ] Re: [Patch] kzalloc() conversion in drivers/usb
Message-Id: <20060227193309.GA9991@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9908557374164193=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============9908557374164193==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2006 at 05:22:24PM +0100, Eric Sesterhenn wrote:
> hi,
> 
> this patch converts drivers/usb to kzalloc usage.
> Compile tested with allyes config.

A lot of these changes are already in the latest -mm tree.  Can you
rediff this against that tree instead?

> This also fixes a bug in drivers/usb/serial/cp2101.c
> where memset() was used before checking if kmalloc() returns NULL.
> 
> I think there also was a bug in drivers/usb/gadget/inode.c because
> it used sizeof(*data) for the kmalloc() and sizeof(data) for
> the memset(), since sizeof(data) just returns the size for a pointer.
> 
> I assume there is also a bug in drivers/usb/gadget/omap_udc.c
> in omap_alloc_request(), req gets allocated via kmalloc() and
> the function returns &req->req, no matter if req is NULL, which
> looks like a NULL dereference to me, maybe someone who is more familar
> with this code might have a look at it.

Care to send the gadget patches to the usb gadget maintainer separately?

thanks,

greg k-h

--===============9908557374164193==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9908557374164193==--
