From: walter harms <wharms@bfs.de>
Date: Tue, 22 Oct 2019 12:46:21 +0000
Subject: Re: [PATCH][next] drivers: thermal: tsens: fix potential integer overflow on multiply
Message-Id: <5DAEFA1D.8070508@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191022114910.652-1-colin.king@canonical.com>
In-Reply-To: <20191022114910.652-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 22.10.2019 13:49, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a multiply operation is being performed on two int values
> and the result is being assigned to a u64, presumably because the
> end result is expected to be probably larger than an int. However,
> because the multiply is an int multiply one can get overflow. Avoid
> the overflow by casting degc to a u64 to force a u64 multiply.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/thermal/qcom/tsens-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> index 03bf1b8133ea..3d7855106ecd 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -92,7 +92,7 @@ void compute_intercept_slope(struct tsens_priv *priv, u32 *p1,
>  
>  static inline u32 degc_to_code(int degc, const struct tsens_sensor *s)
>  {
> -	u64 code = (degc * s->slope + s->offset) / SLOPE_FACTOR;
> +	u64 code = ((u64)degc * s->slope + s->offset) / SLOPE_FACTOR;
>  
looks ok
just to offer an alternative to avoid the cast;
	u64 code = degc;

	code = code * s->slope + s->offset;
	code/=SLOPE_FACTOR;

ym2c
re,
wh


>  	pr_debug("%s: raw_code: 0x%llx, degc:%d\n", __func__, code, degc);
>  	return clamp_val(code, THRESHOLD_MIN_ADC_CODE, THRESHOLD_MAX_ADC_CODE);
