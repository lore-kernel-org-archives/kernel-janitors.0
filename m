From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 12 Oct 2016 12:57:50 +0000
Subject: Re: hwmon: (max31790) potential ERR_PTR dereference
Message-Id: <20161012125750.GA20547@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012062452.GX12841@mwanda>
In-Reply-To: <20161012062452.GX12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 12, 2016 at 09:24:52AM +0300, Dan Carpenter wrote:
> We should only dereference "data" after we check if it is an error
> pointer.
> 
> Fixes: 54187ff9d766 ('hwmon: (max31790) Convert to use new hwmon registration API')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

Thanks,
Guenter

> ---
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
> index bef84e0..c1b9275 100644
> --- a/drivers/hwmon/max31790.c
> +++ b/drivers/hwmon/max31790.c
> @@ -268,11 +268,13 @@ static int max31790_read_pwm(struct device *dev, u32 attr, int channel,
>  			     long *val)
>  {
>  	struct max31790_data *data = max31790_update_device(dev);
> -	u8 fan_config = data->fan_config[channel];
> +	u8 fan_config;
>  
>  	if (IS_ERR(data))
>  		return PTR_ERR(data);
>  
> +	fan_config = data->fan_config[channel];
> +
>  	switch (attr) {
>  	case hwmon_pwm_input:
>  		*val = data->pwm[channel] >> 8;
