From: Liviu Dudau <liviu.dudau@arm.com>
Date: Mon, 04 Apr 2016 09:17:05 +0000
Subject: Re: [patch] drm: ARM HDLCD - fix an error code
Message-Id: <20160404091705.GH27137@e106497-lin.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160402054224.GA19162@mwanda>
In-Reply-To: <20160402054224.GA19162@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Sat, Apr 02, 2016 at 08:42:24AM +0300, Dan Carpenter wrote:
> We accidentally return PTR_ERR(NULL) which is success instead of a
> negative error code.
> 
> Fixes: 879e40bea6f2 ('drm: ARM HDLCD - get rid of devm_clk_put()')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 734849f..3ac1ae4 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -55,8 +55,9 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
>  	hdlcd->mmio = devm_ioremap_resource(drm->dev, res);
>  	if (IS_ERR(hdlcd->mmio)) {
>  		DRM_ERROR("failed to map control registers area\n");
> +		ret = PTR_ERR(hdlcd->mmio);
>  		hdlcd->mmio = NULL;
> -		return PTR_ERR(hdlcd->mmio);
> +		return ret;

Good catch, thanks for that!

Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

I've pulled your patch and sent an updated pull request.

Best regards,
Liviu


>  	}
>  
>  	version = hdlcd_read(hdlcd, HDLCD_REG_VERSION);
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
