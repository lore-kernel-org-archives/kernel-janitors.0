From: AngeloGioacchino Del Regno <kholk11@gmail.com>
Date: Tue, 22 Oct 2019 12:39:42 +0000
Subject: Re: [PATCH][next] thermal: qcom: tsens-v1: fix kfree of a non-pointer value
Message-Id: <CAK7fi1a8CiX=HVqhZSmQJdcjF1X_kdHFDwJhEpYJUcdPTcbMQA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191022111806.23143-1-colin.king@canonical.com>
In-Reply-To: <20191022111806.23143-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, MSM <linux-arm-msm@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Il giorno mar 22 ott 2019 alle ore 13:18 Colin King
<colin.king@canonical.com> ha scritto:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the kfree of pointer qfprom_cdata is kfreeing an
> error value that has been cast to a pointer rather than a
> valid address.  Fix this by removing the kfree.
>
> Fixes: 95ededc17e4e ("thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/thermal/qcom/tsens-v1.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index 2d1077b64887..bd2ddb684a45 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -240,10 +240,8 @@ static int calibrate_8976(struct tsens_priv *priv)
>         u32 *qfprom_cdata;
>
>         qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
> -       if (IS_ERR(qfprom_cdata)) {
> -               kfree(qfprom_cdata);
> +       if (IS_ERR(qfprom_cdata))
>                 return PTR_ERR(qfprom_cdata);
> -       }
>
>         mode = (qfprom_cdata[4] & MSM8976_CAL_SEL_MASK);
>         dev_dbg(priv->dev, "calibration mode is %d\n", mode);
> --
> 2.20.1
>

I confirm that was one stupid mistake. I was about to send the same patch, and I
can confirm that this fix is working. Tested on my Xperia X Compact.

Tested-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
