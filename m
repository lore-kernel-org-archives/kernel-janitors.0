From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Date: Thu, 08 Jun 2017 12:19:40 +0000
Subject: Re: [PATCH v3 1/1] w1: Add subsystem kernel public interface
Message-Id: <20170608121940.wydtrbstglx7tcdx@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="w75hdmww45hzsc7d"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170605135208.24807-1-afd@ti.com>
 <20170605135208.24807-2-afd@ti.com>
 <56941496682285@web32j.yandex.ru>
In-Reply-To: <56941496682285@web32j.yandex.ru>
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: "Andrew F. Davis" <afd@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--w75hdmww45hzsc7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 05, 2017 at 08:04:45PM +0300, Evgeniy Polyakov wrote:
> 05.06.2017, 16:52, "Andrew F. Davis" <afd@ti.com>:
> > Like other subsystems we should be able to define slave devices outside
> > of the w1 directory. To do this we move public facing interface
> > definitions to include/linux/w1.h and rename the internal definition
> > file to w1_internal.h.
> >
> > As w1_family.h and w1_int.h contained almost entirely public
> > driver interface definitions we simply removed these files and
> > moved the remaining definitions into w1_internal.h.
> >
> > With this we can now start to move slave devices out of w1/slaves and
> > into the subsystem based on the function they implement, again like
> > other drivers.
> >
> > Signed-off-by: Andrew F. Davis <afd@ti.com>
> > Reviewed-by: Sebastian Reichel <sre@kernel.org>
>=20
> Thank you, looks good to me.
>=20
> Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
>=20
> Greg, please pull it into your tree

It would be nice, if I can get an immutable branch for
the power-supply subsystem to ease merge process of
MAX1721x driver.

-- Sebastian

--w75hdmww45hzsc7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlk5QNkACgkQ2O7X88g7
+pqllRAAifIyErAxm8OnEhk4S+r82KSUXCj4Ifjwsyrj2u0E9ydpKgRPazWknyrT
HYINuJr+tirAsdBOyWIrDvnhBTWPiOaRjluQLq4PonE5ZJwj36GAh+aj4OauqYZM
OBWfB+/4NM6gNNeuLHhuIp3kAIJdS+HxInmzn2DqScLH0HpPrMBaY6d6ZtL8wTdV
6h5/uFzr3s04HuHJ9Tbat2b58GT2V/gx/WR6AqYXyLW5IT9gUtktFhJ0tHNDjApe
PPRre/Y6CSeLDeumnR6XtNHMLLiB4UNeBqXzGj47Z4FN1xc0iO80mQOb7YDYUqdr
3mkBltmO3WVr4fL3uAXgQlfBnCvFyIjxBt6lIlfzMmNoyERl2fScJfVY2j1fgUGj
9zVT6Ui2Ns92sug8Agytv+3QBGtyr/ici2o97c2PyeOXpdL1/DWGIGV05xeBHACM
iucgzt9t9z0j24LazecCNrG3pBHbFcBpBbJmov2BcNTH8XseY1S/i2XwMKrnlR14
UqlKUlsIf2TVVpC4cGLBWl+4sCEKK0DHHB/k5GeKGdL6jb/j4Fc1eRF2Lv14/KTZ
HdBs4XXZrCaYo6sCZnY3jaIMoGmGXZskcK7I+VMOa1pTh7lJKK2y8QgQefg4V7iW
UdlhtlutGf5AwHaehY7po/wpmdjgmdd0J4AQYdzxgQWDjQzFQrY=
=MEZs
-----END PGP SIGNATURE-----

--w75hdmww45hzsc7d--
