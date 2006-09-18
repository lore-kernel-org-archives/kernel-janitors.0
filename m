From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Mon, 18 Sep 2006 02:24:39 +0000
Subject: Re: [KJ] bluetooth drivers : kmalloc to kzalloc conversion
Message-Id: <6b4e42d10609171924v1bb5d238l597fae8a21641a4d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171754q7c7335f9pfab703d6b746236b@mail.gmail.com>
	<200609172121.36247.dtor@insightbb.com>
In-Reply-To: <200609172121.36247.dtor@insightbb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dtor@insightbb.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, bluez-devel@lists.sf.net

On 9/17/06, Dmitry Torokhov <dtor@insightbb.com> wrote:
> On Sunday 17 September 2006 20:54, Om Narasimhan wrote:
> > --- a/drivers/bluetooth/hci_usb.c
> > +++ b/drivers/bluetooth/hci_usb.c
> > @@ -147,10 +147,9 @@ static struct usb_device_id blacklist_id
> >
> > static struct _urb *_urb_alloc(int isoc, gfp_t gfp)
> > {
> > -struct _urb *_urb = kmalloc(sizeof(struct _urb) +
> > +struct _urb *_urb = kzalloc(sizeof(struct _urb) +
> > sizeof(struct usb_iso_packet_descriptor) * isoc, gfp);
> > if (_urb) {
> > -memset(_urb, 0, sizeof(*_urb));
> > usb_init_urb(&_urb->urb);
> > }
> > return _urb;
> >
>
> Note that only beginning if the aloocated memory was zeroed in original
> code; your patch may introduce slowdowns.
Would it? I thought memset() uses block move operation which doesn't
scale linearly.
And, usb_init_urb() calls memset() anyway, so the previously existed
memset() was superfluous.

Thanks for the comment.
Regards,
Om.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
