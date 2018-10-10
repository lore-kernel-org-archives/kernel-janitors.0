From: Quentin Schulz <quentin.schulz@bootlin.com>
Date: Wed, 10 Oct 2018 12:09:44 +0000
Subject: Re: [bug report] net: phy: mscc: migrate to phy_select/restore_page functions
Message-Id: <20181010120944.g44hihhrfo6x4zjo@qschulz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zqsjivwayf43xh57"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181010110431.GA21125@mwanda>
In-Reply-To: <20181010110431.GA21125@mwanda>
To: kernel-janitors@vger.kernel.org


--zqsjivwayf43xh57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Oct 10, 2018 at 02:04:31PM +0300, Dan Carpenter wrote:
> Hello Quentin Schulz,
>=20
> The patch 6a0bfbbe20b0: "net: phy: mscc: migrate to
> phy_select/restore_page functions" from Oct 8, 2018, leads to the
> following static checker warning:
>=20
> 	drivers/net/phy/mscc.c:529 vsc85xx_downshift_get()
> 	warn: impossible condition '(reg_val < 0) =3D> (0-u16max < 0)'
>=20
> drivers/net/phy/mscc.c
>    523  static int vsc85xx_downshift_get(struct phy_device *phydev, u8 *c=
ount)
>    524  {
>    525          u16 reg_val;
>                 ^^^^^^^^^^^^
>    526 =20
>    527          reg_val =3D phy_read_paged(phydev, MSCC_PHY_PAGE_EXTENDED,
>    528                                   MSCC_PHY_ACTIPHY_CNTL);
>    529          if (reg_val < 0)
>                     ^^^^^^^^^^^
> Impossible
>=20
>    530                  return reg_val;
>    531 =20
>    532          reg_val &=3D DOWNSHIFT_CNTL_MASK;
>    533          if (!(reg_val & DOWNSHIFT_EN))
>    534                  *count =3D DOWNSHIFT_DEV_DISABLE;
>    535          else
>    536                  *count =3D ((reg_val & ~DOWNSHIFT_EN) >> DOWNSHIF=
T_CNTL_POS) + 2;
>    537 =20
>    538          return 0;
>    539  }
>=20
>=20

A patch has already been suggested.

Thanks,
Quentin

--zqsjivwayf43xh57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlu97AgACgkQhLiadT7g
8aNOOQ/+NR2XcJ1yFs6IBPkD3TrmzTIR5ZFE9AoV+CRg6sHJwEJnjF2ceWC6uuxn
d3anC6iTyT5vuZE6mZRJJ2QeBsB/LUTqnzFBR/PdIAg7vfcuNOOG5WthhY3jpWF8
RtdAbQ5+JPXt4s4TGHmfKRGPPYURI70LyTt76RgpIvK3O2OwpoWkXAOLSbOC1lz0
UGigK2YlJ6a1Gyz2FvN5ZfMpbwLn2p99k4Ffkx/7SzzF+8HKFpHNPAzrce4KsInj
rhlUnWKDz7bh8vz19i3+gPpHzMz0Crq+JFl/dklEHi4xOUu/JrYTZNUuc4AX+Ou7
whFkkZtoewaSLstD83oy5Y4AOMoC8lTrB4NzwtM8E6v9+t8MuPJholIaMLkVgZG1
+x3sEyeujVO0qribxcmkMUEKzsWNxWNrO/VGXVnlo080II3xX2kh9xuTFXuaAYqe
3Qtf9p7/GhD0VYrFklakItWsWgqXVS77jjvTWTYRTxw6utlRaeh5pdHTQfUBq9b8
uuEmdEaM3cgftIsg4spBkOtd0Whtwg99xv7QuMTVfGwkLXXffS2h6RZKNDHqz/Ef
+2863QmkYlBvfH1+V2MSOfcNgK5IXVVNzR9xka5JH1LT0+5QQJ5IrBbM75W75YeA
06C0+47tKK9N0WP+xLVSMTRIlmQyznMaly1z+nBYoe3HsiwABEE=
=OB/t
-----END PGP SIGNATURE-----

--zqsjivwayf43xh57--
