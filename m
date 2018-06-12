From: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 12 Jun 2018 12:08:43 +0000
Subject: Re: [Intel-gfx] [PATCH][V3] drm/i915/guc: fix GEM_BUG_ON check
Message-Id: <op.zkhv0tz5xaggs7@mwajdecz-mobl1.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180612093804.11341-1-colin.king@canonical.com>
In-Reply-To: <20180612093804.11341-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 12 Jun 2018 11:38:04 +0200, Colin King <colin.king@canonical.com>  
wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The check for level being less than zero always false because flags
> is currently unsigned and can never be negative. Fix this by making
> level a s32.
>
> Detected by CoverityScan, CID#1468363 ("Macro compares unsigned to 0")
>
> Fixes: cb5d64e9f13e ("drm/i915/guc: Allow user to control default GuC  
> logging")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> ---
> V3: Make level s32 and add the missing Fixes: tag, thanks to Dan  
> Carpenter and
> Jani Nikula for correcting my mistakes
>
> ---
>  drivers/gpu/drm/i915/intel_guc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_guc.c  
> b/drivers/gpu/drm/i915/intel_guc.c
> index 116f4ccf1bbd..bdb1fab322bf 100644
> --- a/drivers/gpu/drm/i915/intel_guc.c
> +++ b/drivers/gpu/drm/i915/intel_guc.c
> @@ -205,7 +205,7 @@ void intel_guc_fini(struct intel_guc *guc)
> static u32 get_log_control_flags(void)
>  {
> -	u32 level = i915_modparams.guc_log_level;
> +	s32 level = i915_modparams.guc_log_level;

s/s32 level/int level

to match modparam type as already suggested by others

>  	u32 flags = 0;
> 	GEM_BUG_ON(level < 0);

please note that this BUG_ON will go away with pending [1] so maybe
we can just merge series [2] instead ?

Thanks,
Michal

[1] https://patchwork.freedesktop.org/patch/227365/
[2] https://patchwork.freedesktop.org/series/44201/
