From: Mark yao <mark.yao@rock-chips.com>
Date: Fri, 11 Nov 2016 01:45:00 +0000
Subject: Re: [PATCH] drm/rockchip: return ERR_PTR instead of NULL
Message-Id: <5825229C.8080704@rock-chips.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1478812256-26189-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1478812256-26189-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-arm-kernel@lists.infradead.org

On 2016年11月11日 05:10, Julia Lawall wrote:
> rockchip_drm_framebuffer_init is only used in one case, in
> rockchip_drm_fbdev.c, where its return value is tested using IS_ERR.  To
> enable propagating the reason for the error, change the definition so that
> it returns an ERR_PTR value.
>
> Problem found with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Thanks for the fix.

Applied to my drm-next.

>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_fb.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index 0f6eda0..01e11bf 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -213,7 +213,7 @@ struct drm_framebuffer *
>   
>   	rockchip_fb = rockchip_fb_alloc(dev, mode_cmd, &obj, 1);
>   	if (IS_ERR(rockchip_fb))
> -		return NULL;
> +		return ERR_CAST(rockchip_fb);
>   
>   	return &rockchip_fb->fb;
>   }
>
>
>
>


-- 
Ｍark Yao


