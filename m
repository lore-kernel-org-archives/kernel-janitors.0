From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Fri, 05 May 2017 05:54:07 +0000
Subject: Re: [PATCH 4/9] drm/i915: Delete unnecessary braces in three functions
Message-Id: <8737cjyhkw.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
 <c730d90c-0d71-50ed-d15d-a4d5c22712d0@users.sourceforge.net>
In-Reply-To: <c730d90c-0d71-50ed-d15d-a4d5c22712d0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 04 May 2017, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 4 May 2017 13:40:53 +0200
>
> Do not use curly brackets at some source code places
> where a single statement should be sufficient.

We only tend to do this kind of changes when we're changing the
surrounding code anyway. I'm sure there are plenty of places where you
could add or remove braces, but it's not productive to go around
changing just them.

BR,
Jani.


>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 296108464f2b..bf9a2e8d8c16 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -565,13 +565,13 @@ static int i915_gem_pageflip_info(struct seq_file *m, void *data)
>  			u32 addr;
>  
>  			pending = atomic_read(&work->pending);
> -			if (pending) {
> +			if (pending)
>  				seq_printf(m, "Flip ioctl preparing on pipe %c (plane %c)\n",
>  					   pipe, plane);
> -			} else {
> +			else
>  				seq_printf(m, "Flip pending (waiting for vsync) on pipe %c (plane %c)\n",
>  					   pipe, plane);
> -			}
> +
>  			if (work->flip_queued_req) {
>  				struct intel_engine_cs *engine = work->flip_queued_req->engine;
>  
> @@ -3130,13 +3130,11 @@ static void intel_plane_info(struct seq_file *m, struct intel_crtc *intel_crtc)
>  		}
>  
>  		state = plane->state;
> -
> -		if (state->fb) {
> +		if (state->fb)
>  			drm_get_format_name(state->fb->format->format,
>  					    &format_name);
> -		} else {
> +		else
>  			sprintf(format_name.str, "N/A");
> -		}
>  
>  		seq_printf(m, "\t--Plane id %d: type=%s, crtc_pos=%4dx%4d, crtc_size=%4dx%4d, src_pos=%d.%04ux%d.%04u, src_size=%d.%04ux%d.%04u, format=%s, rotation=%s\n",
>  			   plane->base.id,
> @@ -4636,13 +4634,12 @@ static int i915_sseu_status(struct seq_file *m, void *unused)
>  
>  	intel_runtime_pm_get(dev_priv);
>  
> -	if (IS_CHERRYVIEW(dev_priv)) {
> +	if (IS_CHERRYVIEW(dev_priv))
>  		cherryview_sseu_device_status(dev_priv, &sseu);
> -	} else if (IS_BROADWELL(dev_priv)) {
> +	else if (IS_BROADWELL(dev_priv))
>  		broadwell_sseu_device_status(dev_priv, &sseu);
> -	} else if (INTEL_GEN(dev_priv) >= 9) {
> +	else if (INTEL_GEN(dev_priv) >= 9)
>  		gen9_sseu_device_status(dev_priv, &sseu);
> -	}
>  
>  	intel_runtime_pm_put(dev_priv);

-- 
Jani Nikula, Intel Open Source Technology Center
