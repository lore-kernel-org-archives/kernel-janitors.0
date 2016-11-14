From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 14 Nov 2016 17:40:46 +0000
Subject: Re: [PATCH] mfd: bcm590xx: Simplify a test
Message-Id: <20161114174046.GB4094@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161101064905.11961-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161101064905.11961-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 01 Nov 2016, Christophe JAILLET wrote:

> 'i2c_new_dummy()' does not return an error pointer, so the test can be
> simplified to be more consistent.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mfd/bcm590xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> index 0d76d690176b..c572a35a9341 100644
> --- a/drivers/mfd/bcm590xx.c
> +++ b/drivers/mfd/bcm590xx.c
> @@ -67,7 +67,7 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pr=
i,
>  	/* Secondary I2C slave address is the base address with A(2) asserted */
>  	bcm590xx->i2c_sec =3D i2c_new_dummy(i2c_pri->adapter,
>  					  i2c_pri->addr | BIT(2));
> -	if (IS_ERR_OR_NULL(bcm590xx->i2c_sec)) {
> +	if (!bcm590xx->i2c_sec) {
>  		dev_err(&i2c_pri->dev, "failed to add secondary I2C device\n");
>  		return -ENODEV;
>  	}

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
