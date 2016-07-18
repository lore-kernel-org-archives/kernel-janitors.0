From: Liviu Dudau <liviu.dudau@arm.com>
Date: Mon, 18 Jul 2016 09:21:34 +0000
Subject: Re: [PATCH] drm/hdlcd: Delete an unnecessary check before drm_fbdev_cma_hotplug_event()
Message-Id: <20160718092134.GR8609@e106497-lin.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <c2b0f310-fa06-f4cc-0014-ea7f40564d26@users.sourceforge.net>
In-Reply-To: <c2b0f310-fa06-f4cc-0014-ea7f40564d26@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, malidp@foss.arm.com

On Sat, Jul 16, 2016 at 09:20:02AM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 16 Jul 2016 09:10:40 +0200
> 
> The drm_fbdev_cma_hotplug_event() function tests whether its argument
> is NULL and then returns immediately.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 28b8cd1..9b1aefe 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -102,8 +102,7 @@ static void hdlcd_fb_output_poll_changed(struct drm_device *drm)
>  {
>  	struct hdlcd_drm_private *hdlcd = drm->dev_private;
>  
> -	if (hdlcd->fbdev)
> -		drm_fbdev_cma_hotplug_event(hdlcd->fbdev);
> +	drm_fbdev_cma_hotplug_event(hdlcd->fbdev);
>  }
>  
>  static const struct drm_mode_config_funcs hdlcd_mode_config_funcs = {
> -- 
> 2.9.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
==========
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
