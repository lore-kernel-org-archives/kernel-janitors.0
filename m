From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 21 Jul 2019 17:07:46 +0000
Subject: Re: [PATCH] iio: sca3000: Fix a typo
Message-Id: <20190721180746.7564f406@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721105353.30504-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721105353.30504-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gustavo@embeddedor.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 21 Jul 2019 12:53:53 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> All #define are about SCA3000_... except the last one.
> Make it consistent.
> 
> s/SAC3000/SCA3000/
> 
> This #define is apparently unused up to now.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Applied to the togreg branch of iio.git and pushed out as testing to have
no actually effect whatsoever ;)

Thanks for tidying this up!

Jonathan


> ---
>  drivers/iio/accel/sca3000.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
> index 4964561595f5..537e9325bcc7 100644
> --- a/drivers/iio/accel/sca3000.c
> +++ b/drivers/iio/accel/sca3000.c
> @@ -114,7 +114,7 @@
>  /* Currently unsupported */
>  #define SCA3000_MD_CTRL_AND_Y				BIT(3)
>  #define SCA3000_MD_CTRL_AND_X				BIT(4)
> -#define SAC3000_MD_CTRL_AND_Z				BIT(5)
> +#define SCA3000_MD_CTRL_AND_Z				BIT(5)
>  
>  /*
>   * Some control registers of complex access methods requiring this register to
