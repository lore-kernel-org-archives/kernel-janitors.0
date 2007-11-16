From: Ben Dooks <ben@fluff.org>
Date: Fri, 16 Nov 2007 09:45:19 +0000
Subject: Re: [PATCH] arm: Removing config variable DEBUG_S3C_PORT
Message-Id: <20071116094519.GA26444@trinity.fluff.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <473C0653.7070207@gmail.com>
In-Reply-To: <473C0653.7070207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Nov 15, 2007 at 09:41:55AM +0100, Jiri Olsa wrote:
> Removing config variable DEBUG_S3C_PORT, since it is not used

Hi, thanks for spotting this was unused, however I think it should be
being used, and will look at doing a patch to make this used again.
 
> Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
> ---
>  arch/arm/Kconfig.debug             |    8 --------
>  arch/arm/configs/s3c2410_defconfig |    1 -
>  2 files changed, 0 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 18101f5..55a3b40 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -82,14 +82,6 @@ config DEBUG_CLPS711X_UART2
>  	  output to the second serial port on these devices.  Saying N will
>  	  cause the debug messages to appear on the first serial port.
>  
> -config DEBUG_S3C_PORT
> -	depends on DEBUG_LL && PLAT_S3C
> -	bool "Kernel low-level debugging messages via S3C UART"
> -	help
> -	  Say Y here if you want debug print routines to go to one of the
> -	  S3C internal UARTs. The chosen UART must have been configured
> -	  before it is used.
> -
>  config DEBUG_S3C_UART
>  	depends on PLAT_S3C
>  	int "S3C UART to use for low-level debug"
> diff --git a/arch/arm/configs/s3c2410_defconfig b/arch/arm/configs/s3c2410_defconfig
> index f8a1645..b94d8d4 100644
> --- a/arch/arm/configs/s3c2410_defconfig
> +++ b/arch/arm/configs/s3c2410_defconfig
> @@ -1392,7 +1392,6 @@ CONFIG_DEBUG_USER=y
>  # CONFIG_DEBUG_ERRORS is not set
>  CONFIG_DEBUG_LL=y
>  # CONFIG_DEBUG_ICEDCC is not set
> -CONFIG_DEBUG_S3C_PORT=y
>  CONFIG_DEBUG_S3C_UART=0
>  
>  #

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

