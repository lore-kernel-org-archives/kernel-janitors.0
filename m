From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 17 Jul 2017 11:00:56 +0000
Subject: Re: [PATCH 9/9] mfd: max8925-i2c: Drop unnecessary static
Message-Id: <20170717110056.q5fp3wvjoamov5c2@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
 <1493928654-18768-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1493928654-18768-10-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 04 May 2017, Julia Lawall wrote:

> Drop static on a local variable, when the variable is initialized before
> any use, on every possible execution path through the function.  The stat=
ic
> has no benefit, and dropping it reduces the code size.
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
>=20
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
>=20
> -static
>  T x@p;
>  ... when !=3D x
>      when strict
> ?x =3D e;
> // </smpl>
>=20
> The change in code size is indicates by the following output from the size
> command.
>=20
> before:
>    text    data     bss     dec     hex filename
>    2579     240      16    2835     b13 drivers/mfd/max8925-i2c.o
>=20
> after:
>    text    data     bss     dec     hex filename
>    2531     240       8    2779     adb drivers/mfd/max8925-i2c.o
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  drivers/mfd/max8925-i2c.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
> index 5c80aea..1006323 100644
> --- a/drivers/mfd/max8925-i2c.c
> +++ b/drivers/mfd/max8925-i2c.c
> @@ -151,7 +151,7 @@ static int max8925_probe(struct i2c_client *client,
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
