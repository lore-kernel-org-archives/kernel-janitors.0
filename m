From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Jan 2012 05:39:19 +0000
Subject: Re: [patch] drm/nv50/pm: signedness bug in nv50_pm_clocks_pre()
Message-Id: <20120110053918.GB16258@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3uo+9/B/ebqu+fSQ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120104072047.GE30978@elgon.mountain>
	<4F0B780D.1080804@ensi-bourges.fr>
In-Reply-To: <4F0B780D.1080804@ensi-bourges.fr>
To: Martin Peres <martin.peres@ensi-bourges.fr>
Cc: kernel-janitors@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2012 at 12:28:13AM +0100, Martin Peres wrote:
> Le 04/01/2012 08:20, Dan Carpenter a =E9crit :
> >calc_mclk() returns zero on success and negative on failure but clk is
> >a u32.
> >
> >Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
> >
> >diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau=
/nv50_pm.c
> >index 0393721..3508de9 100644
> >--- a/drivers/gpu/drm/nouveau/nv50_pm.c
> >+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
> >@@ -540,7 +540,7 @@ nv50_pm_clocks_pre(struct drm_device *dev, struct no=
uveau_pm_level *perflvl)
> >  	info->mclk_hwsq.len =3D 0;
> >  	if (perflvl->memory) {
> >  		clk =3D calc_mclk(dev, perflvl->memory,&info->mclk_hwsq);
> >-		if (clk<  0) {
> >+		if ((int)clk<  0) {
> >  			ret =3D clk;
> >  			goto error;
> >  		}
> Well spotted Dan!
>=20
> Sorry for the late answer, was busy reworking this file for safe reclocki=
ng.
>=20
> I have a slightly different fix for that. Please tell me if It suits
> you: https://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commit/c1b80=
360ezd1aa7dd780ac383aae9437c66ef3b89

That link redirects to
https://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commits/master
and it doesn't show the patch.

But I wasn't a huge fan of adding the cast very much either so I'm
sure your patch is good.

regards,
dan carpenter

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPC88GAAoJEOnZkXI/YHqR8nsP/2E8L7Gdas9ozlMzjXzguxaP
8ROcwhXJTd10/I6FCyBw1SzBlQkYfZwdd+XqG0PXAf1QRBtbNaIcFO/wMAVajzS4
ZMAkq9MELNikQsB8FYAkErNQ2F0+ZjktVjdWxvx0oDcQHMGYj5JwFYGxCSy9ZgR3
r06aSaWjcfRHYsGRRsaGswqFoeOudPPRHt+xCDw1pKEjHwZ/p3yre1ahvxeW2hzX
H4dU17PrBgHO3LUzma45vBrMvh0RhNLgB50ckFZ87rmg81KyE+zb5wFr1x0+cKcY
faSzQKNrGmU1rBCQlS21PSV3kCJ7k+IHmpC/8wEsIAeQLYWevVUIm//Up7BGk7TQ
CifjzupkfSO+1j3sPHI2HX1aQaqw5NRjMN3spJEXMbi+2xmlZ6Iec0dS2j+ZGoMm
EJOdIZYIPU8iql3mhf2dsITQCxG/QacYo+f2M4vHQDrj4uyM7SFJMRMb2AmWw57E
L/8KkEpXDJOHUOIe29Bvuw4Rwz9/4WRSG4m8J6gSf4zqzCAQ4p6xt5u6yKDGukWW
GlHD/+lYB6IlhOzvd/Pt2Vlw0UcyooX4Q//7ss/DJ5+CZZB1AUMSx1KDeovsr6ks
NzGqJSiMQwFVbb+87ZF5Oqq8fbFn0BmUt6ZgrXhHDDSz32RitASQiA/afFy4jegi
HxLtYH9PnV/1k1UHdal1
=T3ub
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
