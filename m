From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Fri, 05 May 2017 05:46:09 +0000
Subject: Re: [PATCH 5/9] drm/i915: Adjust seven checks for null pointers
Message-Id: <87bmr7yhy6.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net> <0fb8a6a5-f9ee-1e5d-d52d-5faca3ecde0d@users.sourceforge.net>
In-Reply-To: <0fb8a6a5-f9ee-1e5d-d52d-5faca3ecde0d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, 04 May 2017, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 4 May 2017 13:52:19 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>
> The script “checkpatch.pl” pointed information out like the following.
>
> Comparison to NULL could be written …

Could be written one way or the other. We have and accept
both. Sometimes explicit comparison with NULL is preferred, depending on
judgement, not based on what a tool says.

BR,
Jani.


>
> Thus fix affected source code places.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index bf9a2e8d8c16..d9c699d7245e 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -242,7 +242,7 @@ static int i915_gem_stolen_list_info(struct seq_file *m, void *data)
>  		if (count = total)
>  			break;
>  
> -		if (obj->stolen = NULL)
> +		if (!obj->stolen)
>  			continue;
>  
>  		objects[count++] = obj;
> @@ -254,7 +254,7 @@ static int i915_gem_stolen_list_info(struct seq_file *m, void *data)
>  		if (count = total)
>  			break;
>  
> -		if (obj->stolen = NULL)
> +		if (!obj->stolen)
>  			continue;
>  
>  		objects[count++] = obj;
> @@ -557,7 +557,7 @@ static int i915_gem_pageflip_info(struct seq_file *m, void *data)
>  
>  		spin_lock_irq(&dev->event_lock);
>  		work = crtc->flip_work;
> -		if (work = NULL) {
> +		if (!work) {
>  			seq_printf(m, "No flip due on pipe %c (plane %c)\n",
>  				   pipe, plane);
>  		} else {
> @@ -3717,7 +3717,7 @@ static ssize_t i915_displayport_test_active_write(struct file *file,
>  			continue;
>  
>  		if (connector->status = connector_status_connected &&
> -		    connector->encoder != NULL) {
> +		    connector->encoder) {
>  			intel_dp = enc_to_intel_dp(connector->encoder);
>  			status = kstrtoint(input_buffer, 10, &val);
>  			if (status < 0)
> @@ -3756,7 +3756,7 @@ static int i915_displayport_test_active_show(struct seq_file *m, void *data)
>  			continue;
>  
>  		if (connector->status = connector_status_connected &&
> -		    connector->encoder != NULL) {
> +		    connector->encoder) {
>  			intel_dp = enc_to_intel_dp(connector->encoder);
>  			seq_putc(m,
>  				 intel_dp->compliance.test_active ? '1' : '0');
> @@ -3801,7 +3801,7 @@ static int i915_displayport_test_data_show(struct seq_file *m, void *data)
>  			continue;
>  
>  		if (connector->status = connector_status_connected &&
> -		    connector->encoder != NULL) {
> +		    connector->encoder) {
>  			intel_dp = enc_to_intel_dp(connector->encoder);
>  			if (intel_dp->compliance.test_type =
>  			    DP_TEST_LINK_EDID_READ)
> @@ -3855,7 +3855,7 @@ static int i915_displayport_test_type_show(struct seq_file *m, void *data)
>  			continue;
>  
>  		if (connector->status = connector_status_connected &&
> -		    connector->encoder != NULL) {
> +		    connector->encoder) {
>  			intel_dp = enc_to_intel_dp(connector->encoder);
>  			seq_printf(m, "%02lx", intel_dp->compliance.test_type);
>  		} else {

-- 
Jani Nikula, Intel Open Source Technology Center
