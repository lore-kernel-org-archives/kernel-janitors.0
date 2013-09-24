From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 24 Sep 2013 08:22:56 +0000
Subject: Re: [patch] drm/i915: precendence bug in GT_PARITY_ERROR()
Message-Id: <87eh8e6333.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130924075735.GB29141@elgon.mountain>
In-Reply-To: <20130924075735.GB29141@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, 24 Sep 2013, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The | operation has higher precedence than "?:" so the macro always
> returns GT_RENDER_L3_PARITY_ERROR_INTERRUPT_S1.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Introduced in
commit 35a85ac60618521d41cfdb14f3fbfc8ad7329e9e
Author: Ben Widawsky <benjamin.widawsky@intel.com>
Date:   Thu Sep 19 11:13:41 2013 -0700

    drm/i915: Add second slice l3 remapping

which hasn't been merged to Linus' tree yet.


BR,
Jani.


>
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index c4f9bef..876666b 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -940,7 +940,7 @@
>  
>  #define GT_PARITY_ERROR(dev) \
>  	(GT_RENDER_L3_PARITY_ERROR_INTERRUPT | \
> -	 IS_HASWELL(dev) ? GT_RENDER_L3_PARITY_ERROR_INTERRUPT_S1 : 0)
> +	 (IS_HASWELL(dev) ? GT_RENDER_L3_PARITY_ERROR_INTERRUPT_S1 : 0))
>  
>  /* These are all the "old" interrupts */
>  #define ILK_BSD_USER_INTERRUPT				(1<<5)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
