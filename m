From: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 09 Sep 2016 04:27:53 +0000
Subject: Re: [PATCH] watchdog: iTCO_wdt: constify iTCO_wdt_pm structure
Message-Id: <a2174cc6-8266-26b5-99e0-aef0c5e5d18c@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472415986-16035-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472415986-16035-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Wim Van Sebroeck <wim@iguana.be>
Cc: kernel-janitors@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/28/2016 01:26 PM, Julia Lawall wrote:
> iTCO_wdt_pm, of type struct dev_pm_ops, is never modified, so declare it as
> const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

