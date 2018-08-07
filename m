From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue, 07 Aug 2018 14:26:46 +0000
Subject: Re: [PATCH] drm/i915/gvt: Off by one in intel_vgpu_write_fence()
Message-Id: <20180807142646.GA2210@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180807023944.GZ22630@zhen-hp.sh.intel.com>
 <20180807064602.sagf25ettlvfpidm@kili.mountain>
In-Reply-To: <20180807064602.sagf25ettlvfpidm@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org

On Tue, Aug 07, 2018 at 09:46:02AM +0300, Dan Carpenter wrote:
> The > should be >= here so that we don't read one element beyond the
> end of the array.
> 
> Fixes: 28a60dee2ce6 ("drm/i915/gvt: vGPU HW resource management")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> index 380eeb2a0e83..fe754022e356 100644
> --- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
> +++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> @@ -131,7 +131,7 @@ void intel_vgpu_write_fence(struct intel_vgpu *vgpu,
>  
>  	assert_rpm_wakelock_held(dev_priv);
>  
> -	if (WARN_ON(fence > vgpu_fence_sz(vgpu)))
> +	if (WARN_ON(fence >= vgpu_fence_sz(vgpu)))
>  		return;
>  
>  	reg = vgpu->fence.regs[fence];
