From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Date: Fri, 20 Nov 2020 01:19:06 +0000
Subject: RE: [PATCH] drm/kmb: Remove an unnecessary NULL check
Message-Id: <BY5PR11MB4182EBE4FD5F42AC625945998CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117072137.GB1111239@mwanda>
In-Reply-To: <20201117072137.GB1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

Looks good to me.

Anitha

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, November 16, 2020 11:22 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] drm/kmb: Remove an unnecessary NULL check
> 
> The NULL checking isn't done consistently in this function and it leads
> to a static checker warning:
> 
>     drivers/gpu/drm/kmb/kmb_drv.c:561 kmb_pm_suspend()
>     error: we previously assumed 'drm' could be null (see line 559)
> 
> Fortunately "drm" cannot be NULL at this point so the check can just be
> removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index 8c43b136765c..5ff392644603 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -557,7 +557,7 @@ MODULE_DEVICE_TABLE(of, kmb_of_match);
>  static int __maybe_unused kmb_pm_suspend(struct device *dev)
>  {
>  	struct drm_device *drm = dev_get_drvdata(dev);
> -	struct kmb_drm_private *kmb = drm ? to_kmb(drm) : NULL;
> +	struct kmb_drm_private *kmb = to_kmb(drm);
> 
>  	drm_kms_helper_poll_disable(drm);
> 
> --
> 2.28.0
