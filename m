From: Hans de Goede <hdegoede@redhat.com>
Date: Wed, 20 Mar 2019 09:13:44 +0000
Subject: Re: [PATCH -next] drm/vboxvideo: Remove unused including <linux/version.h>
Message-Id: <9607344f-7312-0ceb-7744-d3084efda16c@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190320015429.86347-1-yuehaibing@huawei.com>
In-Reply-To: <20190320015429.86347-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 20-03-19 02:54, YueHaibing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thank you for the patch, it looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I will pick this up and push it to drm-misc-next

Regards,

Hans

> ---
>   drivers/gpu/drm/vboxvideo/vbox_drv.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> index 6dea8bf5f045..ece31f395540 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> @@ -14,7 +14,6 @@
>   #include <linux/io.h>
>   #include <linux/irqreturn.h>
>   #include <linux/string.h>
> -#include <linux/version.h>
>   
>   #include <drm/drm_encoder.h>
>   #include <drm/drm_fb_helper.h>
> 
> 
> 
> 
> 
