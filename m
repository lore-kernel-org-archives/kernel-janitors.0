From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 09 Aug 2013 09:58:26 +0000
Subject: Re: [patch] drm/i915: precedence bug in hsw_compute_wm_results()
Message-Id: <20130809095826.GA4313@cantiga.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130809094302.GA29282@elgon.mountain>
In-Reply-To: <20130809094302.GA29282@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Fri, Aug 09, 2013 at 12:43:02PM +0300, Dan Carpenter wrote:
> The '!' operation has higher precedence than the compare so probably
> this test is never true.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index a5a9959..0b9d9a7 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -2562,7 +2562,7 @@ static void hsw_compute_wm_results(struct drm_device *dev,
>  	 * a WM level. */
>  	results->enable_fbc_wm = true;
>  	for (level = 1; level <= max_level; level++) {
> -		if (!lp_results[level - 1].fbc_val > lp_maximums->fbc) {
> +		if (lp_results[level - 1].fbc_val <= lp_maximums->fbc) {

I didn't spot that '!' at all. It's a stray and should be just removed.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
