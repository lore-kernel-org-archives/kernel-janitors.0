From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Mon, 13 Apr 2020 14:35:09 +0000
Subject: Re: [PATCH] platform/chrome: cros_ec_sensorhub: Add missing '\n' in log messages
Message-Id: <6487789d-185b-d9f9-d3a0-752bdd5bac98@collabora.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411145844.29542-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200411145844.29542-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, bleung@chromium.org, groeck@chromium.org, andy.shevchenko@gmail.com, Jonathan.Cameron@huawei.com
Cc: gwendal@chromium.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

Thank you for your patch.

On 11/4/20 16:58, Christophe JAILLET wrote:
> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
> 
> Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied as a fix for 5.7

>  drivers/platform/chrome/cros_ec_sensorhub_ring.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> index 230e6cf3da2f..c51af569708f 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> @@ -820,7 +820,7 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
>  	if (fifo_info->count > sensorhub->fifo_size ||
>  	    fifo_info->size != sensorhub->fifo_size) {
>  		dev_warn(sensorhub->dev,
> -			 "Mismatch EC data: count %d, size %d - expected %d",
> +			 "Mismatch EC data: count %d, size %d - expected %d\n",
>  			 fifo_info->count, fifo_info->size,
>  			 sensorhub->fifo_size);
>  		goto error;
> @@ -851,14 +851,14 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
>  		}
>  		if (number_data > fifo_info->count - i) {
>  			dev_warn(sensorhub->dev,
> -				 "Invalid EC data: too many entry received: %d, expected %d",
> +				 "Invalid EC data: too many entry received: %d, expected %d\n",
>  				 number_data, fifo_info->count - i);
>  			break;
>  		}
>  		if (out + number_data >
>  		    sensorhub->ring + fifo_info->count) {
>  			dev_warn(sensorhub->dev,
> -				 "Too many samples: %d (%zd data) to %d entries for expected %d entries",
> +				 "Too many samples: %d (%zd data) to %d entries for expected %d entries\n",
>  				 i, out - sensorhub->ring, i + number_data,
>  				 fifo_info->count);
>  			break;
> 
