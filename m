From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 21 Jan 2021 09:12:27 +0000
Subject: Re: [PATCH] drm/i915/dp: Fix a logical vs bitwise OR bug
Message-Id: <87h7namz5w.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAkaBa22zvbXKd4E@mwanda>
In-Reply-To: <YAkaBa22zvbXKd4E@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>, Sean Paul <seanpaul@chromium.org>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, Wambui Karuga <wambui.karugax@gmail.com>

On Thu, 21 Jan 2021, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This was supposed to be | instead of ||.
>
> Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, but we already have the fix [1] for this that I thought was
pushed by now [2].

Chris?


BR,
Jani.


[1] http://lore.kernel.org/r/20201223103917.14687-1-chris@chris-wilson.co.uk
[2] http://lore.kernel.org/r/161069893278.19482.3803444937046587332@build.alporthouse.com

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 8a00e609085f..9c6f427b2703 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6955,8 +6955,8 @@ intel_dp_update_420(struct intel_dp *intel_dp)
>  							intel_dp->downstream_ports);
>  	rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
>  								 intel_dp->downstream_ports,
> -								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
> -								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
> +								 DP_DS_HDMI_BT601_RGB_YCBCR_CONV |
> +								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV |
>  								 DP_DS_HDMI_BT2020_RGB_YCBCR_CONV);
>  
>  	if (INTEL_GEN(i915) >= 11) {

-- 
Jani Nikula, Intel Open Source Graphics Center
