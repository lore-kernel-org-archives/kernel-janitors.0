From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue, 14 Jul 2020 14:16:33 +0000
Subject: Re: [PATCH] drm/i915/selftest: Fix an error code in live_noa_gpr()
Message-Id: <71508ba9-6cad-45f9-a3b1-b3401ac0a1d5@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714141216.GA314989@mwanda>
In-Reply-To: <20200714141216.GA314989@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On 14/07/2020 17:12, Dan Carpenter wrote:
> The error code is not set on this error path.  It's either zero or
> uninitialized at this point.
>
> Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
> index deb6dec1b5ab..7aa73bb03381 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
> @@ -329,6 +329,7 @@ static int live_noa_gpr(void *arg)
>   	cs = intel_ring_begin(rq, 2 * 32 + 2);
>   	if (IS_ERR(cs)) {
>   		i915_request_add(rq);
> +		err = PTR_ERR(cs);
>   		goto out_rq;
>   	}
>   

Looks like there is another below :

cs = intel_ring_begin(rq, 4);
if (IS_ERR(cs)) {
         i915_request_add(rq);
         goto out_rq;
}

-Lionel
