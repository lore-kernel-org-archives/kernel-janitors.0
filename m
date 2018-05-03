From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 03 May 2018 16:40:00 +0000
Subject: Re: [PATCH] drm/i915/dp: silence a static checker warning
Message-Id: <20180503164000.GJ2054@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180503105306.GA5315@mwanda>
In-Reply-To: <20180503105306.GA5315@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Thu, May 03, 2018 at 01:53:22PM +0300, Dan Carpenter wrote:
> Smatch warns that "n_entries" isn't always set.  It would trigger a
> some WARN_ON()s on that path so presumably it can't happen but it's
> simple enough to initialize it to zero just to silence the warning.

I usually would just ask if it would be possible to dispositioning
as false positive or intentional on the tool, but it looks better
indeed...

so, why not?!

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> diff --git a/drivers/gpu/drm/i915/intel_ddi.c b/drivers/gpu/drm/i915/intel_ddi.c
> index 8225d223f452..f4951ae33ac2 100644
> --- a/drivers/gpu/drm/i915/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/intel_ddi.c
> @@ -2062,7 +2062,7 @@ u8 intel_ddi_dp_voltage_max(struct intel_encoder *encoder)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>  	enum port port = encoder->port;
> -	int n_entries;
> +	int n_entries = 0;
>  
>  	if (IS_ICELAKE(dev_priv)) {
>  		if (port = PORT_A || port = PORT_B)
