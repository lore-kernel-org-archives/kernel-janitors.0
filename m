From: Eric Engestrom <eric.engestrom@imgtec.com>
Date: Thu, 13 Oct 2016 09:07:22 +0000
Subject: Re: [patch] drm/i915: fix a read size argument
Message-Id: <20161013090722.GI1743@imgtec.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013085508.GJ16198@mwanda>
In-Reply-To: <20161013085508.GJ16198@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>

On Thu, Oct 13, 2016 at 11:55:08AM +0300, Dan Carpenter wrote:
> We want to read 3 bytes here, but because the parenthesis are in the
> wrong place we instead read:
> 
> 	sizeof(intel_dp->edp_dpcd) = sizeof(intel_dp->edp_dpcd)
> 
> which is one byte.
> 
> Fixes: fe5a66f91c88 ("drm/i915: Read PSR caps/intermediate freqs/etc. only once on eDP")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch!  What tool did you use to find it, or did you find it by
inspection?
Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>

(btw, there's a missing `---` here, between the commit msg and the diff)

> 
> diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
> index 14a3cf0..ee8aa95 100644
> --- a/drivers/gpu/drm/i915/intel_dp.c
> +++ b/drivers/gpu/drm/i915/intel_dp.c
> @@ -3551,8 +3551,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>  	/* Read the eDP Display control capabilities registers */
>  	if ((intel_dp->dpcd[DP_EDP_CONFIGURATION_CAP] & DP_DPCD_DISPLAY_CONTROL_CAPABLE) &&
>  	    drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,
> -			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd) =
> -			     sizeof(intel_dp->edp_dpcd)))
> +			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd)) =
> +			     sizeof(intel_dp->edp_dpcd))
>  		DRM_DEBUG_KMS("EDP DPCD : %*ph\n", (int) sizeof(intel_dp->edp_dpcd),
>  			      intel_dp->edp_dpcd);
