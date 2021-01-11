From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Jan 2021 18:05:32 +0000
Subject: Re: [PATCH] mmc: owl-mmc: Fix a resource leak in an error handling path and in the remove function
Message-Id: <CAPDyKFqPnbig9s2h43c07c8tyDt12sFgDZFnQ+mfh=bbtdmRcg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201209194202.54099-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201209194202.54099-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Wed, 9 Dec 2020 at 20:42, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'dma_request_chan()' calls should be balanced by a corresponding
> 'dma_release_channel()' call.
>
> Add the missing call both in the error handling path of the probe function
> and in the remove function.
>
> Fixes: ff65ffe46d28 ("mmc: Add Actions Semi Owl SoCs SD/MMC driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/owl-mmc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
> index 53b81582f1af..5490962dc8e5 100644
> --- a/drivers/mmc/host/owl-mmc.c
> +++ b/drivers/mmc/host/owl-mmc.c
> @@ -640,7 +640,7 @@ static int owl_mmc_probe(struct platform_device *pdev)
>         owl_host->irq = platform_get_irq(pdev, 0);
>         if (owl_host->irq < 0) {
>                 ret = -EINVAL;
> -               goto err_free_host;
> +               goto err_release_channel;
>         }
>
>         ret = devm_request_irq(&pdev->dev, owl_host->irq, owl_irq_handler,
> @@ -648,19 +648,21 @@ static int owl_mmc_probe(struct platform_device *pdev)
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to request irq %d\n",
>                         owl_host->irq);
> -               goto err_free_host;
> +               goto err_release_channel;
>         }
>
>         ret = mmc_add_host(mmc);
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to add host\n");
> -               goto err_free_host;
> +               goto err_release_channel;
>         }
>
>         dev_dbg(&pdev->dev, "Owl MMC Controller Initialized\n");
>
>         return 0;
>
> +err_release_channel:
> +       dma_release_channel(owl_host->dma);
>  err_free_host:
>         mmc_free_host(mmc);
>
> @@ -674,6 +676,7 @@ static int owl_mmc_remove(struct platform_device *pdev)
>
>         mmc_remove_host(mmc);
>         disable_irq(owl_host->irq);
> +       dma_release_channel(owl_host->dma);
>         mmc_free_host(mmc);
>
>         return 0;
> --
> 2.27.0
>
