From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 21 Jul 2019 15:19:20 +0000
Subject: Re: [PATCH] watchdog: ath79_wdt: fix a typo in the name of a function
Message-Id: <38306b92-4251-44ec-b083-e41046112a17@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721125547.13473-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721125547.13473-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/21/19 5:55 AM, Christophe JAILLET wrote:
> It is likely that 'ath97_wdt_shutdown()' should be 'ath79_wdt_shutdown()'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/ath79_wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
> index 02234c254b10..436cdb4f0392 100644
> --- a/drivers/watchdog/ath79_wdt.c
> +++ b/drivers/watchdog/ath79_wdt.c
> @@ -306,7 +306,7 @@ static int ath79_wdt_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static void ath97_wdt_shutdown(struct platform_device *pdev)
> +static void ath79_wdt_shutdown(struct platform_device *pdev)
>   {
>   	ath79_wdt_disable();
>   }
> @@ -322,7 +322,7 @@ MODULE_DEVICE_TABLE(of, ath79_wdt_match);
>   static struct platform_driver ath79_wdt_driver = {
>   	.probe		= ath79_wdt_probe,
>   	.remove		= ath79_wdt_remove,
> -	.shutdown	= ath97_wdt_shutdown,
> +	.shutdown	= ath79_wdt_shutdown,
>   	.driver		= {
>   		.name	= DRIVER_NAME,
>   		.of_match_table = of_match_ptr(ath79_wdt_match),
> 
