From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 19 Jul 2013 07:01:04 +0000
Subject: Re: [patch 2/2] drm/i915: use after free on error path
Message-Id: <20130719070104.GC5615@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719054627.GA9729@elgon.mountain>
In-Reply-To: <20130719054627.GA9729@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Fri, Jul 19, 2013 at 08:46:27AM +0300, Dan Carpenter wrote:
> i915_gem_vma_destroy() frees its argument so we have to move the
> drm_mm_remove_node() call up a few lines.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Both applied, thanks for the patches.
-Daniel

> 
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 9a9a77a..f347ad5 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -3161,9 +3161,9 @@ search_free:
>  	return 0;
>  
>  err_out:
> +	drm_mm_remove_node(&vma->node);
>  	i915_gem_vma_destroy(vma);
>  	i915_gem_object_unpin_pages(obj);
> -	drm_mm_remove_node(&vma->node);
>  	return ret;
>  }
>  

-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
