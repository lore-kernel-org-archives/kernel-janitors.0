From: Onkalo Samu <samu.p.onkalo@nokia.com>
Date: Fri, 29 Oct 2010 11:27:54 +0000
Subject: Re: [patch] misc/bh1770glc: error handling in
Message-Id: <1288351674.30706.4.camel@4fid08082>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028044149.GU6062@bicker>
In-Reply-To: <20101028044149.GU6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ext Dan Carpenter <error27@gmail.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, 2010-10-28 at 06:41 +0200, ext Dan Carpenter wrote:
> There was a signedness bug so "ret" was never less than zero and that
> breaks the error handling.  Also in the original code it would overwrite
> ret and the result is still negative but it's bogus number instead of
> the correct error code.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Samu Onkalo <samu.p.onkalo@nokia.com>

> 
> diff --git a/drivers/misc/bh1770glc.c b/drivers/misc/bh1770glc.c
> index cee632e..d79a972 100644
> --- a/drivers/misc/bh1770glc.c
> +++ b/drivers/misc/bh1770glc.c
> @@ -649,7 +649,7 @@ static ssize_t bh1770_power_state_store(struct device *dev,
>  {
>  	struct bh1770_chip *chip =  dev_get_drvdata(dev);
>  	unsigned long value;
> -	size_t ret;
> +	ssize_t ret;
>  
>  	if (strict_strtoul(buf, 0, &value))
>  		return -EINVAL;
> @@ -659,8 +659,12 @@ static ssize_t bh1770_power_state_store(struct device *dev,
>  		pm_runtime_get_sync(dev);
>  
>  		ret = bh1770_lux_rate(chip, chip->lux_rate_index);
> -		ret |= bh1770_lux_interrupt_control(chip, BH1770_ENABLE);
> +		if (ret < 0) {
> +			pm_runtime_put(dev);
> +			goto leave;
> +		}
>  
> +		ret = bh1770_lux_interrupt_control(chip, BH1770_ENABLE);
>  		if (ret < 0) {
>  			pm_runtime_put(dev);
>  			goto leave;

