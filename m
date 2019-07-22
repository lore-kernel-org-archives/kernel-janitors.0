From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Date: Mon, 22 Jul 2019 06:55:50 +0000
Subject: Re: [PATCH] iio: sca3000: Fix a typo
Message-Id: <0d698979-d0da-5225-6dc3-e2ddebb31279@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721105353.30504-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721105353.30504-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gustavo@embeddedor.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 21.07.19 12:53, Christophe JAILLET wrote:
> All #define are about SCA3000_... except the last one.
> Make it consistent.
> 
> s/SAC3000/SCA3000/
> 
> This #define is apparently unused up to now.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/iio/accel/sca3000.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
> index 4964561595f5..537e9325bcc7 100644
> --- a/drivers/iio/accel/sca3000.c
> +++ b/drivers/iio/accel/sca3000.c
> @@ -114,7 +114,7 @@
>   /* Currently unsupported */
>   #define SCA3000_MD_CTRL_AND_Y				BIT(3)
>   #define SCA3000_MD_CTRL_AND_X				BIT(4)
> -#define SAC3000_MD_CTRL_AND_Z				BIT(5)
> +#define SCA3000_MD_CTRL_AND_Z				BIT(5)
>   
>   /*
>    * Some control registers of complex access methods requiring this register to
> 
Reviewed-By: Enrico Weigelt <info@metux.net>

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
