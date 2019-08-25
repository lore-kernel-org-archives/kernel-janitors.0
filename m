From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 25 Aug 2019 18:09:16 +0000
Subject: Re: [PATCH] Kconfig: Fix the reference to the RFD77402 ToF sensor in the 'help' section
Message-Id: <20190825190916.7ca6e750@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190819044827.5259-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190819044827.5259-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, ak@it-klinger.de, robh@kernel.org, songqiang1304521@gmail.com, tglx@linutronix.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 19 Aug 2019 06:48:27 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> This should be RFD77402, not RFD77420.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not sure that the Kconfig prefix is correct. I have choosen it because of
> commit 21cf20a84a ("Kconfig: change configuration of srf04 ultrasonic iio sensor")

Applied thanks.  I left the prefix alone, though it's a bit unusual.

Thanks,

Jonathan
> ---
>  drivers/iio/proximity/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
> index 6b5cce6f1a7b..d53601447da4 100644
> --- a/drivers/iio/proximity/Kconfig
> +++ b/drivers/iio/proximity/Kconfig
> @@ -62,7 +62,7 @@ config RFD77402
>  	tristate "RFD77402 ToF sensor"
>  	depends on I2C
>  	help
> -	  Say Y to build a driver for the RFD77420 Time-of-Flight (distance)
> +	  Say Y to build a driver for the RFD77402 Time-of-Flight (distance)
>  	  sensor module with I2C interface.
>  
>  	  To compile this driver as a module, choose M here: the
