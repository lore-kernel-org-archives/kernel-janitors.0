From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Wed, 29 May 2019 15:03:56 +0000
Subject: Re: [PATCH][next] drm/i915: fix uninitialized variable 'mask'
Message-Id: <87o93l480z.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190529142927.16699-1-colin.king@canonical.com>
In-Reply-To: <20190529142927.16699-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Stuart Summers <stuart.summers@intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

On Wed, 29 May 2019, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently mask is not initialized and so data is being bit-wise or'd into
> a garbage value. Fix this by inintializing mask to zero.
>
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 1ac159e23c2c ("drm/i915: Expand subslice mask")

This was already reverted for other reasons. Need to be fixed on the
next round. For future reference, please Cc: author and reviewers of the
referenced commit.

BR,
Jani.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_sseu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
> index 763b811f2c9d..5a89672d98a2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sseu.c
> +++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
> @@ -41,7 +41,7 @@ void intel_sseu_copy_subslices(const struct sseu_dev_info *sseu, int slice,
>  u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
>  {
>  	int i, offset = slice * sseu->ss_stride;
> -	u32 mask;
> +	u32 mask = 0;
>  
>  	GEM_BUG_ON(slice >= sseu->max_slices);

-- 
Jani Nikula, Intel Open Source Graphics Center
