From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Fri, 03 Aug 2018 00:08:38 +0000
Subject: Re: [PATCH -next] drm/vkms: Fix the error handling in vkms_init()
Message-Id: <20180803000838.ku2lgy4hakcgqc6o@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533200699-124300-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533200699-124300-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.com>

On 08/02, Wei Yongjun wrote:
> In the drm_vblank_init() error handling case, platform device
> unregister is missing. This patch fix it.
> 
> Fixes: 3a0709928b17 ("drm/vkms: Add vblank events simulated by hrtimers")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 6e728b8..5ad09d4 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -110,7 +110,7 @@ static int __init vkms_init(void)
>  	ret = drm_vblank_init(&vkms_device->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
> -		goto out_fini;
> +		goto out_unregister;
>  	}
>  
>  	ret = vkms_modeset_init(vkms_device);
>

Hi,

Thanks for the patch! Everything is fine for me.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com> 
