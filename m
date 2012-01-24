From: Felipe Balbi <balbi@ti.com>
Date: Tue, 24 Jan 2012 09:36:01 +0000
Subject: Re: [patch] usb: gadget: mv_udc: remove unneeded NULL check
Message-Id: <20120124093559.GO27414@legolas.emea.dhcp.ti.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jx/LfW4V5TfZLeq7"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120104072009.GD30978@elgon.mountain>
In-Reply-To: <20120104072009.GD30978@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--jx/LfW4V5TfZLeq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2012 at 10:20:09AM +0300, Dan Carpenter wrote:
> We've dereferenced req already, and we checked for bogus parameters at
> the start of the function.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

applied, thanks

--=20
balbi

--jx/LfW4V5TfZLeq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHnt/AAoJEIaOsuA1yqREeggQAK8JLoVTy+/iea32IZqWxFus
ryOgowYJRi8Bi1CaqOn4iREZYxeXVXC8dAWdjPGnCbFRGd8FUx8T3g9xJ3KEkxOX
wN/TAGi9nj5WvV57LBk9OZFBMQJ8jvO20G6sK9WwQ9nwtXdIAMVQyvVtsGFfNuqR
JigOrbPNVvRRFOU19gasSwoyHVthACyLIyHYJpOE1vspe3qJikUSdjYuHLZViZOg
FxcRSWi5esx5DaQ5b2lcAN5RyXX9oK0Uqi5OvAPV4vbDCSi+pzQ3Wyf+PoFbV1sp
3xYEKccKBKHrW+28QFTBIRXZ3GbM3h9ybkM36N/5NPlVDJDRbGJ4Nf2UCati40iI
CQi3viVqTQcSOCpY4/2ftguIZKA9loqTL6JA3jCOnKu5yKKpCu8vtz02UTWUYx6b
8I2OVzfaW+ZnDiwfODFr5Ym8h4hfCvdR+mJM+tfPT0GpooVILxNh+SamOt8DkL6f
Nr7L+fUuzbCDiWEkC3DvG4oeu+tn8WIrPLHMYxRsglclCv3Qz+V2VIOP4lmMpo5Q
22WvROeDlLpwcvSfeEAtIs8rNPKmU3EtzbC/dghVbhq6EIkPbOMSoT8fiZxssJTx
ym1MNOfeHgoFnFscRxOjBX8himjqDTEWohagD2717lUk5fJWo7hbG9L/b7ndHask
fAv0BR9A3Fz7ilAshFp/
=BNLl
-----END PGP SIGNATURE-----

--jx/LfW4V5TfZLeq7--
