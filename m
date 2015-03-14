From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 14 Mar 2015 05:22:20 +0000
Subject: Re: [PATCH v2] staging: panel: change struct bits to a bit array
Message-Id: <5503C58C.7050203@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426288836-25749-1-git-send-email-illeida@openaliasbox.org>
In-Reply-To: <1426288836-25749-1-git-send-email-illeida@openaliasbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Le 14/03/2015 00:20, Isaac Lleida a =E9crit :
>  =20
>   /*
> + * LCD signal states
> + */
> +#define LCD_BIT_E_MASK		0x1	/* E (data latch on falling edge) */
> +#define LCD_BIT_RS_MASK		0x2	/* RS  (0 =3D cmd, 1 =3D data) */
> +#define LCD_BIT_RW_MASK		0x4	/* R/W (0 =3D W, 1 =3D R) */
> +#define LCD_BIT_BL_MASK		0x8	/* backlight (0 =3D off, 1 =3D on) */
> +#define LCD_BIT_CL_MASK		0x10	/* clock (latch on rising edge) */
> +#define LCD_BIT_DA_MASK		0x20	/* data */
> +
> +/*
> + * Bit array operations
> + */
> +#define BIT_ON(b, m)	(b |=3D m)
> +#define BIT_OFF(b, m)	(b &=3D ~m)
> +#define BIT_CHK(b, m)	(b & m)
> +#define BIT_MOD(b, m, v)				\
> +	(((v) ? BIT_ON(b, m) : BIT_OFF(b, m))?1:0)	\
> +
> @@ -674,12 +686,12 @@ static int set_data_bits(void)
>   	for (bit =3D 0; bit < LCD_BITS; bit++)
>   		val &=3D lcd_bits[LCD_PORT_D][bit][BIT_MSK];
>  =20
> -	val |=3D lcd_bits[LCD_PORT_D][LCD_BIT_E][bits.e]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_RS][bits.rs]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_RW][bits.rw]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_BL][bits.bl]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_CL][bits.cl]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_DA][bits.da];
> +	val |=3D lcd_bits[LCD_PORT_D][LCD_BIT_E][BIT_CHK(bits, LCD_BIT_E_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_RS][BIT_CHK(bits, LCD_BIT_RS_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_RW][BIT_CHK(bits, LCD_BIT_RW_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_BL][BIT_CHK(bits, LCD_BIT_BL_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_CL][BIT_CHK(bits, LCD_BIT_CL_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_DA][BIT_CHK(bits, LCD_BIT_DA_MASK)];
>  =20
>

As I tried to explain in my previous post, are you sure that these lines=20
have the same meaning?
bits.something is either BIT_CLR or BIT_SET, that is to say 0 or 1.
Whereas BIT_CHK(bits, LCD_BIT_DA_MASK) for example, will0 or 0x20.

So you will not access the same value in lcd_bits. It can even access=20
memory outside of the array itself, leading to unexpected behaviour or=20
even maybe crash.

CJ
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
