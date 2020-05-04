From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 04 May 2020 16:58:03 +0000
Subject: Re: [PATCH] drm/i915/gem: Fix inconsistent IS_ERR and PTR_ERR
Message-Id: <dfe752dc-6833-2b08-7e7c-6c52ffc81626@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>

…
> The proper pointer to be passed as argument is ce.
>
> This bug was detected with the help of Coccinelle.

My software development attention was caught also by your commit message.


…
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1325,7 +1325,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
>
>  		ce = intel_context_create(engine);
>  		if (IS_ERR(ce)) {
> -			err = PTR_ERR(rq);
> +			err = PTR_ERR(ce);
>  			goto err_unpin;
>  		}
>

Are you looking for any more questionable identifier (or expression) combinations
also at other places by the means of advanced source code analysis?

Regards,
Markus
