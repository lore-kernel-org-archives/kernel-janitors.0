From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 09 Aug 2017 02:01:15 +0000
Subject: Re: [8/9, v2] hwmon: (core) constify thermal_zone_of_device_ops structures
Message-Id: <20170809020115.GA18745@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502204943-20075-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502204943-20075-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jean Delvare <jdelvare@suse.com>, bhumirks@gmail.com, kernel-janitors@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 08, 2017 at 05:09:02PM +0200, Julia Lawall wrote:
> The thermal_zone_of_device_ops structure is only passed as the fourth
> argument to devm_thermal_zone_of_sensor_register, which is declared
> as const.  Thus the thermal_zone_of_device_ops structure itself can
> be const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> 
> v2: New patch
> 
>  drivers/hwmon/hwmon.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 2ac578a..c9790e2 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -135,7 +135,7 @@ static int hwmon_thermal_get_temp(void *data, int *temp)
>  	return 0;
>  }
>  
> -static struct thermal_zone_of_device_ops hwmon_thermal_ops = {
> +static const struct thermal_zone_of_device_ops hwmon_thermal_ops = {
>  	.get_temp = hwmon_thermal_get_temp,
>  };
>  
