From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Tue, 22 Oct 2019 13:18:08 +0000
Subject: Re: [PATCH][next] thermal: qcom: tsens-v1: fix kfree of a non-pointer value
Message-Id: <CAP245DXjVDJ68kmWONmWh4YB=dcVrQ4q1y3bPncDc5=FohY2Vw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191022111806.23143-1-colin.king@canonical.com>
In-Reply-To: <20191022111806.23143-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, AngeloGioacchino Del Regno <kholk11@gmail.com>, Linux PM list <linux-pm@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Oct 22, 2019 at 4:48 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the kfree of pointer qfprom_cdata is kfreeing an
> error value that has been cast to a pointer rather than a
> valid address.  Fix this by removing the kfree.

Hmm, we just added this to other places[1] as a fix for mem leaks
using the nvmem api.

I think we need to fix up the qfprom_read wrapper. Srini?

[1] https://lore.kernel.org/stable/20191010083616.685532154@linuxfoundation.org/

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
