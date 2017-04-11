From: Jon Hunter <jonathanh@nvidia.com>
Date: Tue, 11 Apr 2017 07:15:02 +0000
Subject: Re: [PATCH] soc/tegra: flowctrl: Fix error handling
Message-Id: <e5718c3d-e0f7-8a4d-7936-6ecfe6208f31@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170411034041.18662-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170411034041.18662-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 11/04/17 04:40, Christophe JAILLET wrote:
> It is likely that returning returned by 'devm_ioremap_resource()' is
> expected here instead of something related to 'base' which should be a
> valid pointer at this point.
> 
> Fixes: 841fd94c43a4 ("soc/tegra: flowctrl: Add basic platform driver")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/soc/tegra/flowctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/flowctrl.c b/drivers/soc/tegra/flowctrl.c
> index 0e345c05fc65..5433cc7a043e 100644
> --- a/drivers/soc/tegra/flowctrl.c
> +++ b/drivers/soc/tegra/flowctrl.c
> @@ -157,7 +157,7 @@ static int tegra_flowctrl_probe(struct platform_device *pdev)
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	tegra_flowctrl_base = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(tegra_flowctrl_base))
> -		return PTR_ERR(base);
> +		return PTR_ERR(tegra_flowctrl_base);
>  
>  	iounmap(base);

Oops! Thanks for the fix.

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
