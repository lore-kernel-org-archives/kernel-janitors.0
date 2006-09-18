From: Dmitry Torokhov <dtor@insightbb.com>
Date: Mon, 18 Sep 2006 01:21:33 +0000
Subject: Re: [KJ] bluetooth drivers : kmalloc to kzalloc conversion
Message-Id: <200609172121.36247.dtor@insightbb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171754q7c7335f9pfab703d6b746236b@mail.gmail.com>
In-Reply-To: <6b4e42d10609171754q7c7335f9pfab703d6b746236b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Om Narasimhan <om.turyx@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, bluez-devel@lists.sf.net

On Sunday 17 September 2006 20:54, Om Narasimhan wrote:> --- a/drivers/blue=
tooth/hci_usb.c> +++ b/drivers/bluetooth/hci_usb.c> @@ -147,10 +147,9 @@ st=
atic struct usb_device_id blacklist_id> > =A0static struct _urb *_urb_alloc=
(int isoc, gfp_t gfp)> =A0{> -=A0=A0=A0=A0=A0=A0=A0struct _urb *_urb =3D km=
alloc(sizeof(struct _urb) +> +=A0=A0=A0=A0=A0=A0=A0struct _urb *_urb =3D kz=
alloc(sizeof(struct _urb) +> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sizeof(struct usb_iso_pa=
cket_descriptor) * isoc, gfp);> =A0=A0=A0=A0=A0=A0=A0=A0if (_urb) {> -=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0memset(_urb, 0, sizeof(*_urb));> =
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0usb_init_urb(&_urb->urb);> =
=A0=A0=A0=A0=A0=A0=A0=A0}> =A0=A0=A0=A0=A0=A0=A0=A0return _urb;>=20
Note that only beginning if the aloocated memory was zeroed in originalcode=
; your patch may introduce slowdowns.
-- Dmitry
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
