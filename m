From: Ben Skeggs <bskeggs@redhat.com>
Date: Sat, 25 Jun 2011 12:08:37 +0000
Subject: Re: [patch] nouveau: error paths leak in
Message-Id: <1309003720.3557.5.camel@nisroch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110625055446.GT14591@shale.localdomain>
In-Reply-To: <20110625055446.GT14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Velikov <emil.l.velikov@gmail.com>, kernel-janitors@vger.kernel.org, Emil@freedesktop.org, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>

On Sat, 2011-06-25 at 08:54 +0300, Dan Carpenter wrote:
> Two of these error paths returned without freeing "ctx".
Applied to nouveau git, thanks!

Ben.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/gpu/drm/nouveau/nvc0_graph.c b/drivers/gpu/drm/nouveau/nvc0_graph.c
> index 39e9208..5aa3f9e 100644
> --- a/drivers/gpu/drm/nouveau/nvc0_graph.c
> +++ b/drivers/gpu/drm/nouveau/nvc0_graph.c
> @@ -106,7 +106,8 @@ nvc0_graph_construct_context(struct nouveau_channel *chan)
>  		if (!nv_wait(dev, 0x409800, 0x80000000, 0x80000000)) {
>  			NV_ERROR(dev, "PGRAPH: HUB_SET_CHAN timeout\n");
>  			nvc0_graph_ctxctl_debug(dev);
> -			return -EBUSY;
> +			ret = -EBUSY;
> +			goto err;
>  		}
>  	} else {
>  		nvc0_graph_load_context(chan);
> @@ -119,10 +120,9 @@ nvc0_graph_construct_context(struct nouveau_channel *chan)
>  	}
>  
>  	ret = nvc0_grctx_generate(chan);
> -	if (ret) {
> -		kfree(ctx);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err;
> +
>  
>  	if (!nouveau_ctxfw) {
>  		nv_wr32(dev, 0x409840, 0x80000000);
> @@ -131,14 +131,13 @@ nvc0_graph_construct_context(struct nouveau_channel *chan)
>  		if (!nv_wait(dev, 0x409800, 0x80000000, 0x80000000)) {
>  			NV_ERROR(dev, "PGRAPH: HUB_CTX_SAVE timeout\n");
>  			nvc0_graph_ctxctl_debug(dev);
> -			return -EBUSY;
> +			ret = -EBUSY;
> +			goto err;
>  		}
>  	} else {
>  		ret = nvc0_graph_unload_context_to(dev, chan->ramin->vinst);
> -		if (ret) {
> -			kfree(ctx);
> -			return ret;
> -		}
> +		if (ret)
> +			goto err;
>  	}
>  
>  	for (i = 0; i < priv->grctx_size; i += 4)
> @@ -146,6 +145,10 @@ nvc0_graph_construct_context(struct nouveau_channel *chan)
>  
>  	priv->grctx_vals = ctx;
>  	return 0;
> +
> +err:
> +	kfree(ctx);
> +	return ret;
>  }
>  
>  static int
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel


