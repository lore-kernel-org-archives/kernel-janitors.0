From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 16 Oct 2018 10:07:16 +0000
Subject: Re: [PATCH] drm: rcar-du: Fix the return value in case of error in 'rcar_du_crtc_set_crc_source()'
Message-Id: <2042905.omcotxa4GD@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181016065825.23206-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181016065825.23206-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

Thank you for the patch.

On Tuesday, 16 October 2018 09:58:25 EEST Christophe JAILLET wrote:
> We return 0 unconditionally in 'rcar_du_crtc_set_crc_source()'.
> However, 'ret' is set to some error codes if some function calls fail.
> 
> Return 'ret' instead to propagate the error code.
> 
> Fixes: 47a52d024e89 ("media: drm: rcar-du: Add support for CRC computation")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 8a9e5e6f16b4..6eb0a95ad5a6
> 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -940,7 +940,7 @@ static int rcar_du_crtc_set_crc_source(struct drm_crtc
> *crtc, drm_modeset_drop_locks(&ctx);
>  	drm_modeset_acquire_fini(&ctx);
> 
> -	return 0;
> +	return ret;
>  }
> 
>  static const struct drm_crtc_funcs crtc_funcs_gen2 = {


-- 
Regards,

Laurent Pinchart
