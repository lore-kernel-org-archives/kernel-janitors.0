From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Dec 2020 13:39:27 +0000
Subject: Re: [PATCH v3] regmap: debugfs: Fix a memory leak when calling regmap_attach_dev
Message-Id: <20201230133927.GD4428@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2Z2K0IlrPCVsbNpk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201229105046.41984-1-xiaolei.wang@windriver.com>
 <d516efdd-7e66-13fe-3798-cdea5ff012dc@web.de>
 <PH0PR11MB5077EC74C0A81ABF8F082BC795D70@PH0PR11MB5077.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB5077EC74C0A81ABF8F082BC795D70@PH0PR11MB5077.namprd11.prod.outlook.com>
To: "Wang, Xiaolei" <Xiaolei.Wang@windriver.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Lechner <david@lechnology.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2020 at 10:14:22AM +0000, Wang, Xiaolei wrote:
> Hi Markus
>=20
> Thank you very much, very good suggestion, do I need to re-send a patch t=
o fix this problem, or modify the previous patch and send it again?

Please feel free to ignore Markus.

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/sgw4ACgkQJNaLcl1U
h9CyNwf9EDK99jUBj3cRoPF87/iQOCwAunHmFz4I5n9mpCIYg264KCgOLSqUCDM7
U0sY5o0G3vxQqqoZsAMtTDgyTimscRCjXch3wrTrB7J8KJA1j8twUCYWtIpFECn3
nQ2g2QtlMky581G8/SM7LieziVp+cY83eJS4f3R//dZBINmyQWLe1JYcB3MABkTd
6Dov+4dn0msCL7xs65PYBz9HSVJX8z75uemS3bbJIYLUKiAuC0K1auOK6PxTOaBT
P4K+quQ8zj/8UHDdBWIiIM+lF6lgaNrqr5V+v0EzV8TrCKBGBqaiyCx/lBDrpEKs
NwT2skl91yKqscQpcc+EABdcC+OzFg==
=Goo3
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
