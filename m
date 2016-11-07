From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 07 Nov 2016 15:10:05 +0000
Subject: Re: [PATCH] drm/sun4i: Propagate error to the caller
Message-Id: <20161107151005.7sobo4hn2hr6vfwv@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6zrj5kcwiywks2iu"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161104061352.12596-1-christophe.jaillet@wanadoo.fr>
 <20161107011957.GK3327@joana>
In-Reply-To: <20161107011957.GK3327@joana>
To: Gustavo Padovan <gustavo@padovan.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, wens@csie.org, airlied@linux.ie, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org


--6zrj5kcwiywks2iu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 10:19:57AM +0900, Gustavo Padovan wrote:
> Hi Christophe,
>=20
> 2016-11-04 Christophe JAILLET <christophe.jaillet@wanadoo.fr>:
>=20
> > If 'sun4i_layers_init()' returns an error, propagate it instead of
> > returning -EINVAL unconditionally.
> >=20
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6zrj5kcwiywks2iu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIJlNAAoJEBx+YmzsjxAgFxgP/0Ry6Yzz5Icq3iNpcfUQ6n2M
Oi14bjM+b91FSQOcxxHZHfZsnTFEgivotFxAVqXLKWE0KmimGypF79I4xPcUge8e
x3pC3Z9O3vcxVTYLRD2O0mJF0pGgEwTkCs4i2ns5NKHFpk1hVRF+tERDlypb5Ag9
pKOf8qTyQHUsuj5FesqmY9jVcpy2jF5bV+k9K8aYmFrB0OgKj8dDsEL497teckMy
cxhzW2pB8Qr+vEpxVtm3NQqkbis3NMIdvIlq+kp7/2t/+XN66YttFmWiKeo0HNZ+
9AD8u6lIwkGtqYKXNalK7zGO+sG/to+Y8UtTebobkF4c8KsA/PRz5z9jM2tcREbL
mKKa8OWmoPeTsc3iD9QCmGCO8PXSwZ0VaTXULXsPnTbnAo3/LOlf6zJGh5um5GT6
fUUAHkSsoXQebFZVCRuyNzBfej9DPIVzcxHZvz3WWcf3S02W3emuGCltuc6rlTJz
qsMdwZ2TEcocrCGKSpGHIqLcuf2HHB/JDqjeYfg93MlY7e9MsoeXPaKQjK/wIRrI
GyWfNeAgrU0P0bZIbsY/ZJLBzT5ZAarJqog2OIX5zUVptAENZBs98aOC7ciGTm+1
QwEufZGSLcZnavEyhbuVHLzWNnUdAha8l7d12KJ5KRA+U407GGLJ+3mChRpoEi/1
FkHI7S/HgxdQDMvr9GxP
=f8y/
-----END PGP SIGNATURE-----

--6zrj5kcwiywks2iu--
