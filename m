From: Jean-Francois Moine <moinejf@free.fr>
Date: Wed, 02 May 2012 06:47:58 +0000
Subject: Re: [patch] [media] gspca: passing wrong length parameter to reg_w()
Message-Id: <20120502084758.1a08823f@tele>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120502061525.GC28894@elgon.mountain>
In-Reply-To: <20120502061525.GC28894@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2 May 2012 09:15:25 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This looks like a cut an paste error.  This is a two byte array but we
> use 8 as a length parameter.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is a static checker fix.  I don't own the hardware.
>=20
> diff --git a/drivers/media/video/gspca/conex.c b/drivers/media/video/gspc=
a/conex.c
> index ea17b5d..f39fee0 100644
> --- a/drivers/media/video/gspca/conex.c
> +++ b/drivers/media/video/gspca/conex.c
> @@ -306,7 +306,7 @@ static void cx_sensor(struct gspca_dev*gspca_dev)
> =20
>  	reg_w(gspca_dev, 0x0020, reg20, 8);
>  	reg_w(gspca_dev, 0x0028, reg28, 8);
> -	reg_w(gspca_dev, 0x0010, reg10, 8);
> +	reg_w(gspca_dev, 0x0010, reg10, 2);
>  	reg_w_val(gspca_dev, 0x0092, 0x03);
> =20
>  	switch (gspca_dev->cam.cam_mode[(int) gspca_dev->curr_mode].priv) {
> @@ -326,7 +326,7 @@ static void cx_sensor(struct gspca_dev*gspca_dev)
>  	}
>  	reg_w(gspca_dev, 0x007b, reg7b, 6);
>  	reg_w_val(gspca_dev, 0x00f8, 0x00);
> -	reg_w(gspca_dev, 0x0010, reg10, 8);
> +	reg_w(gspca_dev, 0x0010, reg10, 2);
>  	reg_w_val(gspca_dev, 0x0098, 0x41);
>  	for (i =3D 0; i < 11; i++) {
>  		if (i =3D 3 || i =3D 5 || i =3D 8)

Hi Dan,

Thanks for the patch. The bug is very very old (6 years, at least -
neither have I such a webcam).

Maybe the fix could have been

	reg_w(gspca_dev, 0x0010, reg10, sizeof reg10);

but it is OK for me.

Acked-by: Jean-Francois Moine <http://moinejf.free.fr>

--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
