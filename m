From: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 14 Jul 2017 06:40:05 +0000
Subject: Re: [PATCH] watchdog: w83627hf: make const array chip_name static
Message-Id: <8f7c5224-45ee-b676-a1bc-414df4b88325@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711152334.18385-1-colin.king@canonical.com>
In-Reply-To: <20170711152334.18385-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/11/2017 08:23 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate array chip_name on the stack but instead make it static.
> Makes the object code smaller by 40 bytes:
> 
> Before:
>     text	   data	    bss	    dec	    hex	filename
>     5641	   2840	    384	   8865	   22a1	drivers/watchdog/w83627hf_wdt.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>     5545	   2896	    384	   8825	   2279	drivers/watchdog/w83627hf_wdt.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/w83627hf_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/w83627hf_wdt.c b/drivers/watchdog/w83627hf_wdt.c
> index d9ba0496713c..7817836bff55 100644
> --- a/drivers/watchdog/w83627hf_wdt.c
> +++ b/drivers/watchdog/w83627hf_wdt.c
> @@ -429,7 +429,7 @@ static int __init wdt_init(void)
>   {
>   	int ret;
>   	int chip;
> -	const char * const chip_name[] = {
> +	static const char * const chip_name[] = {
>   		"W83627HF",
>   		"W83627S",
>   		"W83697HF",
> 

