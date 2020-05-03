From: Joe Perches <joe@perches.com>
Date: Sun, 03 May 2020 20:06:25 +0000
Subject: Re: [PATCH] thermal: stm32: fix spelling mistake "acces" -> "access"
Message-Id: <67bb48d7e7927b6b50bafa69a21eef41fc2157b5.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200503191104.153711-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200503191104.153711-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, rui.zhang@intel.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, edubezval@gmail.com, info@metux.net, tglx@linutronix.de, gregkh@linuxfoundation.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2020-05-03 at 21:11 +0200, Christophe JAILLET wrote:
> Fix a typo in Kconfig.
[]
> diff --git a/drivers/thermal/st/Kconfig b/drivers/thermal/st/Kconfig
[]
> @@ -23,5 +23,5 @@ config STM32_THERMAL
>  	help
>  	  Support for thermal framework on STMicroelectronics STM32 series of
>  	  SoCs. This thermal driver allows to access to general thermal framework
> -	  functionalities and to acces to SoC sensor functionalities. This
> +	  functionalities and to access to SoC sensor functionalities. This
>  	  configuration is fully dependent of MACH_STM32MP157.

Could fix the grammar too:

This thermal driver allows to access general thermal framework
functionalities and access to SoC sensor functionalities.
