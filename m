From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 26 Dec 2018 15:41:06 +0000
Subject: Re: [PATCH -next] hwmon: (lm80) Fix missing unlock on error in set_fan_div()
Message-Id: <20181226154106.GA20541@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545823704-73836-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1545823704-73836-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jean Delvare <jdelvare@suse.com>, Kangjie Lu <kjlu@umn.edu>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 26, 2018 at 11:28:24AM +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function set_fan_div()
> in the error handling case.
> 
> Fixes: c9c63915519b ("hwmon: (lm80) fix a missing check of the status of SMBus read")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm80.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
> index 0e30fa0..f9b8e3e 100644
> --- a/drivers/hwmon/lm80.c
> +++ b/drivers/hwmon/lm80.c
> @@ -393,8 +393,10 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
>  	}
>  
>  	rv = lm80_read_value(client, LM80_REG_FANDIV);
> -	if (rv < 0)
> +	if (rv < 0) {
> +		mutex_unlock(&data->update_lock);
>  		return rv;
> +	}
>  	reg = (rv & ~(3 << (2 * (nr + 1))))
>  	    | (data->fan_div[nr] << (2 * (nr + 1)));
>  	lm80_write_value(client, LM80_REG_FANDIV, reg);
