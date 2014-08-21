From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 21 Aug 2014 08:20:49 +0000
Subject: Re: [PATCH 2/4] mfd: twl6040: fix error return code
Message-Id: <20140821082049.GR4266@lee--X1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407355938-10932-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407355938-10932-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 06 Aug 2014, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Convert a zero return value on error to a negative one, as returned
> elsewhere in the function.
>=20
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret !=3D 0\))
>  { ... return ret; }
> |
> ret@p1 =3D 0
> )
> ... when !=3D ret =3D e1
>     when !=3D &ret
> *if(...)
> {
>   ... when !=3D ret =3D e2
>       when forall
>  return ret;
> }
>=20
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  drivers/mfd/twl6040.c |    1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

> diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
> index f9c06c5..9687645 100644
> --- a/drivers/mfd/twl6040.c
> +++ b/drivers/mfd/twl6040.c
> @@ -679,6 +679,7 @@ static int twl6040_probe(struct i2c_client *client,
>  	if (twl6040->rev < 0) {
>  		dev_err(&client->dev, "Failed to read revision register: %d\n",
>  			twl6040->rev);
> +		ret =3D twl6040->rev;
>  		goto gpio_err;
>  	}
> =20
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
