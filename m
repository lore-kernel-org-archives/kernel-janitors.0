From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 20 Jun 2018 18:59:56 +0000
Subject: Re: [PATCH][next] drm/i915/psr: fix copy-paste error with setting of tp2_wakeup_time_us
Message-Id: <20180620185956.GB8258@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620132543.28092-1-colin.king@canonical.com>
In-Reply-To: <20180620132543.28092-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Jun 20, 2018 at 02:25:43PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently for the psr_table->tp2_tp3_wakeup_time case 3 there appears
> to be a copy-paste error from the previous switch statement where
> dev_priv->vbt.psr.tp1_wakeup_time_us is being assigned and I believe
> it should be dev_priv->vbt.psr.tp2_tp3_wakeup_time_us that should be
> assigned instead.
> 
> Detected by CoverityScan, CID#1470105 ("Copy-paste error")
> 
> Fixes: 77312ae8f071 ("drm/i915/psr: vbt change for psr")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing to dinq now. thanks for the patch.

> ---
>  drivers/gpu/drm/i915/intel_bios.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_bios.c b/drivers/gpu/drm/i915/intel_bios.c
> index 03f04b472394..e0a14be1080a 100644
> --- a/drivers/gpu/drm/i915/intel_bios.c
> +++ b/drivers/gpu/drm/i915/intel_bios.c
> @@ -740,7 +740,7 @@ parse_psr(struct drm_i915_private *dev_priv, const struct bdb_header *bdb)
>  			dev_priv->vbt.psr.tp2_tp3_wakeup_time_us = 100;
>  			break;
>  		case 3:
> -			dev_priv->vbt.psr.tp1_wakeup_time_us = 0;
> +			dev_priv->vbt.psr.tp2_tp3_wakeup_time_us = 0;
>  			break;
>  		default:
>  			DRM_DEBUG_KMS("VBT tp2_tp3 wakeup time value %d is outside range[0-3], defaulting to max value 2500us\n",
> -- 
> 2.17.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
