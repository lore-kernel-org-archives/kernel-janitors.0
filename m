From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 11 Jan 2016 08:15:46 +0000
Subject: Re: [PATCH 1/2] mfd: smsc-ece1099: Delete an unnecessary variable initialisation in smsc_i2c_probe()
Message-Id: <20160111081546.GA14104@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682957F.5000604@users.sourceforge.net>
 <568295DD.3090809@users.sourceforge.net>
In-Reply-To: <568295DD.3090809@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, 29 Dec 2015, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 29 Dec 2015 14:47:40 +0100
>=20
> The variable "ret" will be set to an appropriate value a bit later.
> Thus let us omit the explicit initialisation at the beginning.

Not sure this change is worth your or my time to be frank.  I could
understand if you were a first time submitter who was dipping their
toe in the water, but for someone with 200+ patches, I really think
you should be focusing on less trivial matters.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/smsc-ece1099.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/smsc-ece1099.c b/drivers/mfd/smsc-ece1099.c
> index a4c0df7..bcac488 100644
> --- a/drivers/mfd/smsc-ece1099.c
> +++ b/drivers/mfd/smsc-ece1099.c
> @@ -36,7 +36,7 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
>  {
>  	struct smsc *smsc;
>  	int devid, rev, venid_l, venid_h;
> -	int ret =3D 0;
> +	int ret;
> =20
>  	smsc =3D devm_kzalloc(&i2c->dev, sizeof(struct smsc),
>  				GFP_KERNEL);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
