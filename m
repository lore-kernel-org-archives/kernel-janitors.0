From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Wed, 09 Oct 2019 09:52:15 +0000
Subject: Re: [PATCH][next] drm/i915: remove redundant variable err
Message-Id: <87h84igsa8.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009093935.17895-1-colin.king@canonical.com>
In-Reply-To: <20191009093935.17895-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 09 Oct 2019, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> An earlier commit removed any error assignments to err and we
> are now left with a zero assignment to err and a check that is
> always false. Clean this up by removing the redundant variable
> err and the error check.
>
> Addresses-Coverity: ("'Constant' variable guard")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Fixes: b1e3177bd1d8 ("drm/i915: Coordinate i915_active with its own mutex")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>


BR,
Jani.


> ---
>  drivers/gpu/drm/i915/i915_active.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index aa37c07004b9..67305165c12a 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -438,7 +438,6 @@ static void enable_signaling(struct i915_active_fence *active)
>  int i915_active_wait(struct i915_active *ref)
>  {
>  	struct active_node *it, *n;
> -	int err = 0;
>  
>  	might_sleep();
>  
> @@ -456,8 +455,6 @@ int i915_active_wait(struct i915_active *ref)
>  	/* Any fence added after the wait begins will not be auto-signaled */
>  
>  	i915_active_release(ref);
> -	if (err)
> -		return err;
>  
>  	if (wait_var_event_interruptible(ref, i915_active_is_idle(ref)))
>  		return -EINTR;

-- 
Jani Nikula, Intel Open Source Graphics Center
