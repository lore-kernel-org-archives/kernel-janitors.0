From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 17 Jul 2017 12:21:20 +0000
Subject: Re: [PATCH] mfd: Fix potential NULL pointer dereference
Message-Id: <20170717122120.uxevckop5mgzttid@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170705055054.8022-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170705055054.8022-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 05 Jul 2017, Christophe JAILLET wrote:

> if 'max8998_i2c_parse_dt_pdata() fails (when out of memory), a NULL
> pointer dereference will occur in the error handling code.
>=20
> Return directly instead.
>=20
> Fixes: ee999fb3f17f("mfd: max8998: Add support for Device Tree")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mfd/max8998.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
> index 4c33b8063bc3..b1d3f70782d9 100644
> --- a/drivers/mfd/max8998.c
> +++ b/drivers/mfd/max8998.c
> @@ -192,10 +192,8 @@ static int max8998_i2c_probe(struct i2c_client *i2c,
> =20
>  	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node) {
>  		pdata =3D max8998_i2c_parse_dt_pdata(&i2c->dev);
> -		if (IS_ERR(pdata)) {
> -			ret =3D PTR_ERR(pdata);
> -			goto err;
> -		}
> +		if (IS_ERR(pdata))
> +			return PTR_ERR(pdata);
>  	}
> =20
>  	i2c_set_clientdata(i2c, max8998);

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
