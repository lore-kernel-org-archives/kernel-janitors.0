From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 08 Jan 2016 14:32:48 +0000
Subject: Re: [patch] drm: move MODULE_PARM_DESC to other file
Message-Id: <20160108143248.GZ8076@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160108110045.GF32195@mwanda>
In-Reply-To: <20160108110045.GF32195@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 08, 2016 at 02:00:45PM +0300, Dan Carpenter wrote:
> We moved the module options from drm_drv.c to drm_irq.c in 18882995713d
> ('drm: Move vblank related module options into drm_irq.c').  Let's move
> the MODULE_PARM_DESC()s as well so they're together.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yeah makes sense. Applied to drm-misc, thanks.
-Daniel

> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index bf934cde..167c8d3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -44,10 +44,6 @@ MODULE_AUTHOR(CORE_AUTHOR);
>  MODULE_DESCRIPTION(CORE_DESC);
>  MODULE_LICENSE("GPL and additional rights");
>  MODULE_PARM_DESC(debug, "Enable debug output");
> -MODULE_PARM_DESC(vblankoffdelay, "Delay until vblank irq auto-disable [msecs] (0: never disable, <0: disable immediately)");
> -MODULE_PARM_DESC(timestamp_precision_usec, "Max. error on timestamps [usecs]");
> -MODULE_PARM_DESC(timestamp_monotonic, "Use monotonic timestamps");
> -
>  module_param_named(debug, drm_debug, int, 0600);
>  
>  static DEFINE_SPINLOCK(drm_minor_lock);
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 607f493..d12a4ef 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -73,6 +73,9 @@ static int drm_vblank_offdelay = 5000;    /* Default to 5000 msecs. */
>  module_param_named(vblankoffdelay, drm_vblank_offdelay, int, 0600);
>  module_param_named(timestamp_precision_usec, drm_timestamp_precision, int, 0600);
>  module_param_named(timestamp_monotonic, drm_timestamp_monotonic, int, 0600);
> +MODULE_PARM_DESC(vblankoffdelay, "Delay until vblank irq auto-disable [msecs] (0: never disable, <0: disable immediately)");
> +MODULE_PARM_DESC(timestamp_precision_usec, "Max. error on timestamps [usecs]");
> +MODULE_PARM_DESC(timestamp_monotonic, "Use monotonic timestamps");
>  
>  static void store_vblank(struct drm_device *dev, unsigned int pipe,
>  			 u32 vblank_count_inc,

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
