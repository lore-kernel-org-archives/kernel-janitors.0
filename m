From: =?ISO-8859-1?Q?Erik_Andr=E9n?= <erik.andren@gmail.com>
Date: Sat, 01 Aug 2009 12:32:29 +0000
Subject: Re: [PATCH 3/10] drivers/media/video/gspca: introduce missing kfree
Message-Id: <4A7435DD.8070801@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908011053140.23408@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908011053140.23408@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: frank@zago.net, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>=20
> Error handling code following a kmalloc should free the allocated data.
>=20
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>=20
> // <smpl>
> @r exists@
> local idexpression x;
> statement S;
> expression E;
> identifier f,f1,l;
> position p1,p2;
> expression *ptr !=3D NULL;
> @@
>=20
> x@p1 =3D \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x =3D NULL) S
> <... when !=3D x
>      when !=3D if (...) { <+...x...+> }
> (
> x->f1 =3D E
> |
>  (x->f1 =3D NULL || ...)
> |
>  f(...,x->f1,...)
> )
> ...>
> (
>  return \(0\|<+...x...+>\|ptr\);
> |
>  return@p2 ...;
> )
>=20
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
>=20
> print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].li=
ne)
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Erik Andr=E9n <erik.andren@gmail.com>
> ---
>  drivers/media/video/gspca/m5602/m5602_s5k83a.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/media/video/gspca/m5602/m5602_s5k83a.c b/drivers/med=
ia/video/gspca/m5602/m5602_s5k83a.c
> index 7127321..6b89f33 100644
> --- a/drivers/media/video/gspca/m5602/m5602_s5k83a.c
> +++ b/drivers/media/video/gspca/m5602/m5602_s5k83a.c
> @@ -178,8 +178,10 @@ sensor_found:
> =20
>  	sens_priv->settings >  	kmalloc(sizeof(s32)*ARRAY_SIZE(s5k83a_ctrls), G=
FP_KERNEL);
> -	if (!sens_priv->settings)
> +	if (!sens_priv->settings) {
> +		kfree(sens_priv);
>  		return -ENOMEM;
> +	}
> =20
>  	sd->gspca_dev.cam.cam_mode =3D s5k83a_modes;
>  	sd->gspca_dev.cam.nmodes =3D ARRAY_SIZE(s5k83a_modes);
> --

Is this patch already merged into a tree that will be merged in the
upstream one or should the v4l-dvb tree merge it?

Best regards,
Erik

> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
