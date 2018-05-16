From: Baolin Wang <baolin.wang@linaro.org>
Date: Wed, 16 May 2018 08:56:46 +0000
Subject: Re: [PATCH] dmaengine: sprd: fix an NULL vs IS_ERR() bug
Message-Id: <CAMz4kuJkWoO-m=4PK=TE_Zg8-ut2h-aMDZpgvYUUUkAqCx26jw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180516084807.GA23043@mwanda>
In-Reply-To: <20180516084807.GA23043@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 16 May 2018 at 16:48, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We recently cleaned this code up but we need to update the error
> handling as well.  The devm_ioremap_resource() returns error pointers on
> error, never NULL.
>
> Fixes: e7f063ae1a31 ("dmaengine: sprd: Use devm_ioremap_resource() to map memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

>
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index e715d07aa632..36df3b096bbc 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -808,8 +808,8 @@ static int sprd_dma_probe(struct platform_device *pdev)
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         sdev->glb_base = devm_ioremap_resource(&pdev->dev, res);
> -       if (!sdev->glb_base)
> -               return -ENOMEM;
> +       if (IS_ERR(sdev->glb_base))
> +               return PTR_ERR(sdev->glb_base);
>
>         dma_cap_set(DMA_MEMCPY, sdev->dma_dev.cap_mask);
>         sdev->total_chns = chn_count;



-- 
Baolin.wang
Best Regards
