From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 21 Jul 2019 15:05:08 +0000
Subject: Re: [PATCH] hwmon: (pmbus/max31785) Remove a useless #define
Message-Id: <20190721150508.GA8001@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721101553.20911-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721101553.20911-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jul 21, 2019 at 12:15:53PM +0200, Christophe JAILLET wrote:
> There is a typo in MAX37185_NUM_FAN_PAGES. To be consistent, it should be
> MAX31785_NUM_FAN_PAGES (1 and 7 switched).
> 
> At line 24, we already have:
>    #define MAX31785_NR_FAN_PAGES		6
> and MAX37185_NUM_FAN_PAGES seems to be unused.
> 
> It is likely that it is only a typo and/or a left-over.
> So, axe it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/max31785.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 69d9029ea410..254b0f98c755 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -244,8 +244,6 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
>  #define MAX31785_VOUT_FUNCS \
>  	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT)
>  
> -#define MAX37185_NUM_FAN_PAGES 6
> -
>  static const struct pmbus_driver_info max31785_info = {
>  	.pages = MAX31785_NR_PAGES,
>  
