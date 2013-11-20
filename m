From: walter harms <wharms@bfs.de>
Date: Wed, 20 Nov 2013 11:54:22 +0000
Subject: Re: [patch] drm/nouveau/disp: add a comment on confusing loop
Message-Id: <528CA2EE.9090909@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113074552.GE25541@elgon.mountain>
In-Reply-To: <20131113074552.GE25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, David Herrmann <dh.herrmann@gmail.com>, Dave Airlie <airlied@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org



Am 13.11.2013 08:45, schrieb Dan Carpenter:
> The "ret = -EIO" is deliberate.  It's a very uncommon thing to do and it
> upsets static checkers because they normally would expect "ret = -EIO".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/dport.c b/drivers/gpu/drm/nouveau/core/engine/disp/dport.c
> index 1bd4c63..2bc45ae 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/disp/dport.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/dport.c
> @@ -322,6 +322,7 @@ nouveau_dp_train(struct nouveau_disp *disp, const struct nouveau_dp_func *func,
>  	while (*link_bw > (dp->dpcd[1] * 27000))
>  		link_bw++;
>  
> +	/* set ret to -EIO on the last loop iteration */
>  	while ((ret = -EIO) && link_bw[0]) {
>  		/* find minimum required lane count at this link rate */
>  		dp->link_nr = dp->dpcd[2] & DPCD_RC02_MAX_LANE_COUNT;


It is sensible to do so now,
but in the long runs it pays to rewrite that as it confuses not only
static checkers but also the brains of people trying to understand
the code.

just my 2 cents,
re,
 wh
