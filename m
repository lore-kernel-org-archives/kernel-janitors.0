From: Quentin Schulz <quentin.schulz@bootlin.com>
Date: Wed, 10 Oct 2018 12:10:06 +0000
Subject: Re: [bug report] phy: add driver for Microsemi Ocelot SerDes muxing
Message-Id: <20181010121006.ytm3rt4zsncfdkcz@qschulz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vfzob7jzazctlmd4"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181010104823.GA15888@mwanda>
In-Reply-To: <20181010104823.GA15888@mwanda>
To: kernel-janitors@vger.kernel.org


--vfzob7jzazctlmd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Wed, Oct 10, 2018 at 01:48:23PM +0300, Dan Carpenter wrote:
> Hello Quentin Schulz,
>=20
> The patch 51f6b410fc22: "phy: add driver for Microsemi Ocelot SerDes
> muxing" from Oct 4, 2018, leads to the following static checker
> warning:
>=20
> 	drivers/phy/mscc/phy-ocelot-serdes.c:210 serdes_simple_xlate()
> 	error: buffer overflow 'ctrl->phys' 8 <=3D 8
>=20
> drivers/phy/mscc/phy-ocelot-serdes.c
>    197  static struct phy *serdes_simple_xlate(struct device *dev,
>    198                                         struct of_phandle_args *ar=
gs)
>    199  {
>    200          struct serdes_ctrl *ctrl =3D dev_get_drvdata(dev);
>    201          unsigned int port, idx, i;
>    202 =20
>    203          if (args->args_count !=3D 2)
>    204                  return ERR_PTR(-EINVAL);
>    205 =20
>    206          port =3D args->args[0];
>    207          idx =3D args->args[1];
>    208 =20
>    209          for (i =3D 0; i <=3D SERDES_MAX; i++) {
>                               ^^
> Should this be < ?
>=20
>    210                  struct serdes_macro *macro =3D phy_get_drvdata(ct=
rl->phys[i]);
>                                                                      ^^^^=
^^^^^^^^^
> Or is this array too small?
>=20
>    211 =20
>    212                  if (idx !=3D macro->idx)
>    213                          continue;
>    214 =20
>    215                  /* SERDES6G(0) is the only SerDes capable of QSGM=
II */
>    216                  if (idx !=3D SERDES6G(0) && macro->port >=3D 0)
>    217                          return ERR_PTR(-EBUSY);
>    218 =20
>    219                  macro->port =3D port;
>    220                  return ctrl->phys[i];
>    221          }
>    222 =20
>    223          return ERR_PTR(-ENODEV);
>    224  }
>=20

A patch has already been suggested.

Thanks,
Quentin

--vfzob7jzazctlmd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlu97B0ACgkQhLiadT7g
8aMVjQ/+OXR6ELF3H9+M/U8tjhE4UbFu9IZ5CTjnPiukRlMuATydgfXAkdAwyfjq
alheXq0GhBkeH2ZikuTRd0jKt/bOBCvskcr5hzOhW28sJvtNOuyzJ274QmvXNjPY
RRPkIrnPYG3hNKC/H55UkNaPx4AdfmLuzKWFlROvPhmD0M3YXLsgb/04eM9HIVdj
NbHNJJnrCV7gINlXs1CCcc5ffMd04oU05OlSMrFeWheij/Rq4cuImyc2e+VtH+TZ
7R+cxRbIoWmMmvYJTFUdV8kRCo7k9AA8+64813I45J0jDEiqnp1FTM4BPdEKSOI5
6YJM3516h9yDkMzAKgdB4mTStBeMnUkaJ2G5NUiaaGglz6TYQ11HfO4Iu0exzfh2
XPLVGkpsc4KgzA5sqxAeEFL84IT/2ZfoiCa9F/RLtT+8OKlwRFX0em8yjOiJv2Wg
OyTaOy/95epF1UdvphSk7i/a+Oou8Y4kuvQf9HPODeOeu3Ppzg3F1Sdx+RnwbvNz
ntvILqkfAPetBxLe72S/9CFi/eLpZ9vWIMxPK8kAVWRpROCJ/4cSMdraF9jT47E/
xJ6Ywth7t24hjHHZ/uIuOg2DJYoJRjZsb6tT/ZMFzvBQOUc7oLBVLzcGbzn2SNjC
oY7JX8wa0hse7kh17t/pWQs9u1CX6wDD8wlmY7Rci0MjHfyk2D4=
=M4MZ
-----END PGP SIGNATURE-----

--vfzob7jzazctlmd4--
