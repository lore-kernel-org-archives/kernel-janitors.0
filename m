From: David Brownell <david-b@pacbell.net>
Date: Mon, 29 Dec 2008 18:14:49 +0000
Subject: Re: [PATCH 10/13] drivers/usb/gadget: use USB API functions rather than constants
Message-Id: <200812291014.49779.david-b@pacbell.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.44L0.0812291025220.2250-100000@iolanthe.rowland.org> <Pine.LNX.4.64.0812291628100.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812291628100.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>, Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Monday 29 December 2008, Julia Lawall wrote:
> > > +#include <linux/usb.h>
> > > =A0#include <linux/usb/ch9.h>
> > > =A0#include <linux/usb/gadget.h>
> >=20
> > While there's nothing wrong with this part of the patch,

Not so; there *is* something wrong in requiring the
peripheral side support to use a host side header.


> > it hardly =20
> > seems necessary. =A0Was there any reason for including it?
>=20
> The new functions are defined in usb.h. I have added the include in=20
> this file and in the file epautoconf.c that this file includes. =A0If it =
is=20
> removed from both, then the code does not compile (after make=20
> allyesconfig):

Those functions were supposed to go into <linux/usb/ch9.h>, as
I recall, since they weren't specific to the host side stack.

Having them added to the wrong file is surely part of why
they've only been used by host side drivers.  :)

- Dave



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
