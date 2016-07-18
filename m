From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 18 Jul 2016 07:12:08 +0000
Subject: Re: [PATCH] drm/ttm: Delete an unnecessary check before the function call "ttm_tt_destroy"
Message-Id: <20160718071208.GV17101@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <5649EC25.3040004@users.sourceforge.net>
 <ec9bf71e-8d0f-4bf3-b2ba-b0b1bd444b22@users.sourceforge.net>
In-Reply-To: <ec9bf71e-8d0f-4bf3-b2ba-b0b1bd444b22@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

On Fri, Jul 15, 2016 at 08:28:18PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 15 Jul 2016 20:20:48 +0200
> 
> The ttm_tt_destroy() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 39386f5..23809d0 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -146,9 +146,7 @@ static void ttm_bo_release_list(struct kref *list_kref)
>  	BUG_ON(bo->mem.mm_node != NULL);
>  	BUG_ON(!list_empty(&bo->lru));
>  	BUG_ON(!list_empty(&bo->ddestroy));
> -
> -	if (bo->ttm)
> -		ttm_tt_destroy(bo->ttm);
> +	tm_tt_destroy(bo->ttm);

This doesn't compile. Tsk, pls be more careful, and definitely
compile-test _all_ your changes before hitting send. I've dropped this one
from my queue, the others still look ok.
-Daniel

>  	atomic_dec(&bo->glob->bo_count);
>  	if (bo->resv = &bo->ttm_resv)
>  		reservation_object_fini(&bo->ttm_resv);
> -- 
> 2.9.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
