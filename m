From: Liviu Dudau <liviu.dudau@arm.com>
Date: Fri, 04 Oct 2019 19:27:20 +0000
Subject: Re: [PATCH][next] drm/komeda: remove redundant assignment to pointer disable_done
Message-Id: <20191004192720.7eiqdvsm2yv62svg@e110455-lin.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004162156.325-1-colin.king@canonical.com>
In-Reply-To: <20191004162156.325-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: James Wang <james.qian.wang@arm.com>, Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 04, 2019 at 05:21:56PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer disable_done is being initialized with a value that
> is never read and is being re-assigned a little later on. The
> assignment is redundant and hence can be removed.

Not really true, isn't it? The re-assignment is done under the condition that
crtc->state->active is true. disable_done will be used regardless after the if
block, so we can't skip this initialisation.

Not sure why Coverity flags this, but I would NAK this patch.

Best regards,
Liviu

> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 75263d8cd0bd..9beeda04818b 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -296,7 +296,7 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
>  	struct komeda_crtc_state *old_st = to_kcrtc_st(old);
>  	struct komeda_pipeline *master = kcrtc->master;
>  	struct komeda_pipeline *slave  = kcrtc->slave;
> -	struct completion *disable_done = &crtc->state->commit->flip_done;
> +	struct completion *disable_done;
>  	bool needs_phase2 = false;
>  
>  	DRM_DEBUG_ATOMIC("CRTC%d_DISABLE: active_pipes: 0x%x, affected: 0x%x\n",
> -- 
> 2.20.1
> 

-- 
==========
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
