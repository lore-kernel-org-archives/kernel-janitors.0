From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 08 Jun 2014 05:36:41 +0000
Subject: Re: [patch] Input: edt-ft5x06 - fix an i2c write for M09 support
Message-Id: <20140608053641.GB24310@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5393A60C.8040207@kernelconcepts.de>
In-Reply-To: <5393A60C.8040207@kernelconcepts.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Simon Budig <simon.budig@kernelconcepts.de>
Cc: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>, Henrik Rydberg <rydberg@euromail.se>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Fugang Duan <B38611@freescale.com>, Jingoo Han <jg1.han@samsung.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, Robert =?iso-8859-1?Q?W=F6rle?= <rwoerle@mibtec.de>

On Sun, Jun 08, 2014 at 01:53:48AM +0200, Simon Budig wrote:
> Hi all.
>=20
> I received notice from Robert W=F6rle who spotted a bug in the ft5x06
> driver (M09 support) which can result in bogus values being written into
> the configuration registers.
>=20
> Paul wrote:
> > I think i found the problem, as the driver sends 3 bytes instead of 2
> > when accessing a register on the M09 firmware.
> > Therefore , writing to gain seems to overflow into the offset register.
> >=20
> > This seems to be even in the lastet upstream driver so i created a patch
> > for this driver  which you find attached.
> >=20
> > @Simon Budig
> >=20
> > Find attached a patch to fix this edt driver bug, feel free to comment ,
> > test and commit upstream ;-)
>=20
> He is right, his fix is correct. Please include his patch into the
> repository.
>=20
> Acked-By: Simon Budig <simon.budig@kernelconcepts.de>

Applied, thank you.

>=20
> Thanks,
>         Simon
> --=20
>        Simon Budig                        kernel concepts GmbH
>        simon.budig@kernelconcepts.de      Sieghuetter Hauptweg 48
>        +49-271-771091-17                  D-57072 Siegen
>=20

> From 36b9ac0e8206efefc8795c925b0f3b63ab29fd08 Mon Sep 17 00:00:00 2001
> From: Robert Woerle <robert@linuxdevelopment.de>
> Date: Wed, 28 May 2014 13:22:09 +0200
> Subject: [PATCH] Input: edt-ft5x06 - fix i2c writes to 2 bytes on M09
>  firmware
>=20
> Signed-off-by: Robert Woerle <robert@linuxdevelopment.de>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touch=
screen/edt-ft5x06.c
> index f8815be..d4f3399 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -271,7 +271,7 @@ static int edt_ft5x06_register_write(struct edt_ft5x0=
6_ts_data *tsdata,
>  		wrbuf[0] =3D addr;
>  		wrbuf[1] =3D value;
> =20
> -		return edt_ft5x06_ts_readwrite(tsdata->client, 3,
> +		return edt_ft5x06_ts_readwrite(tsdata->client, 2,
>  					wrbuf, 0, NULL);
> =20
>  	default:
> --=20
> 1.7.9.5
>=20




--=20
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
