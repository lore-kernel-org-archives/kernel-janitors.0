From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 13 Mar 2015 18:20:33 +0000
Subject: Re: [PATCH] staging: panel: change struct bits to a bit array
Message-Id: <mdv9pj$h0n$1@ger.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426265316-17947-1-git-send-email-isakyllr@openmailbox.org>
In-Reply-To: <1426265316-17947-1-git-send-email-isakyllr@openmailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,
3 comments below about what looks like change of behavior.

Best regards,
CJ

Le 13/03/2015 17:48, Isaac Lleida a =E9crit :
> From: isaky <illeida@openaliasbox.org>
>
> This path implements a bit array representing the LCD signal states inste=
ad of the old "struct bits", which used char to represent a single bit. Thi=
s will reduce the memory usage.
>
> Signed-off-by: Isaac Lleida <illeida@openaliasbox.org>
> ---
>   drivers/staging/panel/panel.c | 86 ++++++++++++++++++++++++------------=
-------
>   1 file changed, 49 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/staging/panel/panel.c b/drivers/staging/panel/panel.c
> index 3339633..7deb092 100644
> --- a/drivers/staging/panel/panel.c
> +++ b/drivers/staging/panel/panel.c
> @@ -310,6 +310,25 @@ static int selected_lcd_type =3D NOT_SET;
>   #define LCD_BITS	6
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
> +#define BIT_MOD(b, m, v)			\
> +	((v) ? BIT_ON(b, m) : BIT_OFF(b, m))	\
> +
> +/*
>    * each bit can be either connected to a DATA or CTRL port
>    */
>   #define LCD_PORT_C	0
> @@ -653,15 +672,8 @@ static const char nexcom_keypad_profile[][4][9] =3D {
>  =20
>   static const char (*keypad_profile)[4][9] =3D old_keypad_profile;
>  =20
> -/* FIXME: this should be converted to a bit array containing signals sta=
tes */
> -static struct {
> -	unsigned char e;  /* parallel LCD E (data latch on falling edge) */
> -	unsigned char rs; /* parallel LCD RS  (0 =3D cmd, 1 =3D data) */
> -	unsigned char rw; /* parallel LCD R/W (0 =3D W, 1 =3D R) */
> -	unsigned char bl; /* parallel LCD backlight (0 =3D off, 1 =3D on) */
> -	unsigned char cl; /* serial LCD clock (latch on rising edge) */
> -	unsigned char da; /* serial LCD data */
> -} bits;
> +/* Bit array containing signals states */
> +static char bits;
>  =20
>   static void init_scan_timer(void);
>  =20
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
>   	w_dtr(pprt, val);
>   	return val;
> @@ -694,12 +706,12 @@ static int set_ctrl_bits(void)
>   	for (bit =3D 0; bit < LCD_BITS; bit++)
>   		val &=3D lcd_bits[LCD_PORT_C][bit][BIT_MSK];
>  =20
> -	val |=3D lcd_bits[LCD_PORT_C][LCD_BIT_E][bits.e]
> -	    | lcd_bits[LCD_PORT_C][LCD_BIT_RS][bits.rs]
> -	    | lcd_bits[LCD_PORT_C][LCD_BIT_RW][bits.rw]
> -	    | lcd_bits[LCD_PORT_C][LCD_BIT_BL][bits.bl]
> -	    | lcd_bits[LCD_PORT_C][LCD_BIT_CL][bits.cl]
> -	    | lcd_bits[LCD_PORT_C][LCD_BIT_DA][bits.da];
> +	val |=3D lcd_bits[LCD_PORT_C][LCD_BIT_E][BIT_CHK(bits, LCD_BIT_E_MASK)]
> +	    | lcd_bits[LCD_PORT_C][LCD_BIT_RS][BIT_CHK(bits, LCD_BIT_RS_MASK)]
> +	    | lcd_bits[LCD_PORT_C][LCD_BIT_RW][BIT_CHK(bits, LCD_BIT_RW_MASK)]
> +	    | lcd_bits[LCD_PORT_C][LCD_BIT_BL][BIT_CHK(bits, LCD_BIT_BL_MASK)]
> +	    | lcd_bits[LCD_PORT_C][LCD_BIT_CL][BIT_CHK(bits, LCD_BIT_BL_MASK)]
Should'nt this one be LCD_BIT_CL_MASK ?
> +	    | lcd_bits[LCD_PORT_C][LCD_BIT_DA][BIT_CHK(bits, LCD_BIT_DA_MASK)];
>  =20
>   	w_ctr(pprt, val);
>   	return val;
> @@ -794,12 +806,12 @@ static void lcd_send_serial(int byte)
>   	/* the data bit is set on D0, and the clock on STROBE.
>   	 * LCD reads D0 on STROBE's rising edge. */
>   	for (bit =3D 0; bit < 8; bit++) {
> -		bits.cl =3D BIT_CLR;	/* CLK low */
> +		BIT_OFF(bits, LCD_BIT_CL_MASK);	/* CLK low */
>   		panel_set_bits();
> -		bits.da =3D byte & 1;
> +		BIT_MOD(bits, LCD_BIT_DA_MASK, byte & 1);
>   		panel_set_bits();
>   		udelay(2);  /* maintain the data during 2 us before CLK up */
> -		bits.cl =3D BIT_SET;	/* CLK high */
> +		BIT_ON(bits, LCD_BIT_CL_MASK);	/* CLK high */
>   		panel_set_bits();
>   		udelay(1);  /* maintain the strobe during 1 us */
>   		byte >>=3D 1;
> @@ -814,7 +826,7 @@ static void lcd_backlight(int on)
>  =20
>   	/* The backlight is activated by setting the AUTOFEED line to +5V  */
>   	spin_lock_irq(&pprt_lock);
> -	bits.bl =3D on;
> +	BIT_MOD(bits, LCD_BIT_BL_MASK, on);
>   	panel_set_bits();
>   	spin_unlock_irq(&pprt_lock);
>   }
> @@ -849,14 +861,14 @@ static void lcd_write_cmd_p8(int cmd)
>   	w_dtr(pprt, cmd);
>   	udelay(20);	/* maintain the data during 20 us before the strobe */
>  =20
> -	bits.e =3D BIT_SET;
> -	bits.rs =3D BIT_CLR;
> -	bits.rw =3D BIT_CLR;
> +	BIT_ON(bits, LCD_BIT_E_MASK);
> +	BIT_OFF(bits, LCD_BIT_RS_MASK);
> +	BIT_OFF(bits, LCD_BIT_RW_MASK);
>   	set_ctrl_bits();
>  =20
>   	udelay(40);	/* maintain the strobe during 40 us */
>  =20
> -	bits.e =3D BIT_CLR;
> +	BIT_OFF(bits, LCD_BIT_E_MASK);
>   	set_ctrl_bits();
>  =20
>   	udelay(120);	/* the shortest command takes at least 120 us */
> @@ -871,14 +883,14 @@ static void lcd_write_data_p8(int data)
>   	w_dtr(pprt, data);
>   	udelay(20);	/* maintain the data during 20 us before the strobe */
>  =20
> -	bits.e =3D BIT_SET;
> -	bits.rs =3D BIT_SET;
> -	bits.rw =3D BIT_CLR;
> +	BIT_ON(bits, LCD_BIT_E_MASK);
> +	BIT_OFF(bits, LCD_BIT_RS_MASK);
Should'nt this one be BIT_ON ?
> +	BIT_OFF(bits, LCD_BIT_RW_MASK);
>   	set_ctrl_bits();
>  =20
>   	udelay(40);	/* maintain the strobe during 40 us */
>  =20
> -	bits.e =3D BIT_CLR;
> +	BIT_OFF(bits, LCD_BIT_E_MASK);
>   	set_ctrl_bits();
>  =20
>   	udelay(45);	/* the shortest data takes at least 45 us */
> @@ -968,15 +980,15 @@ static void lcd_clear_fast_p8(void)
>   		/* maintain the data during 20 us before the strobe */
>   		udelay(20);
>  =20
> -		bits.e =3D BIT_SET;
> -		bits.rs =3D BIT_SET;
> -		bits.rw =3D BIT_CLR;
> +		BIT_ON(bits, LCD_BIT_E_MASK);
> +		BIT_OFF(bits, LCD_BIT_RS_MASK);
Should'nt this one be BIT_ON ?
> +		BIT_OFF(bits, LCD_BIT_RW_MASK);
>   		set_ctrl_bits();
>  =20
>   		/* maintain the strobe during 40 us */
>   		udelay(40);
>  =20
> -		bits.e =3D BIT_CLR;
> +		BIT_OFF(bits, LCD_BIT_E_MASK);
>   		set_ctrl_bits();
>  =20
>   		/* the shortest data takes at least 45 us */


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
