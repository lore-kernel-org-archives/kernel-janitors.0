From: Nicolas Ferre <nicolas.ferre@microchip.com>
Date: Mon, 24 Apr 2017 08:19:38 +0000
Subject: Re: [PATCH] ARM: at91/at91-pinctrl documentation: fix spelling mistake: "contoller" -> "controller"
Message-Id: <a5634388-bcd2-6c3f-37a6-bb293f3560ee@microchip.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421120713.4939-1-colin.king@canonical.com>
In-Reply-To: <20170421120713.4939-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Le 21/04/2017 à 14:07, Colin King a écrit :
> From: Colin Ian King <colin.king@canonical.com>
> 
> trivial fix to spelling mistake in documentation
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>  Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> index 9a8a45d9d8ab..590e60378be3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> @@ -4,7 +4,7 @@ The AT91 Pinmux Controller, enables the IC
>  to share one PAD to several functional blocks. The sharing is done by
>  multiplexing the PAD input/output signals. For each PAD there are up to
>  8 muxing options (called periph modes). Since different modules require
> -different PAD settings (like pull up, keeper, etc) the contoller controls
> +different PAD settings (like pull up, keeper, etc) the controller controls
>  also the PAD settings parameters.
>  
>  Please refer to pinctrl-bindings.txt in this directory for details of the
> 


-- 
Nicolas Ferre
