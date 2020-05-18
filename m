From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 18 May 2020 11:43:16 +0000
Subject: Re: [PATCH] dmaengine: tegra210-adma: Fix an error handling path in 'tegra_adma_probe()'
Message-Id: <899a62c8-b4fa-b1cc-6e3a-bbfb680e5d41@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200516214205.276266-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200516214205.276266-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, ldewangan@nvidia.com, dan.j.williams@intel.com, vkoul@kernel.org, thierry.reding@gmail.com
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 16/05/2020 22:42, Christophe JAILLET wrote:
> Commit b53611fb1ce9 ("dmaengine: tegra210-adma: Fix crash during probe")
> has moved some code in the probe function and reordered the error handling
> path accordingly.
> However, a goto has been missed.
> 
> Fix it and goto the right label if 'dma_async_device_register()' fails, so
> that all resources are released.
> 
> Fixes: b53611fb1ce9 ("dmaengine: tegra210-adma: Fix crash during probe")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/dma/tegra210-adma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index c4ce5dfb149b..db58d7e4f9fe 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -900,7 +900,7 @@ static int tegra_adma_probe(struct platform_device *pdev)
>  	ret = dma_async_device_register(&tdma->dma_dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "ADMA registration failed: %d\n", ret);
> -		goto irq_dispose;
> +		goto rpm_put;
>  	}
>  
>  	ret = of_dma_controller_register(pdev->dev.of_node,


Thanks for fixing this!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
