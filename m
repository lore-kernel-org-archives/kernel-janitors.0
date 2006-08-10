From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 10 Aug 2006 21:44:07 +0000
Subject: Re: [KJ] [PATCH] drivers/char/[ac]*.c: coding style changes
Message-Id: <20060810214407.GC6845@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1155233576.2784.9.camel@localhost>
In-Reply-To: <1155233576.2784.9.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 10, 2006 at 08:12:55PM +0200, Patrik Kullman wrote:
> Patch against 2.6.18-rc4 to make drivers/char/[ac]*.c apply to CodingStyle
>
> Also to get an ack that I understand the coding style ;)

Part of it is definitely undestood. ;-)

> If this is ACKed I'll probably go recursively through the entire drivers/char/ to make it conform.
>
> Because if this isn't janitoring....

It is.

> I'll do something else.. ;)

> --- linux-2.6.18-rc4/drivers/char/amiserial.c
> +++ linux-2.6.18-rc4-codingstyle/drivers/char/amiserial.c

OK, this one has relative few CS problems. See below.

> @@ -270,9 +270,9 @@ static void receive_chars(struct async_s
>  	custom.intreq = IF_RBF;
>  	mb();
>
> -	if((serdatr & 0x1ff) = 0)
> +	if ((serdatr & 0x1ff) = 0)

OK.

>  	    status |= UART_LSR_BI;

This line is badly indented. It should be:

	if ((serdatr & 0x1ff) = 0)
		status |= UART_LSR_BI;

Tab-Tab. Ditto all other chunks.

> --- linux-2.6.18-rc4/drivers/char/applicom.c
> +++ linux-2.6.18-rc4-codingstyle/drivers/char/applicom.c
> @@ -133,7 +133,7 @@ static int ac_register_board(unsigned lo
>  {
>  	volatile unsigned char byte_reset_it;
>
> -	if((readb(loc + CONF_END_TEST)     != 0x00) ||
> +	if ((readb(loc + CONF_END_TEST)    != 0x00) ||
>  	   (readb(loc + CONF_END_TEST + 1) != 0x55) ||
>  	   (readb(loc + CONF_END_TEST + 2) != 0xAA) ||
>  	   (readb(loc + CONF_END_TEST + 3) != 0xFF))

Dunno. Notice all readb's were lined up.

> --- linux-2.6.18-rc4/drivers/char/consolemap.c
> +++ linux-2.6.18-rc4-codingstyle/drivers/char/consolemap.c

> -	for (i=0; i<E_TABSZ ; i++)
> -	  {
> +	for (i=0; i<E_TABSZ ; i++) {
>  	    ch = conv_uni_to_pc(vc_cons[fg_console].d, p[i]);
>  	    __put_user((ch & ~0xff) ? 0 : ch, arg+i);
> -	  }
> +	}

	for (i = 0; i < E_TABSZ; i++) {
		ch = conv_uni_to_pc(vc_cons[fg_console].d, p[i]);
		__put_user((ch & ~0xff) ? 0 : ch, arg + i);
	}


> --- linux-2.6.18-rc4/drivers/char/cs5535_gpio.c
> +++ linux-2.6.18-rc4-codingstyle/drivers/char/cs5535_gpio.c

> -static struct gpio_regmap rm[] > -{
> +static struct gpio_regmap rm[] = {

OK.

>  	{ 0x30, 0x00, '1', '0' },	/* GPIOx_READ_BACK / GPIOx_OUT_VAL */
>  	{ 0x20, 0x20, 'I', 'i' },	/* GPIOx_IN_EN */
>  	{ 0x04, 0x04, 'O', 'o' },	/* GPIOx_OUT_EN */

> --- linux-2.6.18-rc4/drivers/char/cyclades.c
> +++ linux-2.6.18-rc4-codingstyle/drivers/char/cyclades.c

Here we have totally different beast. Driver full of 2- and 4-space
indentation. Such things should be done with Lindent as found in kernel
tarball. And maintainter agreement, indeed.

One caveat: GNU indent will sometimes do stupid things with almost
correctly formatted code. So. you can either a) Lindent, then strip out
broken changes, or b) do it by hand. You can feel how things should be
done by reading core kernel code. It's almost in perfect shape.

The trick is to do CS changes one time and never return to them.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
