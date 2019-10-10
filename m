From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Oct 2019 13:45:45 +0000
Subject: Re: [PATCH -next] drm/vkms: Remove duplicated include from vkms_drv.c
Message-Id: <20191010134545.GZ16989@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191010115213.115706-1-yuehaibing@huawei.com>
In-Reply-To: <20191010115213.115706-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Thu, Oct 10, 2019 at 11:52:13AM +0000, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
-Daniel

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 54703463d966..d1fe144aa289 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -19,7 +19,6 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_file.h>
> -#include <drm/drm_gem.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_probe_helper.h>
> 
> 
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
