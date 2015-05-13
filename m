From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 May 2015 07:23:10 +0000
Subject: Re: [patch] drm/edid: fix a debug message
Message-Id: <20150513072310.GU15256@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150512180737.GA5672@mwanda>
In-Reply-To: <20150512180737.GA5672@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Todd Previte <tprevite@gmail.com>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, May 12, 2015 at 09:07:37PM +0300, Dan Carpenter wrote:
> There is an extra semi-colon on the if statement so the debug output
> always says "Failed to write EDID checksum" even when it didn't fail.
> 
> Fixes: 559be30cb74d ('drm/i915: Implement the intel_dp_autotest_edid function for DP EDID complaince tests')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops, thanks a lot for catching this.
-Daniel

> 
> diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
> index eca82cf..75bccd6 100644
> --- a/drivers/gpu/drm/i915/intel_dp.c
> +++ b/drivers/gpu/drm/i915/intel_dp.c
> @@ -4142,7 +4142,7 @@ static uint8_t intel_dp_autotest_edid(struct intel_dp *intel_dp)
>  		if (!drm_dp_dpcd_write(&intel_dp->aux,
>  					DP_TEST_EDID_CHECKSUM,
>  					&intel_connector->detect_edid->checksum,
> -					1));
> +					1))
>  			DRM_DEBUG_KMS("Failed to write EDID checksum\n");
>  
>  		test_result = DP_TEST_ACK | DP_TEST_EDID_CHECKSUM_WRITE;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
