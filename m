From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 27 Jan 2015 07:56:49 +0000
Subject: Re: [PATCH] drivers: gpu: drm: i915: intel_fifo_underrun.c: Fix a typo in comment
Message-Id: <87siewfygu.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1422290852-4060-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1422290852-4060-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>, daniel.vetter@intel.com
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Mon, 26 Jan 2015, Kumar Amit Mehta <gmate.amit@gmail.com> wrote:
> The comment for intel_cpu_fifo_underrun_irq_handler() is not consistent
> with the code and the rest of the comment for this routine. This patch
> fixes this typo in comment.
>
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/intel_fifo_underrun.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_fifo_underrun.c b/drivers/gpu/drm/i915/intel_fifo_underrun.c
> index 77af512..04e248d 100644
> --- a/drivers/gpu/drm/i915/intel_fifo_underrun.c
> +++ b/drivers/gpu/drm/i915/intel_fifo_underrun.c
> @@ -341,7 +341,7 @@ bool intel_set_pch_fifo_underrun_reporting(struct drm_i915_private *dev_priv,
>  }
>  
>  /**
> - * intel_pch_fifo_underrun_irq_handler - handle PCH fifo underrun interrupt
> + * intel_cpu_fifo_underrun_irq_handler - handle CPU fifo underrun interrupt
>   * @dev_priv: i915 device instance
>   * @pipe: (CPU) pipe to set state for
>   *
> -- 
> 2.1.0
>

-- 
Jani Nikula, Intel Open Source Technology Center
