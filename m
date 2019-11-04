From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Mon, 04 Nov 2019 06:27:22 +0000
Subject: Re: [PATCH][next][V2] drivers: thermal: tsens: fix potential integer overflow on multiply
Message-Id: <CAHLCerPX5WPvVRxfgAQyAguomBaEsCyncJUuOafkY2cMjQmsaQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191101100035.25502-1-colin.king@canonical.com>
In-Reply-To: <20191101100035.25502-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <swboyd@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Nov 1, 2019 at 3:30 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently a multiply operation is being performed on two int values
> and the result is being assigned to a u64, presumably because the
> end result is expected to be probably larger than an int. However,
> because the multiply is an int multiply one can get overflow. Avoid
> the overflow by casting degc to a u64 to force a u64 multiply.
>
> Also use div_u64 for the divide as suggested by Daniel Lezcano.
>
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: fbfe1a042cfd ("drivers: thermal: tsens: Add interrupt support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>
> V2: use div_u64 for the divide as suggested by Daniel Lezcano.
>
> ---
>  drivers/thermal/qcom/tsens-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> index 03bf1b8133ea..c6b551ec7323 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -92,7 +92,7 @@ void compute_intercept_slope(struct tsens_priv *priv, u32 *p1,
>
>  static inline u32 degc_to_code(int degc, const struct tsens_sensor *s)
>  {
> -       u64 code = (degc * s->slope + s->offset) / SLOPE_FACTOR;
> +       u64 code = div_u64(((u64)degc * s->slope + s->offset), SLOPE_FACTOR);
>
>         pr_debug("%s: raw_code: 0x%llx, degc:%d\n", __func__, code, degc);
>         return clamp_val(code, THRESHOLD_MIN_ADC_CODE, THRESHOLD_MAX_ADC_CODE);
> --
> 2.20.1
>
