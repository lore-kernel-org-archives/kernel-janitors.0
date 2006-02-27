From: David Brownell <david-b@pacbell.net>
Date: Mon, 27 Feb 2006 21:36:20 +0000
Subject: [KJ] Re: [Patch] kzalloc() conversion in drivers/usb/gadget
Message-Id: <200602271336.20598.david-b@pacbell.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89395934574053149=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060227193309.GA9991@suse.de>
In-Reply-To: <20060227193309.GA9991@suse.de>
To: kernel-janitors@vger.kernel.org

--===============89395934574053149==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 27 February 2006 12:36 pm, Eric Sesterhenn wrote:

> I think there was a bug in drivers/usb/gadget/inode.c because
> it used sizeof(*data) for the kmalloc() and sizeof(data) for
> the memset(), since sizeof(data) just returns the size for a pointer.

Actually in that case it's safe, since all the fields get explicitly
initialized ... most of them right after the memset(), but a couple
of them later on before they're used.  But the same paranoia that
argued for explicit zeroing argues for your fix.  :)


> I assume there is also a bug in drivers/usb/gadget/omap_udc.c
> in omap_alloc_request(), req gets allocated via kmalloc() and
> the function returns &req->req, no matter if req is NULL, which
> looks like a NULL dereference to me, maybe someone who is more familar
> with this code might have a look at it.

That should get fixed too.  Please roll a patch for that.

I'll sign off the conversion patch and forward it to Greg.
Thanks!

- Dave

--===============89395934574053149==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89395934574053149==--
