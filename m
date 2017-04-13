From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 13 Apr 2017 20:29:24 +0000
Subject: Re: [PATCH] drm/i915: uninitialized value on error path
Message-Id: <20170413202924.GY12532@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170413195311.GB26108@mwanda>
In-Reply-To: <20170413195311.GB26108@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org

On Thu, Apr 13, 2017 at 10:53:11PM +0300, Dan Carpenter wrote:
> "ret" isn't initialized on this error path.  It doesn't really cause
> any problems unless it's randomly set to -EDEADLK which is not likely.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
> index 48a546210d8b..d0e9578952d5 100644
> --- a/drivers/gpu/drm/i915/intel_display.c
> +++ b/drivers/gpu/drm/i915/intel_display.c
> @@ -9563,6 +9563,7 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
>  	 */
>  	if (!crtc) {
>  		DRM_DEBUG_KMS("no pipe available for load-detect\n");
> +		ret = -ENODEV;
>  		goto fail;
>  	}

Looks like we need

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index 8ffeda9d349b..4d0b3d80ed24 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -9618,6 +9618,7 @@ int intel_get_load_detect_pipe(struct drm_connector *connector,
                DRM_DEBUG_KMS("reusing fbdev for load-detection framebuffer\n");
        if (IS_ERR(fb)) {
                DRM_DEBUG_KMS("failed to allocate framebuffer for load-detection\n");
+               ret = PTR_ERR(fb);
                goto fail;
        }
 
as well.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
