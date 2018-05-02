From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 May 2018 08:47:02 +0000
Subject: Re: [patch] gpiolib: fix gpiochip_machine_hog()
Message-Id: <CAMRc=MeNZ38np3OCCK8=keX8Q-L_GOEa8dGb9O8g=MKAPqt=Pg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180501073638.GA6126@mwanda>
In-Reply-To: <20180501073638.GA6126@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2018-05-01 9:36 GMT+02:00 Dan Carpenter <dan.carpenter@oracle.com>:
> There is a shifter vs vanilla mask bug here.  We want to test if 1 << 11
> is set but we're testing if 0xb is set.
>
> Fixes: 9a6c505f7df1 ("gpiolib: add hogs support for machine code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 2716c9e65131..c6cb63e43eda 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1187,7 +1187,7 @@ static void gpiochip_machine_hog(struct gpio_chip *chip, struct gpiod_hog *hog)
>                 return;
>         }
>
> -       if (desc->flags & FLAG_IS_HOGGED)
> +       if (test_bit(FLAG_IS_HOGGED, &desc->flags))
>                 return;
>
>         rv = gpiod_hog(desc, hog->line_name, hog->lflags, hog->dflags);

Thanks for catching it!

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
