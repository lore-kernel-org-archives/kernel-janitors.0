From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 13 Dec 2020 13:23:03 +0000
Subject: Re: [PATCH] iio: sx9310: Off by one in sx9310_read_thresh()
Message-Id: <20201213132303.4b362987@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8XqwK0z//8sSWJR@mwanda>
In-Reply-To: <X8XqwK0z//8sSWJR@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Daniel Campello <campello@chromium.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Douglas Anderson <dianders@chromium.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 1 Dec 2020 10:03:28 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This > should be >= to prevent reading one element beyond the end of
> the sx9310_pthresh_codes[] array.
> 
> Fixes: ad2b473e2ba3 ("iio: sx9310: Support setting proximity thresholds")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Applied to the fixes-togreg branch of iio.git which won't go anywhere now
until after rc1 (and is based on the stuff queued up for the merge window)

thanks,

Jonathan

> ---
>  drivers/iio/proximity/sx9310.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
> index a2f820997afc..62eacb22e9bc 100644
> --- a/drivers/iio/proximity/sx9310.c
> +++ b/drivers/iio/proximity/sx9310.c
> @@ -601,7 +601,7 @@ static int sx9310_read_thresh(struct sx9310_data *data,
>  		return ret;
>  
>  	regval = FIELD_GET(SX9310_REG_PROX_CTRL8_9_PTHRESH_MASK, regval);
> -	if (regval > ARRAY_SIZE(sx9310_pthresh_codes))
> +	if (regval >= ARRAY_SIZE(sx9310_pthresh_codes))
>  		return -EINVAL;
>  
>  	*val = sx9310_pthresh_codes[regval];
