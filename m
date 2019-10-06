From: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Sun, 06 Oct 2019 15:07:59 +0000
Subject: Re: [PATCH] gpio: 104-idi-48e: make array register_offset static, makes object smaller
Message-Id: <20191006150759.GA68457@icarus>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191006144256.23733-1-colin.king@canonical.com>
In-Reply-To: <20191006144256.23733-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Oct 06, 2019 at 03:42:56PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array register_offset on the stack but instead make it
> static. Makes the object code smaller by 63 bytes.  Also add the int type
> specifier to clean up a checkpatch warning.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    9212	   5712	   1408	  16332	   3fcc	drivers/gpio/gpio-104-idi-48.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    9085	   5776	   1408	  16269	   3f8d	drivers/gpio/gpio-104-idi-48.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpio/gpio-104-idi-48.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
> index ff53887bdaa8..c95c93ec0bd7 100644
> --- a/drivers/gpio/gpio-104-idi-48.c
> +++ b/drivers/gpio/gpio-104-idi-48.c
> @@ -65,7 +65,7 @@ static int idi_48_gpio_get(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct idi_48_gpio *const idi48gpio = gpiochip_get_data(chip);
>  	unsigned i;
> -	const unsigned register_offset[6] = { 0, 1, 2, 4, 5, 6 };
> +	static const unsigned int register_offset[6] = { 0, 1, 2, 4, 5, 6 };
>  	unsigned base_offset;
>  	unsigned mask;
>  
> -- 
> 2.20.1

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
