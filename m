From: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
Date: Tue, 28 Sep 2004 03:19:02 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 1/4] w1/dscore: replace
Message-Id: <1096341542.21750.21.camel@uganda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97936858944698213=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org


--===============97936858944698213==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-aC12jRTpRfqdrX5xUKTY"


--=-aC12jRTpRfqdrX5xUKTY
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-09-28 at 03:17, Nishanth Aravamudan wrote:
> Any comments would be appreciated.

Following code is buggy, I know, the latest -mm tree already contains
codepath which properly sets process state and checks signals.
I've not used msleep*() due to future ability of special signal
handling.

> Description: Use msleep_interruptible() instead of schedule_timeout() to
> guarantee the task delays as expected.
>=20
> --- 2.6.9-rc2-vanilla/drivers/w1/dscore.c	2004-09-13 17:16:07.000000000 -=
0700
> +++ 2.6.9-rc2/drivers/w1/dscore.c	2004-09-27 16:16:47.000000000 -0700
> @@ -23,6 +23,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/usb.h>
> +#include <linux/delay.h>
> =20
>  #include "dscore.h"
> =20
> @@ -731,7 +732,7 @@ void ds_disconnect(struct usb_interface=20
>  	usb_set_intfdata (intf, NULL);
> =20
>  	while(atomic_read(&dev->refcnt))
> -		schedule_timeout(HZ);
> +		msleep_interruptible(1000);
> =20
>  	usb_put_dev(dev->udev);
>  	kfree(dev);
--=20
	Evgeniy Polyakov

Crash is better than data corruption. -- Art Grabowski

--=-aC12jRTpRfqdrX5xUKTY
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBWNgmIKTPhE+8wY0RAqweAJ9iCrG5TXeivGtuiDRhBG9YDNQazACfYHCg
HMaSj0kZOd77p0bytPhPWDU=
=nIWn
-----END PGP SIGNATURE-----

--=-aC12jRTpRfqdrX5xUKTY--


--===============97936858944698213==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97936858944698213==--
