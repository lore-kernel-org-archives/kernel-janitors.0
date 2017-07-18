From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 18 Jul 2017 07:23:11 +0000
Subject: Re: [PATCH 11/11] mfd: max8925-i2c: Drop unnecessary static
Message-Id: <20170718072311.p4ccoamacxcolc23@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
 <1500149266-32357-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500149266-32357-12-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 15 Jul 2017, Julia Lawall wrote:

> Drop static on a local variable, when the variable is initialized before
> any possible use.  Thus, the static has no benefit.
>=20
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
> static T x@p;
> ...
> x =3D <+...x...+>
>=20
> @@
> identifier x;
> expression e;
> type T;
> position p !=3D bad.p;
> @@
> -static
>  T x@p;
>  ... when !=3D x
>      when strict
> ?x =3D e;
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
> These patches are all independent of each other.
>=20
>  drivers/mfd/max8925-i2c.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff -u -p a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
> --- a/drivers/mfd/max8925-i2c.c
> +++ b/drivers/mfd/max8925-i2c.c
> @@ -151,7 +151,7 @@ static int max8925_probe(struct i2c_clie
>  				   const struct i2c_device_id *id)
>  {
>  	struct max8925_platform_data *pdata =3D dev_get_platdata(&client->dev);
> -	static struct max8925_chip *chip;
> +	struct max8925_chip *chip;
>  	struct device_node *node =3D client->dev.of_node;
> =20
>  	if (node && !pdata) {
>=20

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
