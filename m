From: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
Date: Tue, 28 Sep 2004 03:25:21 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 1/4] w1/dscore: replace
Message-Id: <1096341921.21750.24.camel@uganda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59668235900190769=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org


--===============59668235900190769==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Pbglg0TXPArxDMESEnhg"


--=-Pbglg0TXPArxDMESEnhg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-09-28 at 07:19, Evgeniy Polyakov wrote:
> On Tue, 2004-09-28 at 03:17, Nishanth Aravamudan wrote:
> > Any comments would be appreciated.
>=20
> Following code is buggy, I know, the latest -mm tree already contains
> codepath which properly sets process state and checks signals.
> I've not used msleep*() due to future ability of special signal
> handling.

Hmm, I've rechecked -mm3, no it is not containing such fixes yet. I hope
next -mm release will have them.
Anyway if you set TASK_INTERRUPTIBLE you must be prepared to check
signal pending and either flush them or proper handle.

> > Description: Use msleep_interruptible() instead of schedule_timeout() t=
o
> > guarantee the task delays as expected.
> >=20
> > --- 2.6.9-rc2-vanilla/drivers/w1/dscore.c	2004-09-13 17:16:07.000000000=
 -0700
> > +++ 2.6.9-rc2/drivers/w1/dscore.c	2004-09-27 16:16:47.000000000 -0700
> > @@ -23,6 +23,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/usb.h>
> > +#include <linux/delay.h>
> > =20
> >  #include "dscore.h"
> > =20
> > @@ -731,7 +732,7 @@ void ds_disconnect(struct usb_interface=20
> >  	usb_set_intfdata (intf, NULL);
> > =20
> >  	while(atomic_read(&dev->refcnt))
> > -		schedule_timeout(HZ);
> > +		msleep_interruptible(1000);
> > =20
> >  	usb_put_dev(dev->udev);
> >  	kfree(dev);
--=20
	Evgeniy Polyakov

Crash is better than data corruption. -- Art Grabowski

--=-Pbglg0TXPArxDMESEnhg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBWNmhIKTPhE+8wY0RAh7SAJ4yYbvlH7bCO4wgbYvL7+tvlk+p9QCfZ6Df
rf86Oymq66hBFIspVt12fHs=
=s8hV
-----END PGP SIGNATURE-----

--=-Pbglg0TXPArxDMESEnhg--


--===============59668235900190769==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59668235900190769==--
