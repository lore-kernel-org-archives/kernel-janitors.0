From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Date: Wed, 17 Jan 2018 13:46:23 +0000
Subject: RE: [PATCH -next] media: rcar_drif: fix error return code in rcar_drif_alloc_dmachannels()
Message-Id: <KL1PR0601MB2038BFC24B4118A5AB282650C3E90@KL1PR0601MB2038.apcprd06.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516188292-144008-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516188292-144008-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Wei Yongjun,

Thank you for the patch.

> Subject: [PATCH -next] media: rcar_drif: fix error return code in
> rcar_drif_alloc_dmachannels()
> 
> Fix to return error code -ENODEV from the dma_request_slave_channel()
> error handling case instead of 0, as done elsewhere in this function.
> rc can be overwrite to 0 by dmaengine_slave_config() in the for loop.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Ramesh Shanmugasundaram <Ramesh.shanmugasundaram@bp.renesas.com>

Thanks,
Ramesh

> ---
>  drivers/media/platform/rcar_drif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar_drif.c
> b/drivers/media/platform/rcar_drif.c
> index b2e080e..dc7e280 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -274,7 +274,7 @@ static int rcar_drif_alloc_dmachannels(struct
> rcar_drif_sdr *sdr)  {
>  	struct dma_slave_config dma_cfg;
>  	unsigned int i;
> -	int ret = -ENODEV;
> +	int ret;
> 
>  	for_each_rcar_drif_channel(i, &sdr->cur_ch_mask) {
>  		struct rcar_drif *ch = sdr->ch[i];
> @@ -282,6 +282,7 @@ static int rcar_drif_alloc_dmachannels(struct
> rcar_drif_sdr *sdr)
>  		ch->dmach = dma_request_slave_channel(&ch->pdev->dev, "rx");
>  		if (!ch->dmach) {
>  			rdrif_err(sdr, "ch%u: dma channel req failed\n", i);
> +			ret = -ENODEV;
>  			goto dmach_error;
>  		}

