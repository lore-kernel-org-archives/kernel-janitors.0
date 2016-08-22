From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 22 Aug 2016 13:39:27 +0000
Subject: Re: [PATCH 06/11] mmc: sdhci-of-esdhc: use of_property_read_bool
Message-Id: <CAPDyKFq8jbmrY78nZnKpbwkg6_Zqx6XfJw_3FbD=HKMCYvw_sA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr> <1470387411-15879-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Adrian Hunter <adrian.hunter@intel.com>, kernel-janitors@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 5 August 2016 at 10:56, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> Use of_property_read_bool to check for the existence of a property.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression e1,e2;
> statement S2,S1;
> @@
> -       if (of_get_property(e1,e2,NULL))
> +       if (of_property_read_bool(e1,e2))
>         S1 else S2
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks, applied for next!

Kind regards
Uffe

>
> ---
>  drivers/mmc/host/sdhci-of-esdhc.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
> index 239be2f..fb71c86 100644
> --- a/drivers/mmc/host/sdhci-of-esdhc.c
> +++ b/drivers/mmc/host/sdhci-of-esdhc.c
> @@ -583,7 +583,7 @@ static int sdhci_esdhc_probe(struct platform_device *pdev)
>
>         np = pdev->dev.of_node;
>
> -       if (of_get_property(np, "little-endian", NULL))
> +       if (of_property_read_bool(np, "little-endian"))
>                 host = sdhci_pltfm_init(pdev, &sdhci_esdhc_le_pdata,
>                                         sizeof(struct sdhci_esdhc));
>         else
>
