From: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 14 Jan 2020 14:12:40 +0000
Subject: Re: [PATCH] hwmon: (adm1177) Fix adm1177_write_alert_thr()
Message-Id: <20200114141240.GA16302@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200114055125.ro5slro6zewr56tx@kili.mountain>
In-Reply-To: <20200114055125.ro5slro6zewr56tx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Beniamin Bia <beniamin.bia@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 14, 2020 at 08:51:25AM +0300, Dan Carpenter wrote:
> There is a reversed condition so the adm1177_write_alert_thr() function
> doesn't update "st->alert_threshold_ua".
> 
> Fixes: 829091f9c56c ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller and Digital Power Monitor driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The fix was folded into v4 of the series, so I took that.

Thanks for reporting!

Guenter

> ---
>  drivers/hwmon/adm1177.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
> index 1f2ff7a29306..d314223a404a 100644
> --- a/drivers/hwmon/adm1177.c
> +++ b/drivers/hwmon/adm1177.c
> @@ -63,7 +63,7 @@ static int adm1177_write_alert_thr(struct adm1177_state *st,
>  
>  	ret = i2c_smbus_write_byte_data(st->client, ADM1177_REG_ALERT_TH,
>  					val);
> -	if (!ret)
> +	if (ret)
>  		return ret;
>  
>  	st->alert_threshold_ua = alert_threshold_ua;
