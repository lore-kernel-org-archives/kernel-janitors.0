From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Thu, 23 Feb 2017 11:09:14 +0000
Subject: Re: [Intel-gfx] [patch] drm/i915: return false on failure in intel_dp_compute_config()
Message-Id: <1487848154.3052.40.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170223103956.GA27484@mwanda>
In-Reply-To: <20170223103956.GA27484@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@intel.com>, Chandra Konduru <chandra.konduru@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On to, 2017-02-23 at 13:39 +0300, Dan Carpenter wrote:
> This function is a bool type where we are supposed to return false on
> failure and true on success.  Negative error codes are currently treated
> as true.
> 
> Fixes: a1b2278e4dfc ("drm/i915: skylake panel fitting using shared scalers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

<SNIP>

> 
> @@ -1637,10 +1637,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>  				       adjusted_mode);
>  
>  		if (INTEL_GEN(dev_priv) >= 9) {
> -			int ret;
> -			ret = skl_update_scaler_crtc(pipe_config);
> -			if (ret)
> -				return ret;
> +			if (skl_update_scaler_crtc(pipe_config))
> +				return false;
>  		}

You can drop the braces, too.

Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Regards, Joonas
-- 
Joonas Lahtinen
Open Source Technology Center
Intel Corporation
