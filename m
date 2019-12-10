From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 10 Dec 2019 14:34:48 +0000
Subject: Re: [PATCH][next] drm/i915/selftests: fix uninitialized variable sum when summing up values
Message-Id: <157598848809.15362.74032135864302866@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191210143205.338308-1-colin.king@canonical.com>
In-Reply-To: <20191210143205.338308-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2019-12-10 14:32:05)
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the variable sum is not uninitialized and hence will cause an
> incorrect result in the summation values.  Fix this by initializing
> sum to the first item in the summation.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 3c7a44bbbfa7 ("drm/i915/selftests: Perform some basic cycle counting of MI ops")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_engine_cs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
> index 761d81f4bd68..f88e445a1cae 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
> @@ -108,7 +108,7 @@ static u32 trifilter(u32 *a)
>  
>         sort(a, COUNT, sizeof(*a), cmp_u32, NULL);
>  
> -       sum += mul_u32_u32(a[2], 2);
> +       sum = mul_u32_u32(a[2], 2);

/o\
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
