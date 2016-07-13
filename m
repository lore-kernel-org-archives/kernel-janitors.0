From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 13 Jul 2016 15:38:03 +0000
Subject: Re: [patch] drm/rockchip: fix a couple off by one bugs
Message-Id: <CAOw6vbK+hWcSaV14=Ri3Vsci7Hqi+krpf5d_8SJ-e3FG-9FB0g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713101504.GJ29468@mwanda>
In-Reply-To: <20160713101504.GJ29468@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>

On Wed, Jul 13, 2016 at 3:15 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The priv->crtc_funcs[] array has ROCKCHIP_MAX_CRTC elements so > should
> be >= here.
>
> Fixes: 2048e3286f34 ('drm: rockchip: Add basic drm driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 7fd20c0..37ca427 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -79,7 +79,7 @@ int rockchip_register_crtc_funcs(struct drm_crtc *crtc,
>         int pipe = drm_crtc_index(crtc);
>         struct rockchip_drm_private *priv = crtc->dev->dev_private;
>
> -       if (pipe > ROCKCHIP_MAX_CRTC)
> +       if (pipe >= ROCKCHIP_MAX_CRTC)
>                 return -EINVAL;
>
>         priv->crtc_funcs[pipe] = crtc_funcs;
> @@ -92,7 +92,7 @@ void rockchip_unregister_crtc_funcs(struct drm_crtc *crtc)
>         int pipe = drm_crtc_index(crtc);
>         struct rockchip_drm_private *priv = crtc->dev->dev_private;
>
> -       if (pipe > ROCKCHIP_MAX_CRTC)
> +       if (pipe >= ROCKCHIP_MAX_CRTC)
>                 return;
>
>         priv->crtc_funcs[pipe] = NULL;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
