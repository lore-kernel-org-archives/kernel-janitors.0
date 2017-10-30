From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Oct 2017 11:40:33 +0000
Subject: Re: [PATCH] mmc: tmio: Use common error handling code in tmio_mmc_host_probe()
Message-Id: <CAPDyKFqoQ10sVfw-kDzFm4O3Fq28XcYRQPHD6fjOFKquRQEUog@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7fdea92c-2ca7-8911-28da-4388103e1b04@users.sourceforge.net>
In-Reply-To: <7fdea92c-2ca7-8911-28da-4388103e1b04@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 27 October 2017 at 19:17, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 27 Oct 2017 19:09:17 +0200
>
> * Add a jump target so that a bit of exception handling can be better
>   reused at the end of this function.
>
> * Adjust condition checks.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks, applied for next!

Kind regards
Uffe

> ---
>  drivers/mmc/host/tmio_mmc_core.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index a7293e186e03..2e85d4048cec 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1286,23 +1286,24 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host,
>         pm_runtime_enable(&pdev->dev);
>
>         ret = mmc_add_host(mmc);
> -       if (ret < 0) {
> -               tmio_mmc_host_remove(_host);
> -               return ret;
> -       }
> +       if (ret)
> +               goto remove_host;
>
>         dev_pm_qos_expose_latency_limit(&pdev->dev, 100);
>
>         if (pdata->flags & TMIO_MMC_USE_GPIO_CD) {
>                 ret = mmc_gpio_request_cd(mmc, pdata->cd_gpio, 0);
> -               if (ret < 0) {
> -                       tmio_mmc_host_remove(_host);
> -                       return ret;
> -               }
> +               if (ret)
> +                       goto remove_host;
> +
>                 mmc_gpiod_request_cd_irq(mmc);
>         }
>
>         return 0;
> +
> +remove_host:
> +       tmio_mmc_host_remove(_host);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_probe);
>
> --
> 2.14.3
>
