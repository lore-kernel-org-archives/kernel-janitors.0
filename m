From: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 01 Sep 2016 11:35:22 +0000
Subject: Re: [PATCH] rtc: constify rtc_class_ops structures
Message-Id: <20160901113522.GC18255@ulmo.ba.sec>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="hOcCNbCCxyk/YU74"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472630725-25465-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472630725-25465-1-git-send-email-Julia.Lawall@lip6.fr>
To: linux-arm-kernel@lists.infradead.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 10:05:25AM +0200, Julia Lawall wrote:
> Check for rtc_class_ops structures that are only passed to
> devm_rtc_device_register, rtc_device_register,
> platform_device_register_data, all of which declare the corresponding
> parameter as const.  Declare rtc_class_ops structures that have these
> properties as const.
>=20
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct rtc_class_ops i@p =3D { ... };
>=20
> @ok@
> identifier r.i;
> expression e1,e2,e3,e4;
> position p;
> @@
> (
> devm_rtc_device_register(e1,e2,&i@p,e3)
> |
> rtc_device_register(e1,e2,&i@p,e3)
> |
> platform_device_register_data(e1,e2,e3,&i@p,e4)
> )
>=20
> @bad@
> position p !=3D {r.p,ok.p};
> identifier r.i;
> @@
> i@p
>=20
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct rtc_class_ops i =3D { ... };
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
[...]
>  drivers/rtc/rtc-tegra.c      |    2 +-
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJXyBJ6AAoJEN0jrNd/PrOhhWwP/iRSPG7Hcx1dFammZmPkRgM4
gOsnIhTQnRVvCaMM2rH7ZhHoMoQX+/DX1LJYBmaDejyJfAqC2SxOOdKmTCIJsGcV
UUaaWtRlQUH/VZAAX+WqkHOW6TBA3cY+6ogKN8Htmpk0luiDX7ADJCv1m2edg2Kb
HQZdeNYB/7dO9HMa9sLi1CguxrMgVYPG53iv8Kj1E3Po7pQ+qX59PRVxUwbuiVcn
2H8FLdUoIuxt2M2M4EtVNx8mVpe37RTzR9zOwXRsc7R8v7pzpCT+aY3+R5cXNwhl
pp24pwd3C+cq6nDZ8pDOiyxVG2bcuZogXkKLeA142TEWYHSLa73iafunGAsBjR84
aUVkd7tNiFGheV73DtbAmIIC/8HpGKL+3o2xmCk+aUluD9xxs+DyWO7i3kJAD9q6
JVlVSCGxTnuRjH48NawvNKrnlXiabuo5yavwcxSq4uHenYBDDZ5AlLOV60BWhF2E
BUuY1TP0xSwq69vZcBwzrOCjJ/1dKtB3rixZiTGWO9juoQ7Qp4NMqSWuJ4pe4IgG
Pk+Y5UYRpeHe+5rQvdplKzDvdHoYY4jSe5lHrLlyGAy/NiRaITEyruGZyYQKEqVD
TuzYonHbypFaAVDzaMVtVvkqBw9W/kT8FhtDF4th997coqiL3e8lqgPJ3exGJV32
+RWfcKFRdlmGct9Kw4Iu
=5U2k
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
