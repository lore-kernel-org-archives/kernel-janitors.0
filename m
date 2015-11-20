From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 20 Nov 2015 12:53:09 +0000
Subject: Re: [PATCH] GPU-DRM-IMX: Delete an unnecessary check before drm_fbdev_cma_restore_mode()
Message-Id: <1448023989.4893.7.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <5599988B.2010301@users.sourceforge.net>
In-Reply-To: <5599988B.2010301@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

Am Sonntag, den 05.07.2015, 22:50 +0200 schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Jul 2015 22:45:23 +0200
> 
> The drm_fbdev_cma_restore_mode() function tests whether its argument
> is NULL and then returns immediately.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/imx/imx-drm-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index 74f505b..9172c0e 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -63,8 +63,7 @@ static void imx_drm_driver_lastclose(struct drm_device *drm)
>  #if IS_ENABLED(CONFIG_DRM_IMX_FB_HELPER)
>  	struct imx_drm_device *imxdrm = drm->dev_private;
>  
> -	if (imxdrm->fbhelper)
> -		drm_fbdev_cma_restore_mode(imxdrm->fbhelper);
> +	drm_fbdev_cma_restore_mode(imxdrm->fbhelper);
>  #endif
>  }
>  

Applied, sorry I missed this before.

regards
Philipp

