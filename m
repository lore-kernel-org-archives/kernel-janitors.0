From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 19 Aug 2018 17:28:53 +0000
Subject: Re: [PATCH] iio: max44000: remove unused variable max44000_alstim_shift
Message-Id: <20180819182853.2eda699d@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180809135338.10868-1-colin.king@canonical.com>
In-Reply-To: <20180809135338.10868-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu,  9 Aug 2018 14:53:38 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable max44000_alstim_shift is defined but is never used hence it is
> redundant and can be removed. This variable has been like this since
> the driver was added back in 2016.
> 
> Cleans up clang warning:
> warning: 'max44000_alstim_shift' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/light/max44000.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/iio/light/max44000.c b/drivers/iio/light/max44000.c
> index bcdb0eb9e537..b9b0bd341be8 100644
> --- a/drivers/iio/light/max44000.c
> +++ b/drivers/iio/light/max44000.c
> @@ -99,7 +99,6 @@ static const int max44000_alspga_shift[] = {0, 2, 4, 7};
>   * Handling this internally is also required for buffer support because the
>   * channel's scan_type can't be modified dynamically.
>   */
> -static const int max44000_alstim_shift[] = {0, 2, 4, 6};
>  #define MAX44000_ALSTIM_SHIFT(alstim) (2 * (alstim))
>  
>  /* Available integration times with pretty manual alignment: */
