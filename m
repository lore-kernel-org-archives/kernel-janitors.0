From: Johan Hovold <johan@kernel.org>
Date: Wed, 13 May 2020 14:53:47 +0000
Subject: Re: [PATCH -next] gnss: sirf: fix error return code in sirf_probe()
Message-Id: <20200513145347.GX25962@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507094252.13914-1-weiyongjun1@huawei.com>
In-Reply-To: <20200507094252.13914-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Thu, May 07, 2020 at 09:42:52AM +0000, Wei Yongjun wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: d2efbbd18b1e ("gnss: add driver for sirfstar-based receivers")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gnss/sirf.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> index effed3a8d398..2ecb1d3e8eeb 100644
> --- a/drivers/gnss/sirf.c
> +++ b/drivers/gnss/sirf.c
> @@ -439,14 +439,18 @@ static int sirf_probe(struct serdev_device *serdev)
>  
>  	data->on_off = devm_gpiod_get_optional(dev, "sirf,onoff",
>  			GPIOD_OUT_LOW);
> -	if (IS_ERR(data->on_off))
> +	if (IS_ERR(data->on_off)) {
> +		ret = PTR_ERR(data->on_off);
>  		goto err_put_device;
> +	}
>  
>  	if (data->on_off) {
>  		data->wakeup = devm_gpiod_get_optional(dev, "sirf,wakeup",
>  				GPIOD_IN);
> -		if (IS_ERR(data->wakeup))
> +		if (IS_ERR(data->wakeup)) {
> +			ret = PTR_ERR(data->wakeup);
>  			goto err_put_device;
> +		}
>  
>  		ret = regulator_enable(data->vcc);
>  		if (ret)

Good catch! Now applied with a stable tag as this would lead to a
use-after-free on driver unbind.

Johan
