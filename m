From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 25 Apr 2016 11:00:21 +0000
Subject: Re: [patch v2] mfd: wm8400-core: delete wm8400_reg_read()
Message-Id: <20160425110021.GD2713@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414100135.GS31814@localhost.localdomain>
 <20160415144418.GA8953@mwanda>
In-Reply-To: <20160415144418.GA8953@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

On Fri, 15 Apr 2016, Dan Carpenter wrote:

> There was a static checker warning in wm8400_reg_read() because we were
> returning u16 and that can't hold the negative error codes.  The
> function isn't used, so let's just delete it.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: just delete the function

No diff?

I've fixed the $SUBJECT line and applied the patch.

> diff --git a/include/linux/mfd/wm8400-private.h b/include/linux/mfd/wm840=
0-private.h
> index 2de565b..4ee908f 100644
> --- a/include/linux/mfd/wm8400-private.h
> +++ b/include/linux/mfd/wm8400-private.h
> @@ -923,7 +923,6 @@ struct wm8400 {
>  #define WM8400_LINE_CMP_VTHD_SHIFT                   0  /* LINE_CMP_VTHD=
 - [3:0] */
>  #define WM8400_LINE_CMP_VTHD_WIDTH                   4  /* LINE_CMP_VTHD=
 - [3:0] */
> =20
> -u16 wm8400_reg_read(struct wm8400 *wm8400, u8 reg);
>  int wm8400_block_read(struct wm8400 *wm8400, u8 reg, int count, u16 *dat=
a);
> =20
>  static inline int wm8400_set_bits(struct wm8400 *wm8400, u8 reg,
> diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
> index 3bd44a4..c1adfc1 100644
> --- a/drivers/mfd/wm8400-core.c
> +++ b/drivers/mfd/wm8400-core.c
> @@ -35,27 +35,6 @@ static bool wm8400_volatile(struct device *dev, unsign=
ed int reg)
>  	}
>  }
> =20
> -/**
> - * wm8400_reg_read - Single register read
> - *
> - * @wm8400: Pointer to wm8400 control structure
> - * @reg:    Register to read
> - *
> - * @return  Read value
> - */
> -u16 wm8400_reg_read(struct wm8400 *wm8400, u8 reg)
> -{
> -	unsigned int val;
> -	int ret;
> -
> -	ret =3D regmap_read(wm8400->regmap, reg, &val);
> -	if (ret < 0)
> -		return ret;
> -
> -	return val;
> -}
> -EXPORT_SYMBOL_GPL(wm8400_reg_read);
> -
>  int wm8400_block_read(struct wm8400 *wm8400, u8 reg, int count, u16 *dat=
a)
>  {
>  	return regmap_bulk_read(wm8400->regmap, reg, data, count);

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
