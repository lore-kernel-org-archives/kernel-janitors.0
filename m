From: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 02 Apr 2020 14:44:44 +0000
Subject: Re: [PATCH][V2][next] rtc: ds1307: check for failed memory allocation on wdt
Message-Id: <c6fe9db8-3e27-b6fc-fff7-131cecad3f88@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402135201.548313-1-colin.king@canonical.com>
In-Reply-To: <20200402135201.548313-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/2/20 6:52 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a failed memory allocation will lead to a null pointer
> dereference on point wdt.  Fix this by checking for a failed allocation
> and adding error return handling to function ds1307_wdt_register.
> Also move the error exit label "exit" to allow a return statement to
> be removed.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: fd90d48db037 ("rtc: ds1307: add support for watchdog timer on ds1388")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> V2: move error exit label and remove a return statement, thanks to 
>     Walter Harms for spotting this clean up.
> ---
>  drivers/rtc/rtc-ds1307.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index fad042118862..c058b02efb4d 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -1665,14 +1665,16 @@ static const struct watchdog_ops ds1388_wdt_ops = {
>  
>  };
>  
> -static void ds1307_wdt_register(struct ds1307 *ds1307)
> +static int ds1307_wdt_register(struct ds1307 *ds1307)
>  {
>  	struct watchdog_device	*wdt;
>  
>  	if (ds1307->type != ds_1388)
> -		return;
> +		return 0;
>  
>  	wdt = devm_kzalloc(ds1307->dev, sizeof(*wdt), GFP_KERNEL);
> +	if (!wdt)
> +		return -ENOMEM;
>  
>  	wdt->info = &ds1388_wdt_info;
>  	wdt->ops = &ds1388_wdt_ops;
> @@ -1683,10 +1685,13 @@ static void ds1307_wdt_register(struct ds1307 *ds1307)
>  	watchdog_init_timeout(wdt, 0, ds1307->dev);
>  	watchdog_set_drvdata(wdt, ds1307);
>  	devm_watchdog_register_device(ds1307->dev, wdt);
> +
> +	return 0;
>  }
>  #else
> -static void ds1307_wdt_register(struct ds1307 *ds1307)
> +static int ds1307_wdt_register(struct ds1307 *ds1307)
>  {
> +	return 0;
>  }
>  #endif /* CONFIG_WATCHDOG_CORE */
>  
> @@ -1979,10 +1984,7 @@ static int ds1307_probe(struct i2c_client *client,
>  
>  	ds1307_hwmon_register(ds1307);
>  	ds1307_clks_register(ds1307);
> -	ds1307_wdt_register(ds1307);
> -
> -	return 0;
> -
> +	err = ds1307_wdt_register(ds1307);

Ah, sorry, missed this one. The original idea was to ignore errors on purpose.
Same as with hwmon. If you want to change this, fine with me. Note though
that rtc_nvmem_register() now leaks a sysfs file if I understand the code
correctly.

Guenter

>  exit:
>  	return err;
>  }
> 
