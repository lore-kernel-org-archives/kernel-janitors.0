From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 26 Oct 2016 12:18:32 +0000
Subject: Re: [PATCH 06/15] mfd: tc3589x: improve function-level documentation
Message-Id: <20161026121832.GT8574@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
 <1475351192-27079-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 01 Oct 2016, Julia Lawall wrote:

> Use the correct function name in one case and adjust a variable name to
> that of the corresponding function parameter in another case.
>=20
> Issue detected using Coccinelle (http://coccinelle.lip6.fr/)
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  drivers/mfd/tc3589x.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
> index 274bf39..cc9e563 100644
> --- a/drivers/mfd/tc3589x.c
> +++ b/drivers/mfd/tc3589x.c
> @@ -53,7 +53,7 @@ int tc3589x_reg_read(struct tc3589x *tc3589x, u8 reg)
>  EXPORT_SYMBOL_GPL(tc3589x_reg_read);
> =20
>  /**
> - * tc3589x_reg_read() - write a single TC3589x register
> + * tc3589x_reg_write() - write a single TC3589x register
>   * @tc3589x:	Device to write to
>   * @reg:	Register to read
>   * @data:	Value to write
> @@ -118,7 +118,7 @@ int tc3589x_block_write(struct tc3589x *tc3589x, u8 r=
eg, u8 length,
>   * @tc3589x:	Device to write to
>   * @reg:	Register to write
>   * @mask:	Mask of bits to set
> - * @values:	Value to set
> + * @val:	Value to set
>   */
>  int tc3589x_set_bits(struct tc3589x *tc3589x, u8 reg, u8 mask, u8 val)
>  {
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
