From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 05 Jul 2018 13:09:22 +0000
Subject: Re: [PATCH -next] mmc: sdhci-msm: Remove redundant dev_err call in sdhci_msm_probe()
Message-Id: <CAPDyKFon2umwr2Emj9+8Y79P6zcG7y9tbRkeRVUx=na-=d5TKQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530693317-14482-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530693317-14482-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4 July 2018 at 10:35, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index a0dc3e1..3cc8bfe 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1764,7 +1764,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>                                 core_memres);
>
>                 if (IS_ERR(msm_host->core_mem)) {
> -                       dev_err(&pdev->dev, "Failed to remap registers\n");
>                         ret = PTR_ERR(msm_host->core_mem);
>                         goto clk_disable;
>                 }
>
>
>
