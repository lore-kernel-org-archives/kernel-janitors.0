From: Dan Carpenter <error27@gmail.com>
Date: Mon, 23 Aug 2010 11:28:28 +0000
Subject: Re: [patch] i915: remove unneed NULL checks
Message-Id: <20100823112828.GK6674@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100623170426.GB15424@bicker>
In-Reply-To: <20100623170426.GB15424@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Eric Anholt <eric@anholt.net>, Jesse Barnes <jbarnes@virtuousgeek.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhao Yakui <yakui.zhao@intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 23, 2010 at 07:06:22PM +0200, Dan Carpenter wrote:
> We don't need to check the list cursor in a list_for_each_entry().  It's
> always non-null.
> 

Here is another one that never got applied.  I has a sad face.  :(

regards,
dan carpenter

> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
> index cc8131f..8a2bdfc 100644
> --- a/drivers/gpu/drm/i915/intel_display.c
> +++ b/drivers/gpu/drm/i915/intel_display.c
> @@ -745,7 +745,7 @@ bool intel_pipe_has_type (struct drm_crtc *crtc, int type)
>      struct drm_encoder *l_entry;
>  
>      list_for_each_entry(l_entry, &mode_config->encoder_list, head) {
> -	    if (l_entry && l_entry->crtc = crtc) {
> +	    if (l_entry->crtc = crtc) {
>  		    struct intel_encoder *intel_encoder = enc_to_intel_encoder(l_entry);
>  		    if (intel_encoder->type = type)
>  			    return true;
> @@ -3322,7 +3322,7 @@ static int intel_crtc_mode_set(struct drm_crtc *crtc,
>  
>  	list_for_each_entry(encoder, &mode_config->encoder_list, head) {
>  
> -		if (!encoder || encoder->crtc != crtc)
> +		if (encoder->crtc != crtc)
>  			continue;
>  
>  		intel_encoder = enc_to_intel_encoder(encoder);
