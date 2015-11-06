From: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 06 Nov 2015 13:58:50 +0000
Subject: Re: [patch] watchdog: w83977f_wdt: underflow in wdt_set_timeout()
Message-Id: <563CB21A.40007@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151106095631.GA18557@mwanda>
In-Reply-To: <20151106095631.GA18557@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/06/2015 01:56 AM, Dan Carpenter wrote:
> "t" is controlled by the user.  If "t" is a very large integer then it
> could lead to a negative "tmrval".  We cap the upper bound of "tmrval"
> but, in the current code, we allow negatives.  This is a bug and it
> causes a static checker warning.  Let's make "tmrval" unsigned to avoid
> this problem.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> diff --git a/drivers/watchdog/w83977f_wdt.c b/drivers/watchdog/w83977f_wdt.c
> index 91bf55a..20e2bba 100644
> --- a/drivers/watchdog/w83977f_wdt.c
> +++ b/drivers/watchdog/w83977f_wdt.c
> @@ -224,7 +224,7 @@ static int wdt_keepalive(void)
>
>   static int wdt_set_timeout(int t)
>   {
> -	int tmrval;
> +	unsigned int tmrval;
>
>   	/*
>   	 * Convert seconds to watchdog counter time units, rounding up.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

