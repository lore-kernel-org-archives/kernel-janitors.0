From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 28 Feb 2020 14:18:34 +0000
Subject: Re: [PATCH] drm/i915/selftests: Fix return in assert_mmap_offset()
Message-Id: <158289951401.24106.17765805022733010158@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228141413.qfjf4abr323drlo4@kili.mountain>
In-Reply-To: <20200228141413.qfjf4abr323drlo4@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org

Quoting Dan Carpenter (2020-02-28 14:14:13)
> The assert_mmap_offset() returns type bool so if we return an error
> pointer that is "return true;" or success.  If we have an error, then
> we should return false.
> 
> Fixes: 3d81d589d6e3 ("drm/i915: Test exhaustion of the mmap space")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.  In theory it's correct, but when you're adding new error
> paths it's always good to test.
> 
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index ef7c74cff28a..43912e9b683d 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -570,7 +570,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
>  
>         obj = i915_gem_object_create_internal(i915, size);
>         if (IS_ERR(obj))
> -               return PTR_ERR(obj);
> +               return false;

"This is not the error you are looking for"

Fits the use,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
