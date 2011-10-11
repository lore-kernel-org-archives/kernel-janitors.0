From: Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 11 Oct 2011 22:26:16 +0000
Subject: Re: [patch] drm/nva3: checking the wrong variable
Message-Id: <1318371976.2259.1.camel@nisroch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111011143453.GA29096@elgon.mountain>
In-Reply-To: <20111011143453.GA29096@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, 2011-10-11 at 17:34 +0300, Dan Carpenter wrote:
> "id" is unsigned here and it's never less than zero.  I believe the
> intent was to check the return value from nva3_pm_pll_offset().
> Also I've changed it to pass on the -ENOENT error code from the lower
> levels instead of returning -EINVAL.
The patch looks correct.  It's worth noting though that a complete
rewrite of that particular code is queued for 3.2 already.

Ben.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/nouveau/nva3_pm.c b/drivers/gpu/drm/nouveau/nva3_pm.c
> index e4b2b9e..0be517d 100644
> --- a/drivers/gpu/drm/nouveau/nva3_pm.c
> +++ b/drivers/gpu/drm/nouveau/nva3_pm.c
> @@ -112,8 +112,8 @@ nva3_pm_clock_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl,
>  		return (ret = -ENOENT) ? NULL : ERR_PTR(ret);
>  
>  	off = nva3_pm_pll_offset(id);
> -	if (id < 0)
> -		return ERR_PTR(-EINVAL);
> +	if (off < 0)
> +		return ERR_PTR(off);
>  
> 
>  	pll = kzalloc(sizeof(*pll), GFP_KERNEL);


