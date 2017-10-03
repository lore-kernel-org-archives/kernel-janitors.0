From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Date: Tue, 03 Oct 2017 12:17:26 +0000
Subject: Re: [PATCH] dmaengine: stm32-dmamux: Fix a NULL vs IS_ERR() check in probe
Message-Id: <394b11d8-af54-e8dc-4509-be5fea924c41@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171003105450.nll2ogf44l3eq4ge@mwanda>
In-Reply-To: <20171003105450.nll2ogf44l3eq4ge@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On 10/03/2017 12:54 PM, Dan Carpenter wrote:
> devm_ioremap_resource() doesn't return NULL, it returns error pointers.
> 
> Fixes: df7e762db5f6 ("dmaengine: Add STM32 DMAMUX driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
> index 22812e7a953b..d5db0f6e1ff8 100644
> --- a/drivers/dma/stm32-dmamux.c
> +++ b/drivers/dma/stm32-dmamux.c
> @@ -257,8 +257,8 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  
>  	iomem = devm_ioremap_resource(&pdev->dev, res);
> -	if (!iomem)
> -		return -ENOMEM;
> +	if (IS_ERR(iomem))
> +		return PTR_ERR(iomem);
>  
>  	spin_lock_init(&stm32_dmamux->lock);
>  
> 

Acked-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
