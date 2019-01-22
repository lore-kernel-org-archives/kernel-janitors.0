From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Jan 2019 07:47:54 +0000
Subject: Re: [PATCH -next] mmc: sdhci-esdhc-imx: fix return value check in sdhci_esdhc_imx_probe()
Message-Id: <CAPDyKFo3rj3MbZfUUSwj64Gg-jdkJND0ERDjW-ELUVrjR2Go5w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547617491-60322-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547617491-60322-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, BOUGH CHEN <haibo.chen@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Wed, 16 Jan 2019 at 06:38, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function devm_kzalloc() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>
> Fixes: fadac7488064 ("mmc: sdhci-esdhc-imx: add CMDQ support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 75ad824..fad6007 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1500,8 +1500,8 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
>         if (imx_data->socdata->flags & ESDHC_FLAG_CQHCI) {
>                 host->mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
>                 cq_host = devm_kzalloc(&pdev->dev, sizeof(*cq_host), GFP_KERNEL);
> -               if (IS_ERR(cq_host)) {
> -                       err = PTR_ERR(cq_host);
> +               if (!cq_host) {
> +                       err = -ENOMEM;
>                         goto disable_ahb_clk;
>                 }
>
>
>
