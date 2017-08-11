From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 11 Aug 2017 16:06:32 +0000
Subject: Re: [PATCH][drm-next] drm/i915: make structure intel_sprite_plane_funcs static
Message-Id: <20170811160632.n5kmtyom4xwsk6xx@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170811134938.4183-1-colin.king@canonical.com>
In-Reply-To: <20170811134938.4183-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>

On Fri, Aug 11, 2017 at 02:49:38PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure intel_sprite_plane_funcs is local to the source
> and does not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'intel_sprite_plane_funcs' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
-Daniel

> ---
>  drivers/gpu/drm/i915/intel_sprite.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_sprite.c b/drivers/gpu/drm/i915/intel_sprite.c
> index e11f8782c9eb..524933b01483 100644
> --- a/drivers/gpu/drm/i915/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/intel_sprite.c
> @@ -1184,7 +1184,7 @@ static bool intel_sprite_plane_format_mod_supported(struct drm_plane *plane,
>  	unreachable();
>  }
>  
> -const struct drm_plane_funcs intel_sprite_plane_funcs = {
> +static const struct drm_plane_funcs intel_sprite_plane_funcs = {
>          .update_plane = drm_atomic_helper_update_plane,
>          .disable_plane = drm_atomic_helper_disable_plane,
>          .destroy = intel_plane_destroy,
> -- 
> 2.11.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
