From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Wed, 01 Aug 2012 13:35:16 +0000
Subject: Re: [can:master 1/1] drivers/net/can/led.c:41:4: error: implicit declaration of function 'led_trigge
Message-Id: <50193094.4090704@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enigECD8088CC41B270EAB26129A"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120801125137.GB19751@localhost>
In-Reply-To: <20120801125137.GB19751@localhost>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Fabio Baltieri <fabio.baltieri@gmail.com>, kernel-janitors@vger.kernel.org, linux-can@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigECD8088CC41B270EAB26129A
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 08/01/2012 02:51 PM, Fengguang Wu wrote:
> Hi Fabio,
>=20
> Kernel build failed on
>=20
> tree:   git://gitorious.org/linux-can/linux-can-next master
> head:   272669c35de610ef75427d2f41b328a5e0f65bfc
> commit: 272669c35de610ef75427d2f41b328a5e0f65bfc [1/1] can: add tx/rx L=
ED trigger support
> config: i386-allmodconfig (attached as .config)
>=20
> All related error/warning messages:
>=20
> drivers/net/can/led.c: In function 'can_led_event':
> drivers/net/can/led.c:41:4: error: implicit declaration of function 'le=
d_trigger_blink_oneshot' [-Werror=3Dimplicit-function-declaration]

We have to delay the patch until rc1 or whatever is merged back to net-ne=
xt.

Or I will provide a temporary tree with current mainline as base.

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enigECD8088CC41B270EAB26129A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlAZMJgACgkQjTAFq1RaXHNrzQCfYdsYRCrLYeaTJ9GqJKyO+c3+
7SQAoI5EZkzwXw3hul7bRJEdZ07ExHbx
=SWDC
-----END PGP SIGNATURE-----

--------------enigECD8088CC41B270EAB26129A--
