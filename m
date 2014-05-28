From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 28 May 2014 15:20:11 +0000
Subject: Re: [PATCH] mfd: fix unintentional NULL check in menelaus_set_voltage()
Message-Id: <20140528152011.GB1954@lee--X1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401284030-9650-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1401284030-9650-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Emil Goode <emilgoode@gmail.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 28 May 2014, Emil Goode wrote:

> The struct menelaus_vtg pointer vtg cannot be NULL here
> so the condition is never true and if it ever was true
> it would lead to a NULL pointer dereference when we goto
> label set_voltage.
>=20
> Before the below patch was applied the code was:
>=20
> if (vtg =3D 0)
>=20
> The intention was to check if vtg_val is 0.
>=20
> commit 59a9f7a32adf6537b4e4db8ca204eeb77d7a634e
> ("mfd: menelaus: Use NULL instead of 0")
>=20
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
> Hello,
>=20
> This is only build tested, it would be good to get a comment
> from someone who is familiar with this code.
>=20
> Found using coccinelle.
>=20
> Best regards,
>=20
> Emil Goode
>=20
>  drivers/mfd/menelaus.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
> index ad25bfa..4859597 100644
> --- a/drivers/mfd/menelaus.c
> +++ b/drivers/mfd/menelaus.c
> @@ -466,7 +466,7 @@ static int menelaus_set_voltage(const struct menelaus=
_vtg *vtg, int mV,
>  	struct i2c_client *c =3D the_menelaus->client;
> =20
>  	mutex_lock(&the_menelaus->lock);
> -	if (!vtg)
> +	if (vtg_val =3D 0)

I would prefer:

  if (!vtg_val)

>  		goto set_voltage;
> =20
>  	ret =3D menelaus_read_reg(vtg->vtg_reg);

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
