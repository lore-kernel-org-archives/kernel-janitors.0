From: Guenter Roeck <linux@roeck-us.net>
Date: Sat, 01 Dec 2018 18:35:19 +0000
Subject: Re: [PATCH] hwmon: (ltc2978): Fix spelling mistake "comppatible" -> "compatible"
Message-Id: <20181201183519.GA24535@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181126162832.28060-1-colin.king@canonical.com>
In-Reply-To: <20181126162832.28060-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 26, 2018 at 04:28:32PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the module description text, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/ltc2978.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index 07afb92bb36b..29c0b7219aaa 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -795,5 +795,5 @@ static struct i2c_driver ltc2978_driver = {
>  module_i2c_driver(ltc2978_driver);
>  
>  MODULE_AUTHOR("Guenter Roeck");
> -MODULE_DESCRIPTION("PMBus driver for LTC2978 and comppatible chips");
> +MODULE_DESCRIPTION("PMBus driver for LTC2978 and compatible chips");
>  MODULE_LICENSE("GPL");
