From: Martyn Welch <mwelchuk@gmail.com>
Date: Sun, 03 Apr 2016 20:36:31 +0000
Subject: Re: [PATCH] staging: vme: fix bare use of 'unsigned'
Message-Id: <57017ECF.1060404@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1459464794-27986-1-git-send-email-clifton.a.barnes@gmail.com>
In-Reply-To: <1459464794-27986-1-git-send-email-clifton.a.barnes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clifton Barnes <clifton.a.barnes@gmail.com>, martyn@welchs.me.uk, manohar.vanga@gmail.com, gregkh@linuxfoundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org



On 31/03/16 23:53, Clifton Barnes wrote:
> fix checkpatch.pl warning about 'Prefer 'unsigned int' to bare use of
> 'unsigned''
>
> Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>

Acked-by: Martyn Welch <martyn@welchs.me.uk>

Greg: Whilst this patch seems valid and compiles fine, I no longer have 
access to the hardware for this driver. I'm aware this driver has been 
in the staging tree for a rather long time. I will check to see if 
there's any intention for further work to be done on this driver, if not 
I guess we should be looking to delete it from the staging tree.

Martyn

> ---
>   drivers/staging/vme/devices/vme_pio2_gpio.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/vme/devices/vme_pio2_gpio.c b/drivers/staging/vme/devices/vme_pio2_gpio.c
> index df992c3..f52a9ed 100644
> --- a/drivers/staging/vme/devices/vme_pio2_gpio.c
> +++ b/drivers/staging/vme/devices/vme_pio2_gpio.c
> @@ -97,7 +97,7 @@ static void pio2_gpio_set(struct gpio_chip *chip,
>   }
>   
>   /* Directionality configured at board build - send appropriate response */
> -static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
> +static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned int offset)
>   {
>   	int data;
>   	struct pio2_card *card = gpio_to_pio2_card(chip);
> @@ -116,7 +116,8 @@ static int pio2_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
>   }
>   
>   /* Directionality configured at board build - send appropriate response */
> -static int pio2_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int value)
> +static int pio2_gpio_dir_out(struct gpio_chip *chip,
> +			     unsigned int offset, int value)
>   {
>   	int data;
>   	struct pio2_card *card = gpio_to_pio2_card(chip);

