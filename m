From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 05 Dec 2018 14:24:06 +0000
Subject: Re: [PATCH -next] mmc: jz4740: Use PTR_ERR_OR_ZERO in jz4740_mmc_request_gpios()
Message-Id: <CAPDyKFonp+xVHr-S+mrZdsiLXGnR5W7GhpH=9+9=PV4UnBOP+g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543628746-101825-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543628746-101825-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 1 Dec 2018 at 02:37, YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/jz4740_mmc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
> index 6f7a99e..8eca423 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -975,10 +975,7 @@ static int jz4740_mmc_request_gpios(struct jz4740_mmc_host *host,
>
>         host->power = devm_gpiod_get_optional(&pdev->dev, "power",
>                                               GPIOD_OUT_HIGH);
> -       if (IS_ERR(host->power))
> -               return PTR_ERR(host->power);
> -
> -       return 0;
> +       return PTR_ERR_OR_ZERO(host->power);
>  }
>
>  static const struct of_device_id jz4740_mmc_of_match[] = {
>
>
>
>
>
