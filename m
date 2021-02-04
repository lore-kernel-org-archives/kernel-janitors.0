From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 04 Feb 2021 10:44:31 +0000
Subject: Re: [PATCH][next] drm/i915/display: fix spelling mistake "Couldnt" -> "Couldn't"
Message-Id: <87eehwf6y8.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210203110803.17894-1-colin.king@canonical.com>
In-Reply-To: <20210203110803.17894-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 03 Feb 2021, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a drm_dbg message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, pushed to drm-intel-next.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8c12d5375607..a338720cee2e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2650,7 +2650,7 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
>  	if (intel_dp_pcon_start_frl_training(intel_dp) < 0) {
>  		int ret, mode;
>  
> -		drm_dbg(&dev_priv->drm, "Couldnt set FRL mode, continuing with TMDS mode\n");
> +		drm_dbg(&dev_priv->drm, "Couldn't set FRL mode, continuing with TMDS mode\n");
>  		ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
>  		mode = drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, NULL);

-- 
Jani Nikula, Intel Open Source Graphics Center
