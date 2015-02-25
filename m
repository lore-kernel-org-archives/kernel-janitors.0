From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Wed, 25 Feb 2015 13:29:05 +0000
Subject: Re: [patch] drm/i915: cleanup some indenting
Message-Id: <87oaoinmqm.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225131748.GE19745@mwanda>
In-Reply-To: <20150225131748.GE19745@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, 25 Feb 2015, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Static checkers complain that we should probably add curly braces
> because, from the indenting, it looks like seq_printf() should be inside
> the list_for_each_entry() loop.  But the code is actually correct, it's
> just the indenting which is off.
>
> Besides fixing the indenting on seq_printf(), I did add curly braces,
> because generally mult-line indents should have curly braces to make
> them more readable.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The unintended indent was left behind and not unindented in

commit d7f46fc4e7323887494db13f063a8e59861fefb0
Author: Ben Widawsky <benjamin.widawsky@intel.com>
Date:   Fri Dec 6 14:10:55 2013 -0800

    drm/i915: Make pin count per VMA

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 26e9c7b..a76b2ed 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -139,10 +139,11 @@ describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
>  		   obj->madv = I915_MADV_DONTNEED ? " purgeable" : "");
>  	if (obj->base.name)
>  		seq_printf(m, " (name: %d)", obj->base.name);
> -	list_for_each_entry(vma, &obj->vma_list, vma_link)
> +	list_for_each_entry(vma, &obj->vma_list, vma_link) {
>  		if (vma->pin_count > 0)
>  			pin_count++;
> -		seq_printf(m, " (pinned x %d)", pin_count);
> +	}
> +	seq_printf(m, " (pinned x %d)", pin_count);
>  	if (obj->pin_display)
>  		seq_printf(m, " (display)");
>  	if (obj->fence_reg != I915_FENCE_REG_NONE)

-- 
Jani Nikula, Intel Open Source Technology Center
