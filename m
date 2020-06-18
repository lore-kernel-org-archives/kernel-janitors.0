From: =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Date: Thu, 18 Jun 2020 10:54:55 +0000
Subject: Re: [PATCH] crypto: caam/qi2: remove redundant assignment to ret
Message-Id: <8e08adcb-ef91-124d-d093-921fc97da3af@nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200611153934.928021-1-colin.king@canonical.com>
In-Reply-To: <20200611153934.928021-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 6/11/2020 6:39 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being assigned a value that is never read, the
> error exit path via label 'unmap' returns -ENOMEM anyhow, so assigning
> ret with -ENOMEM is redundamt.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/caam/caamalg_qi2.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/crypto/caam/caamalg_qi2.c b/drivers/crypto/caam/caamalg_qi2.c
> index 28669cbecf77..ef2c4e095db3 100644
> --- a/drivers/crypto/caam/caamalg_qi2.c
> +++ b/drivers/crypto/caam/caamalg_qi2.c
> @@ -4044,7 +4044,6 @@ static int ahash_finup_no_ctx(struct ahash_request *req)
>  					  DMA_TO_DEVICE);
>  	if (dma_mapping_error(ctx->dev, edesc->qm_sg_dma)) {
>  		dev_err(ctx->dev, "unable to map S/G table\n");
> -		ret = -ENOMEM;
>  		goto unmap;
>  	}
>  	edesc->qm_sg_bytes = qm_sg_bytes;
> @@ -4055,7 +4054,6 @@ static int ahash_finup_no_ctx(struct ahash_request *req)
>  	if (dma_mapping_error(ctx->dev, state->ctx_dma)) {
>  		dev_err(ctx->dev, "unable to map ctx\n");
>  		state->ctx_dma = 0;
> -		ret = -ENOMEM;
>  		goto unmap;
>  	}
>  
The proper fix would be updating the ahash_finup_no_ctx() function
to return the specific error code:
	return ret;
instead of returning -ENOMEM for all error cases.

For example error code returned by dpaa2_caam_enqueue()
should be returned instead of -ENOMEM.

Horia
