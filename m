From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 23 Jan 2018 09:50:59 +0000
Subject: Re: [PATCH 2/2] mfd: smsc-ece1099: Improve a size determination in smsc_i2c_probe()
Message-Id: <20180123095059.bushkfuww6nyjvlo@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <978023d9-01f2-3a16-5eba-e06b8359cfc0@users.sourceforge.net>
 <721383c6-7d82-7911-989d-fb230038a52b@users.sourceforge.net>
In-Reply-To: <721383c6-7d82-7911-989d-fb230038a52b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 16 Jan 2018, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 16 Jan 2018 08:58:26 +0100
>=20
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/smsc-ece1099.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/mfd/smsc-ece1099.c b/drivers/mfd/smsc-ece1099.c
> index b9d96651cc0d..6681205dd2c0 100644
> --- a/drivers/mfd/smsc-ece1099.c
> +++ b/drivers/mfd/smsc-ece1099.c
> @@ -33,12 +33,10 @@ static const struct regmap_config smsc_regmap_config =
=3D {
>  static int smsc_i2c_probe(struct i2c_client *i2c,
>  			const struct i2c_device_id *id)
>  {
> -	struct smsc *smsc;
>  	int devid, rev, venid_l, venid_h;
>  	int ret;
> +	struct smsc *smsc =3D devm_kzalloc(&i2c->dev, sizeof(*smsc), GFP_KERNEL=
);

Please keep these separate.

> -	smsc =3D devm_kzalloc(&i2c->dev, sizeof(struct smsc),
> -				GFP_KERNEL);
>  	if (!smsc)
>  		return -ENOMEM;
> =20

--=20
Lee Jones
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
