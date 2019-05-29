From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Wed, 29 May 2019 15:04:35 +0000
Subject: Re: [PATCH][next] drm/i915: fix uninitialized variable 'subslice_mask'
Message-Id: <87lfyp47zw.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190529144325.17235-1-colin.king@canonical.com>
In-Reply-To: <20190529144325.17235-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 29 May 2019, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently subslice_mask is not initialized and so data is being
> bit-wise or'd into a garbage value. Fix this by inintializing
> subslice_mask to zero.
>
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 1ac159e23c2c ("drm/i915: Expand subslice mask")

This was already reverted for other reasons. Need to be fixed on the
next round. For future reference, please Cc: author and reviewers of the
referenced commit.

BR,
Jani.


> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/intel_device_info.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index 3625f777f3a3..d395a09b994f 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -298,7 +298,7 @@ static void cherryview_sseu_info_init(struct drm_i915_private *dev_priv)
>  {
>  	struct sseu_dev_info *sseu = &RUNTIME_INFO(dev_priv)->sseu;
>  	u32 fuse;
> -	u8 subslice_mask;
> +	u8 subslice_mask = 0;
>  
>  	fuse = I915_READ(CHV_FUSE_GT);

-- 
Jani Nikula, Intel Open Source Graphics Center
