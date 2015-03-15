From: Willy Tarreau <w@1wt.eu>
Date: Sun, 15 Mar 2015 07:57:50 +0000
Subject: Re: [PATCH v3] staging: panel: change struct bits to a bit array
Message-Id: <20150315075750.GC9611@1wt.eu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426328083-9183-1-git-send-email-illeida@openaliasbox.org>
In-Reply-To: <1426328083-9183-1-git-send-email-illeida@openaliasbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Isaac Lleida <illeida@openaliasbox.org>
Cc: willy@meta-x.org, gregkh@linuxfoundation.org, marius.gorski@gmail.com, armand.bastien@laposte.net, domdevlin@free.fr, sudipm.mukherjee@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello,

On Sat, Mar 14, 2015 at 11:14:43AM +0100, Isaac Lleida wrote:
> This path implements a bit array representing the LCD signal states instead of the old "struct bits", which used char to represent a single bit. This will reduce the memory usage.
> 
> Signed-off-by: Isaac Lleida <illeida@openaliasbox.org>
> ---
> v3: some more stupid errors I introduced in last patch fixed.

Let me guess, you have never tested this patch series, right ?
I have not checked the code with the patch applied, but I'm seeing
this :

>  /*
> + * LCD signal states
> + */
> +#define LCD_BIT_E_MASK		0x1	/* E (data latch on falling edge) */
> +#define LCD_BIT_RS_MASK		0x2	/* RS  (0 = cmd, 1 = data) */
> +#define LCD_BIT_RW_MASK		0x4	/* R/W (0 = W, 1 = R) */
> +#define LCD_BIT_BL_MASK		0x8	/* backlight (0 = off, 1 = on) */
> +#define LCD_BIT_CL_MASK		0x10	/* clock (latch on rising edge) */
> +#define LCD_BIT_DA_MASK		0x20	/* data */
> +
> +/*
> + * Bit array operations
> + */
> +#define BIT_ON(b, m)	(b |= m)
> +#define BIT_OFF(b, m)	(b &= ~m)
> +#define BIT_CHK(b, m)	(b & m)

Then this :

> -	val |= lcd_bits[LCD_PORT_D][LCD_BIT_E][bits.e]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_RS][bits.rs]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_RW][bits.rw]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_BL][bits.bl]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_CL][bits.cl]
> -	    | lcd_bits[LCD_PORT_D][LCD_BIT_DA][bits.da];
> +	val |= lcd_bits[LCD_PORT_D][LCD_BIT_E][BIT_CHK(bits, LCD_BIT_E_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_RS][BIT_CHK(bits, LCD_BIT_RS_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_RW][BIT_CHK(bits, LCD_BIT_RW_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_BL][BIT_CHK(bits, LCD_BIT_BL_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_CL][BIT_CHK(bits, LCD_BIT_CL_MASK)]
> +	    | lcd_bits[LCD_PORT_D][LCD_BIT_DA][BIT_CHK(bits, LCD_BIT_DA_MASK)];
 
So as you can see, previously lcd_bits[x][y][z] was used
with values 0 or 1 for bits, and now it's being used with
values of z matching the bit position in your array. So
it seems to me that it's a significant overflow. Thus I
think you should modify your macro this way :

#define BIT_CHK(b, m)	(!!(b & m))

That said, given the amount of sensitive changes, and the
risk of breakage (as was apparently done here), you *must*
absolutely test you changes on real hardware before risking
to break the driver for every user. Also, the fact that you
needed 3 iterations of this patch after discovering breakage
is clearly a sign of the fact that you need to test it.

Thanks,
Willy

