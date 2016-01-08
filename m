From: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 08 Jan 2016 14:49:09 +0000
Subject: Re: [patch] watchdog: pnx833x_wdt: fix typo in MODULE_PARM_DESC
Message-Id: <568FCC65.6010106@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160108110239.GI32195@mwanda>
In-Reply-To: <20160108110239.GI32195@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/08/2016 03:02 AM, Dan Carpenter wrote:
> The module_param() is "pnx833x_wdt_timeout" and MODULE_PARM_DESC()
> should match.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/watchdog/pnx833x_wdt.c b/drivers/watchdog/pnx833x_wdt.c
> index 882fdcb..69da25a 100644
> --- a/drivers/watchdog/pnx833x_wdt.c
> +++ b/drivers/watchdog/pnx833x_wdt.c
> @@ -52,8 +52,9 @@ static int pnx833x_wdt_alive;
>   /* Set default timeout in MHZ.*/
>   static int pnx833x_wdt_timeout = PNX_WATCHDOG_TIMEOUT;
>   module_param(pnx833x_wdt_timeout, int, 0);
> -MODULE_PARM_DESC(timeout, "Watchdog timeout in Mhz. (68Mhz clock), default="
> -			__MODULE_STRING(PNX_TIMEOUT_VALUE) "(30 seconds).");
> +MODULE_PARM_DESC(pnx833x_wdt_timeout,
> +		 "Watchdog timeout in Mhz. (68Mhz clock), default="
> +		 __MODULE_STRING(PNX_TIMEOUT_VALUE) "(30 seconds).");

The intent here was to have a module parameter named 'timeout'.
Of course that was never the case. Wonder if anyone ever noticed.
The correct fix would be to use something like
	module_param_named(timeout, pnx833x_wdt_timeout, int, 0);
but of course that would change the ABI. On the other side,
'timeout' is the documented module parameter in
Documentation/watchdog/watchdog-parameters.txt, so one could argue
that using module_param_named() would be a bug fix and not an ABI change.

Not really sure what the best approach is here. Wim, any comments ?
Provide module_param_named() in _addition_ to the existing module_param(),
maybe, if that is possible ?

Guenter

