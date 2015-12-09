From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 09 Dec 2015 07:21:11 +0000
Subject: Re: [PATCH] drm/i915: constify intel_dvo_dev_ops structures
Message-Id: <20151209072111.GK20822@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449608127-21715-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1449608127-21715-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, Dec 08, 2015 at 09:55:27PM +0100, Julia Lawall wrote:
> The intel_dvo_dev_ops structures are never modified, so declare them as
> const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Queued for -next, thanks for the patch.
-Daniel

> 
> ---
>  drivers/gpu/drm/i915/dvo.h        |   12 ++++++------
>  drivers/gpu/drm/i915/dvo_ch7017.c |    2 +-
>  drivers/gpu/drm/i915/dvo_ch7xxx.c |    2 +-
>  drivers/gpu/drm/i915/dvo_ivch.c   |    2 +-
>  drivers/gpu/drm/i915/dvo_ns2501.c |    2 +-
>  drivers/gpu/drm/i915/dvo_sil164.c |    2 +-
>  drivers/gpu/drm/i915/dvo_tfp410.c |    2 +-
>  7 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/dvo.h b/drivers/gpu/drm/i915/dvo.h
> index 13dea42..5e6a301 100644
> --- a/drivers/gpu/drm/i915/dvo.h
> +++ b/drivers/gpu/drm/i915/dvo.h
> @@ -129,11 +129,11 @@ struct intel_dvo_dev_ops {
>  	void (*dump_regs)(struct intel_dvo_device *dvo);
>  };
>  
> -extern struct intel_dvo_dev_ops sil164_ops;
> -extern struct intel_dvo_dev_ops ch7xxx_ops;
> -extern struct intel_dvo_dev_ops ivch_ops;
> -extern struct intel_dvo_dev_ops tfp410_ops;
> -extern struct intel_dvo_dev_ops ch7017_ops;
> -extern struct intel_dvo_dev_ops ns2501_ops;
> +extern const struct intel_dvo_dev_ops sil164_ops;
> +extern const struct intel_dvo_dev_ops ch7xxx_ops;
> +extern const struct intel_dvo_dev_ops ivch_ops;
> +extern const struct intel_dvo_dev_ops tfp410_ops;
> +extern const struct intel_dvo_dev_ops ch7017_ops;
> +extern const struct intel_dvo_dev_ops ns2501_ops;
>  
>  #endif /* _INTEL_DVO_H */
> diff --git a/drivers/gpu/drm/i915/dvo_ch7017.c b/drivers/gpu/drm/i915/dvo_ch7017.c
> index cbb2202..b3c7c19 100644
> --- a/drivers/gpu/drm/i915/dvo_ch7017.c
> +++ b/drivers/gpu/drm/i915/dvo_ch7017.c
> @@ -402,7 +402,7 @@ static void ch7017_destroy(struct intel_dvo_device *dvo)
>  	}
>  }
>  
> -struct intel_dvo_dev_ops ch7017_ops = {
> +const struct intel_dvo_dev_ops ch7017_ops = {
>  	.init = ch7017_init,
>  	.detect = ch7017_detect,
>  	.mode_valid = ch7017_mode_valid,
> diff --git a/drivers/gpu/drm/i915/dvo_ch7xxx.c b/drivers/gpu/drm/i915/dvo_ch7xxx.c
> index 4b4acc1..44b3159 100644
> --- a/drivers/gpu/drm/i915/dvo_ch7xxx.c
> +++ b/drivers/gpu/drm/i915/dvo_ch7xxx.c
> @@ -356,7 +356,7 @@ static void ch7xxx_destroy(struct intel_dvo_device *dvo)
>  	}
>  }
>  
> -struct intel_dvo_dev_ops ch7xxx_ops = {
> +const struct intel_dvo_dev_ops ch7xxx_ops = {
>  	.init = ch7xxx_init,
>  	.detect = ch7xxx_detect,
>  	.mode_valid = ch7xxx_mode_valid,
> diff --git a/drivers/gpu/drm/i915/dvo_ivch.c b/drivers/gpu/drm/i915/dvo_ivch.c
> index ff9f1b0..4950b82 100644
> --- a/drivers/gpu/drm/i915/dvo_ivch.c
> +++ b/drivers/gpu/drm/i915/dvo_ivch.c
> @@ -490,7 +490,7 @@ static void ivch_destroy(struct intel_dvo_device *dvo)
>  	}
>  }
>  
> -struct intel_dvo_dev_ops ivch_ops = {
> +const struct intel_dvo_dev_ops ivch_ops = {
>  	.init = ivch_init,
>  	.dpms = ivch_dpms,
>  	.get_hw_state = ivch_get_hw_state,
> diff --git a/drivers/gpu/drm/i915/dvo_ns2501.c b/drivers/gpu/drm/i915/dvo_ns2501.c
> index 063859f..2379c33 100644
> --- a/drivers/gpu/drm/i915/dvo_ns2501.c
> +++ b/drivers/gpu/drm/i915/dvo_ns2501.c
> @@ -698,7 +698,7 @@ static void ns2501_destroy(struct intel_dvo_device *dvo)
>  	}
>  }
>  
> -struct intel_dvo_dev_ops ns2501_ops = {
> +const struct intel_dvo_dev_ops ns2501_ops = {
>  	.init = ns2501_init,
>  	.detect = ns2501_detect,
>  	.mode_valid = ns2501_mode_valid,
> diff --git a/drivers/gpu/drm/i915/dvo_sil164.c b/drivers/gpu/drm/i915/dvo_sil164.c
> index 26f13eb..1c1a067 100644
> --- a/drivers/gpu/drm/i915/dvo_sil164.c
> +++ b/drivers/gpu/drm/i915/dvo_sil164.c
> @@ -267,7 +267,7 @@ static void sil164_destroy(struct intel_dvo_device *dvo)
>  	}
>  }
>  
> -struct intel_dvo_dev_ops sil164_ops = {
> +const struct intel_dvo_dev_ops sil164_ops = {
>  	.init = sil164_init,
>  	.detect = sil164_detect,
>  	.mode_valid = sil164_mode_valid,
> diff --git a/drivers/gpu/drm/i915/dvo_tfp410.c b/drivers/gpu/drm/i915/dvo_tfp410.c
> index 6f1a0a6..31e181d 100644
> --- a/drivers/gpu/drm/i915/dvo_tfp410.c
> +++ b/drivers/gpu/drm/i915/dvo_tfp410.c
> @@ -306,7 +306,7 @@ static void tfp410_destroy(struct intel_dvo_device *dvo)
>  	}
>  }
>  
> -struct intel_dvo_dev_ops tfp410_ops = {
> +const struct intel_dvo_dev_ops tfp410_ops = {
>  	.init = tfp410_init,
>  	.detect = tfp410_detect,
>  	.mode_valid = tfp410_mode_valid,
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
