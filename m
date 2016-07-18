From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 18 Jul 2016 14:45:13 +0000
Subject: Re: [PATCH v3] drm/ttm: Delete an unnecessary check before the function call "ttm_tt_destroy"
Message-Id: <20160718144513.GA17101@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <5649EC25.3040004@users.sourceforge.net>
 <ec9bf71e-8d0f-4bf3-b2ba-b0b1bd444b22@users.sourceforge.net>
 <20160718071208.GV17101@phenom.ffwll.local>
 <54338f58-830c-a8b4-4554-5d4459bcd321@users.sourceforge.net>
In-Reply-To: <54338f58-830c-a8b4-4554-5d4459bcd321@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, Jul 18, 2016 at 04:10:36PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 18 Jul 2016 16:06:18 +0200
> 
> The ttm_tt_destroy() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

When resending pls describe what changed (and why). Also I'd still like
that smatch included in the commit message.
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 39386f5..4e55863 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -146,9 +146,7 @@ static void ttm_bo_release_list(struct kref *list_kref)
>  	BUG_ON(bo->mem.mm_node != NULL);
>  	BUG_ON(!list_empty(&bo->lru));
>  	BUG_ON(!list_empty(&bo->ddestroy));
> -
> -	if (bo->ttm)
> -		ttm_tt_destroy(bo->ttm);
> +	ttm_tt_destroy(bo->ttm);
>  	atomic_dec(&bo->glob->bo_count);
>  	if (bo->resv = &bo->ttm_resv)
>  		reservation_object_fini(&bo->ttm_resv);
> -- 
> 2.9.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
