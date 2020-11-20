From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Date: Fri, 20 Nov 2020 01:29:45 +0000
Subject: RE: [PATCH] drm/kmb: Fix possible oops in probe error handling
Message-Id: <BY5PR11MB41823C768894561BEE8567888CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117072103.GA1111239@mwanda>
In-Reply-To: <20201117072103.GA1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, "Dea, Edmund J" <edmund.j.dea@intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, November 16, 2020 11:21 PM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: Dea, Edmund J <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; dri-
> devel@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] drm/kmb: Fix possible oops in probe error handling
> 
> If kmb_dsi_init() fails the error handling will dereference an error
> pointer which will cause an Oops.
> 
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> b/drivers/gpu/drm/kmb/kmb_drv.c
> index a31a840ce634..8c43b136765c 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -504,7 +504,7 @@ static int kmb_probe(struct platform_device *pdev)
>  	if (IS_ERR(kmb->kmb_dsi)) {
>  		drm_err(&kmb->drm, "failed to initialize DSI\n");
>  		ret = PTR_ERR(kmb->kmb_dsi);
> -		goto err_free1;
> +		goto err_clear_drvdata;
>  	}
 dsi host is registered earlier, it needs to be unregistered, original code is correct.

Anitha
> 
>  	kmb->kmb_dsi->dev = &dsi_pdev->dev;
> @@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
>  	drm_crtc_cleanup(&kmb->crtc);
>  	drm_mode_config_cleanup(&kmb->drm);
>   err_free1:
> -	dev_set_drvdata(dev, NULL);
>  	kmb_dsi_host_unregister(kmb->kmb_dsi);
> + err_clear_drvdata:
> +	dev_set_drvdata(dev, NULL);
> 
>  	return ret;
>  }
> --
> 2.28.0
