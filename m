From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 04 May 2017 20:12:32 +0000
Subject: Re: [PATCH 7/9] drm/i915: Combine substrings for a message in gen6_drpc_info()
Message-Id: <20170504201232.GM24019@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
 <da7e1514-a1d0-289d-e697-10df1bc7ed0b@users.sourceforge.net>
In-Reply-To: <da7e1514-a1d0-289d-e697-10df1bc7ed0b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, May 04, 2017 at 06:59:23PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 4 May 2017 14:15:00 +0200
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> WARNING: quoted string split across lines
> 
> Thus fix the affected source code place.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 6f3119d40c50..dbd52ea89fb4 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -1529,8 +1529,8 @@ static int gen6_drpc_info(struct seq_file *m)
>  
>  	forcewake_count = READ_ONCE(dev_priv->uncore.fw_domain[FW_DOMAIN_ID_RENDER].wake_count);
>  	if (forcewake_count) {
> -		seq_puts(m, "RC information inaccurate because somebody "
> -			    "holds a forcewake reference \n");
> +		seq_puts(m,
> +			 "RC information inaccurate because somebody holds a forcewake reference.\n");

And now you break the 80col rule. Blind adherence to checkpatch is
impossible.
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
