From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 30 Jun 2020 09:41:11 +0000
Subject: Re: [PATCH][next] drm/i915: fix a couple of spelling mistakes in kernel parameter help text
Message-Id: <87ftacnb60.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200616082129.65517-1-colin.king@canonical.com>
In-Reply-To: <20200616082129.65517-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 16 Jun 2020, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There are a couple of spelling mistakes in kernel parameter help text,
> namely "helpfull" and "paramters".  Fix them.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pushed, thanks for the patch.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/i915_params.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index a7b61e6ec508..8d8db9ff0a48 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -99,8 +99,8 @@ i915_param_named_unsafe(enable_psr, int, 0400,
>  
>  i915_param_named(psr_safest_params, bool, 0400,
>  	"Replace PSR VBT parameters by the safest and not optimal ones. This "
> -	"is helpfull to detect if PSR issues are related to bad values set in "
> -	" VBT. (0=use VBT paramters, 1=use safest parameters)");
> +	"is helpful to detect if PSR issues are related to bad values set in "
> +	" VBT. (0=use VBT parameters, 1=use safest parameters)");
>  
>  i915_param_named_unsafe(force_probe, charp, 0400,
>  	"Force probe the driver for specified devices. "

-- 
Jani Nikula, Intel Open Source Graphics Center
