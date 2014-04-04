From: Barry Song <baohua@kernel.org>
Date: Fri, 04 Apr 2014 04:52:39 +0000
Subject: Re: [patch] dmaengine: sirf: off by one in of_dma_sirfsoc_xlate()
Message-Id: <CAGsJ_4wQqczfAYhBSr=Z5J1PXG8wa0WmMdGs3NCn2dvBpkL6aA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140403072933.GD14286@mwanda>
In-Reply-To: <20140403072933.GD14286@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2014-04-03 15:29 GMT+08:00 Dan Carpenter <dan.carpenter@oracle.com>:
> The ">" here should be ">=" or we are one step beyond the end of the
> sdma->channels[] array.
>
> Fixes: 2e041c94628c ('dmaengine: sirf: enable generic dt binding for dma channels')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Acked-by: Barry Song <Baohua.Song@csr.com>

> diff --git a/drivers/dma/sirf-dma.c b/drivers/dma/sirf-dma.c
> index a1bd829..03f7820 100644
> --- a/drivers/dma/sirf-dma.c
> +++ b/drivers/dma/sirf-dma.c
> @@ -666,7 +666,7 @@ static struct dma_chan *of_dma_sirfsoc_xlate(struct of_phandle_args *dma_spec,
>         struct sirfsoc_dma *sdma = ofdma->of_dma_data;
>         unsigned int request = dma_spec->args[0];
>
> -       if (request > SIRFSOC_DMA_CHANNELS)
> +       if (request >= SIRFSOC_DMA_CHANNELS)
>                 return NULL;
>
>         return dma_get_slave_channel(&sdma->channels[request].chan);
