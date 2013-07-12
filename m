From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Date: Fri, 12 Jul 2013 07:54:57 +0000
Subject: Re: [patch] drm/nvc0-/gr: shift wrapping bug in nvc0_grctx_generate_r406800()
Message-Id: <51DFB651.9020008@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130712063329.GA29320@longonot.mountain>
In-Reply-To: <20130712063329.GA29320@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

Op 12-07-13 08:33, Dan Carpenter schreef:
> We care about the upper 32 bits here so we have to use 1ULL instead of 1
> to avoid a shift wrapping bug.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
> index 64dca26..fe67415 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
> @@ -1039,7 +1039,7 @@ nvc0_grctx_generate_r406800(struct nvc0_graph_priv *priv)
>  			} while (!tpcnr[gpc]);
>  			tpc = priv->tpc_nr[gpc] - tpcnr[gpc]--;
>  
> -			tpc_set |= 1 << ((gpc * 8) + tpc);
> +			tpc_set |= 1ULL << ((gpc * 8) + tpc);
>  		}
>  
>  		nv_wr32(priv, 0x406800 + (i * 0x20), lower_32_bits(tpc_set));
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>

Any other code in nouveau that looks bugged?
