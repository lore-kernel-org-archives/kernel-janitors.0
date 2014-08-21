From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 21 Aug 2014 08:26:05 +0000
Subject: Re: [PATCH 1/4] mfd: menelaus: fix error return code
Message-Id: <20140821082605.GS4266@lee--X1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407355938-10932-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407355938-10932-2-git-send-email-Julia.Lawall@lip6.fr>
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
>  drivers/mfd/menelaus.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
> index 5e2667a..16070d8 100644
> --- a/drivers/mfd/menelaus.c
> +++ b/drivers/mfd/menelaus.c
> @@ -1240,8 +1240,10 @@ static int menelaus_probe(struct i2c_client *clien=
t,
>  	pr_info("Menelaus rev %d.%d\n", rev >> 4, rev & 0x0f);
> =20
>  	val =3D menelaus_read_reg(MENELAUS_VCORE_CTRL1);
> -	if (val < 0)
> +	if (val < 0) {
> +		err =3D val;
>  		goto fail;
> +	}

I'd prefer it if you could s/val/err and remove val altogether.  While
you're there, if you can s/(1 << 7)/BIT(7), that would be great
too.  If you don't have time, or just don't want to do it, I will be
happy to submit a patch instead with your Reported-by.  Your call.

>  	if (val & (1 << 7))
>  		menelaus->vcore_hw_mode =3D 1;
>  	else
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
