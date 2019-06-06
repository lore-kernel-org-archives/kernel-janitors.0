From: Eduardo Valentin <edubezval@gmail.com>
Date: Thu, 06 Jun 2019 14:24:53 +0000
Subject: Re: [PATCH][next] drivers: thermal: tsens: remove redundant u32 comparison with less than zero
Message-Id: <20190606142450.GA7846@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190531105708.15312-1-colin.king@canonical.com>
In-Reply-To: <20190531105708.15312-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

hey Colin,

On Fri, May 31, 2019 at 11:57:08AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The u32 variable hw_id is unsigned and cannot be less than zero so
> the comparison with less than zero is always false and hence is redundant
> and can be removed.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the patch but the commit that introduced this has been
reverted. I pushed an update on my -next branch to silence this in the
linux-next tree too.

> ---
>  drivers/thermal/qcom/tsens-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> index 928e8e81ba69..f4419f45025d 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -69,7 +69,7 @@ bool is_sensor_enabled(struct tsens_priv *priv, u32 hw_id)
>  	u32 val;
>  	int ret;
>  
> -	if ((hw_id > (priv->num_sensors - 1)) || (hw_id < 0))
> +	if (hw_id > (priv->num_sensors - 1))
>  		return -EINVAL;
>  	ret = regmap_field_read(priv->rf[SENSOR_EN], &val);
>  	if (ret)
