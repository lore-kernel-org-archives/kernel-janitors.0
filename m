From: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 04 Jan 2019 13:52:44 +0000
Subject: Re: [PATCH] watchdog: tqmx86: Fix a couple IS_ERR() vs NULL bugs
Message-Id: <01349336-3543-ba8b-b44b-9993f5bc2319@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190104064725.GC30627@kadam>
In-Reply-To: <20190104064725.GC30627@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Andrew Lunn <andrew@lunn.ch>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

On 1/3/19 10:47 PM, Dan Carpenter wrote:
> These functions return NULL on error but we accidentally check
> for IS_ERR() instead.
> 
> Fixes: e3c21e088f89 ("watchdog: tqmx86: Add watchdog driver for the IO controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/tqmx86_wdt.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/tqmx86_wdt.c b/drivers/watchdog/tqmx86_wdt.c
> index 0d3a0fbbd7a5..52941207a12a 100644
> --- a/drivers/watchdog/tqmx86_wdt.c
> +++ b/drivers/watchdog/tqmx86_wdt.c
> @@ -79,13 +79,13 @@ static int tqmx86_wdt_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> -	if (IS_ERR(res))
> -		return PTR_ERR(res);
> +	if (!res)
> +		return -ENODEV;
>   
>   	priv->io_base = devm_ioport_map(&pdev->dev, res->start,
>   					resource_size(res));
> -	if (IS_ERR(priv->io_base))
> -		return PTR_ERR(priv->io_base);
> +	if (!priv->io_base)
> +		return -ENOMEM;
>   
>   	watchdog_set_drvdata(&priv->wdd, priv);
>   
> 
