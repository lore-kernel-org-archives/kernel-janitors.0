From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 04 Nov 2015 15:51:11 +0000
Subject: Re: [patch] bus: sunxi-rsb: unlock on error in sunxi_rsb_read()
Message-Id: <20151104155111.GU6114@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="szdyR02yM8NCQUEm"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151103220244.GA19280@mwanda>
In-Reply-To: <20151103220244.GA19280@mwanda>
To: linux-arm-kernel@lists.infradead.org


--szdyR02yM8NCQUEm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Nov 04, 2015 at 01:02:44AM +0300, Dan Carpenter wrote:
> Don't forget to unlock before returning an error code.
>=20
> Fixes: d787dcdb9c8f ('bus: sunxi-rsb: Add driver for Allwinner Reduced Se=
rial Bus')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I just queued this for 4.4, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--szdyR02yM8NCQUEm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWOilvAAoJEBx+YmzsjxAgfvgP/3nc/tw2+r7mKeVV3lkxxNec
xe6URF4NogJilH/d0W8ldtq0Wq+dPgU+8KawlhE8QCzUc8tZatttD5N7UtyD/JvA
qqZKHjfCc3vFcfa7mD8ebSISSF1hqHcK5OQeqfIqa4EnDeRUj3J3iSm62fefZaxz
nhzTFc/AsKJqCcCrfeau6NZsBbrd+pJSY71GvXJ9+8QBnoiELrmmg1WW7F4ZIzM5
cTcZ6WBUOPQgRgO+FNrxKdIW6uA5Kl/fba2EyeOxNpYGm+w50ck0edmjqyC6f6EY
AtiY5SOj2b3in+FuTvouRDTYPX0BRSUcoVY3EWQOL6BOox3Qj0cKW6UjHXJG5rJt
1JTVHMB3LtSTMJxlrFkOnleIrRgWhkZAw0gTKwriiXQZ6usjgrTyIu6ssjOTTCfm
o+u8KS2c+NKS2RiXF/Lx5a3QO6WrpQOyAEDNtltSiuqkk8Q/JJ8PtYBgUebcpkIV
AJfjTGtzzyfAwFTBCMzPlYuePVHTfQCFcQapcaF21SSVKw0XXqvsioSiSk2iOhUA
OICjPxbGQHQRCkMorJz4XSRehbnURL+0q/yGReeHaKrRwZmD2/0w251/2RNgcFkj
5kTRGgN2efCT1pph+Ur3SVFzyBK4gMxPt153qwQQ8luQoB4GTV1r33pYIfGR2t2I
uefKF0HPK6JJgBGKw9Rb
=cog5
-----END PGP SIGNATURE-----

--szdyR02yM8NCQUEm--
