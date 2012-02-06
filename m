From: Felipe Balbi <balbi@ti.com>
Date: Mon, 06 Feb 2012 08:17:08 +0000
Subject: Re: [patch] usb: dwc3: make dwc3_get_device_id() return the id
Message-Id: <20120206081707.GH15652@legolas.emea.dhcp.ti.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nOM8ykUjac0mNN89"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120204133714.GA4413@elgon.mountain>
In-Reply-To: <20120204133714.GA4413@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--nOM8ykUjac0mNN89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2012 at 09:09:09AM +0100, walter harms wrote:
>=20
>=20
> Am 06.02.2012 07:44, schrieb Felipe Balbi:
> > On Sat, Feb 04, 2012 at 04:37:14PM +0300, Dan Carpenter wrote:
> >> We always return zero instead of the id we found.
> >>
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
> > Applied, thanks
> >=20
> >> ---
> >> I don't have this hardware so it's not tested.
> >=20
> > This one is so obvious that I can't even believe we haven't seen that
> > before, thanks ;-)
> >=20
>=20
> i was wondering why the driver worked at all, do you realy need that ?

as of now we don't have usecases for that. But since it can work on
PCIe, I was thinking of building an automated testmachine with two of
those devices ;-)

--=20
balbi

--nOM8ykUjac0mNN89
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPL4yCAAoJEIaOsuA1yqREd8UP/R+s88BeZsPAgOdkBE16cTQJ
X6GI0smkBW2cKBbt1Ck3u+S0EOIE3DTS5FIWaW9sWcyU4U/F5QqRQv4lspYWc0DD
MT4IKi01tShIkS7yEMq2tm0yVZU5xgozi3E73EEODbfFvoIlYy8TtmVFCnJ1k/In
R+jgIRrSGOhlf8vCHJkl07zRUuxW9UJfWpXtqgZvK9LWpZjDZWtpiwXUoR6lTI1E
aHHOO9L3c+vYTxqVOA8cLXSCZH6Mhtgg03dTjionmmrLgUR7FPjUk4pCFcjPpw0Q
yhGIlBm2vg9ntFh8XIhARwCdfyjhMyOQys14uKT6mPWYe8vGFEw7Lnf98vfkRdHk
NnnoUs22Pq/pOUdomQJtCwvUS5YQ0ZDru7iCKcF98ycua2WKO02B0qMVOkEFkxHn
1Vy9g1TT/r4YYAQt8x+tRPHPd2LzGEjZ1+XVT9NTFL62zoqZCMVWQqVPlfFwYlv2
le4xk6xZdUMhR/mjuGAXlEDnoHf6TKbA2nYVKvqDMggYHyNlqm8528gio4kI6UZ1
MA3I+MvXldTwN5g9BJZI+cvI5/z7Vk637LeU3scoWxK52rz1couMlhwHU9MGySKf
/LdUOcOWe5yJ2BKrF5mJwNLSb89vCDjEoggWxd0xVdj9D2WEvA+Jp/N7s8+rCWHC
XSCCeWxsHaKaWDe+dkWV
=icbb
-----END PGP SIGNATURE-----

--nOM8ykUjac0mNN89--
