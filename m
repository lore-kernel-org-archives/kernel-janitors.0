From: Adrian Hunter <adrian.hunter@intel.com>
Date: Tue, 05 Jan 2021 12:39:52 +0000
Subject: Re: [PATCH] mmc: sdhci-sprd: Fix some resource leaks in the remove function
Message-Id: <1cfeeb62-8211-4a2a-0cf5-c3799d7ef42e@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201217204236.163446-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201217204236.163446-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, ulf.hansson@linaro.org, orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 17/12/20 10:42 pm, Christophe JAILLET wrote:
> 'sdhci_remove_host()' and 'sdhci_pltfm_free()' should be used in place of
> 'mmc_remove_host()' and 'mmc_free_host()'.
> 
> This avoids some resource leaks, is more in line with the error handling
> path of the probe function, and is more consistent with other drivers.
> 
> Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host controller")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> Other adjustment may be needed.
> I'm not sure at all of the 0 passed to 'sdhci_remove_host()'. Some drivers
> pass 0, some have some more complicated computation.

'0' means cleanup nicely. '1' (dead) means nothing works anymore, including
interrupts, so give up on requests immediately.

Either should work.  '0' is better unless your host controller really is
dead, which is mostly not possible except for some legacy PCI devices.

> ---
>  drivers/mmc/host/sdhci-sprd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
> index f85171edabeb..5dc36efff47f 100644
> --- a/drivers/mmc/host/sdhci-sprd.c
> +++ b/drivers/mmc/host/sdhci-sprd.c
> @@ -708,14 +708,14 @@ static int sdhci_sprd_remove(struct platform_device *pdev)
>  {
>  	struct sdhci_host *host = platform_get_drvdata(pdev);
>  	struct sdhci_sprd_host *sprd_host = TO_SPRD_HOST(host);
> -	struct mmc_host *mmc = host->mmc;
>  
> -	mmc_remove_host(mmc);
> +	sdhci_remove_host(host, 0);
> +
>  	clk_disable_unprepare(sprd_host->clk_sdio);
>  	clk_disable_unprepare(sprd_host->clk_enable);
>  	clk_disable_unprepare(sprd_host->clk_2x_enable);
>  
> -	mmc_free_host(mmc);
> +	sdhci_pltfm_free(pdev);
>  
>  	return 0;
>  }
> 
