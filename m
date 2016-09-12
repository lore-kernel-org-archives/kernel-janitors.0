From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 12 Sep 2016 10:00:37 +0000
Subject: Re: [PATCH 2/6] mfd: sm501: constify gpio_chip structures
Message-Id: <20160912100037.GE1873@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473596082-32690-1-git-send-email-Julia.Lawall@lip6.fr>
 <1473596082-32690-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473596082-32690-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 11 Sep 2016, Julia Lawall wrote:

> These structures are only used to copy into other structures, so declare
> them as const.
>=20
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct gpio_chip i@p =3D { ... };
>=20
> @ok@
> identifier r.i;
> expression e;
> position p;
> @@
> e =3D i@p;
>=20
> @bad@
> position p !=3D {r.p,ok.p};
> identifier r.i;
> struct gpio_chip e;
> @@
> e@i@p
>=20
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct gpio_chip i =3D { ... };
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  drivers/mfd/sm501.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> index 65cd0d2..4053435 100644
> --- a/drivers/mfd/sm501.c
> +++ b/drivers/mfd/sm501.c
> @@ -1001,7 +1001,7 @@ static int sm501_gpio_output(struct gpio_chip *chip,
>  	return 0;
>  }
> =20
> -static struct gpio_chip gpio_chip_template =3D {
> +static const struct gpio_chip gpio_chip_template =3D {
>  	.ngpio			=3D 32,
>  	.direction_input	=3D sm501_gpio_input,
>  	.direction_output	=3D sm501_gpio_output,
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
