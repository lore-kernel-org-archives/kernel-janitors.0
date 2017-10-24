From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 24 Oct 2017 12:52:24 +0000
Subject: Re: [PATCH] drm/i915/gvt: Use common error handling code in shadow_workload_ring_buffer()
Message-Id: <87efpsiu7r.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f563de94-afaa-ecde-2907-d6baaad65939@users.sourceforge.net>
In-Reply-To: <f563de94-afaa-ecde-2907-d6baaad65939@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 24 Oct 2017, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Oct 2017 14:20:06 +0200
>
> Add a jump target so that a call of the function "gvt_vgpu_err" is stored
> only once at the end of this function implementation.
> Replace two calls by goto statements.
>
> This issue was detected by using the Coccinelle software.

I don't think this is an issue or an improvement.

BR,
Jani.

>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index 2c0ccbb817dc..caa181380958 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -2640,10 +2640,9 @@ static int shadow_workload_ring_buffer(struct intel_vgpu_workload *workload)
>  	if (gma_head > gma_tail) {
>  		ret = copy_gma_to_hva(vgpu, vgpu->gtt.ggtt_mm,
>  				      gma_head, gma_top, shadow_ring_buffer_va);
> -		if (ret < 0) {
> -			gvt_vgpu_err("fail to copy guest ring buffer\n");
> -			return ret;
> -		}
> +		if (ret < 0)
> +			goto report_failure;
> +
>  		shadow_ring_buffer_va += ret;
>  		gma_head = workload->rb_start;
>  	}
> @@ -2651,11 +2650,14 @@ static int shadow_workload_ring_buffer(struct intel_vgpu_workload *workload)
>  	/* copy head or start <-> tail */
>  	ret = copy_gma_to_hva(vgpu, vgpu->gtt.ggtt_mm, gma_head, gma_tail,
>  				shadow_ring_buffer_va);
> -	if (ret < 0) {
> -		gvt_vgpu_err("fail to copy guest ring buffer\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		goto report_failure;
> +
>  	return 0;
> +
> +report_failure:
> +	gvt_vgpu_err("fail to copy guest ring buffer\n");
> +	return ret;
>  }
>  
>  int intel_gvt_scan_and_shadow_ringbuffer(struct intel_vgpu_workload *workload)

-- 
Jani Nikula, Intel Open Source Technology Center
