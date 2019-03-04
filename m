From: Sean Paul <sean@poorly.run>
Date: Mon, 04 Mar 2019 16:19:25 +0000
Subject: Re: [PATCH] drm: fix spelling mistake "intead" -> "instead"
Message-Id: <20190304161925.GS114153@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190217225554.17742-1-colin.king@canonical.com>
In-Reply-To: <20190217225554.17742-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Feb 17, 2019 at 10:55:54PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a DRM_NOTE message. Fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to drm-misc-next, thanks.

Sean

> ---
>  drivers/gpu/drm/drm_kms_helper_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
> index 93e2b30fe1a5..9c5ae825c507 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -39,7 +39,7 @@ MODULE_LICENSE("GPL and additional rights");
>  /* Backward compatibility for drm_kms_helper.edid_firmware */
>  static int edid_firmware_set(const char *val, const struct kernel_param *kp)
>  {
> -	DRM_NOTE("drm_kms_firmware.edid_firmware is deprecated, please use drm.edid_firmware intead.\n");
> +	DRM_NOTE("drm_kms_firmware.edid_firmware is deprecated, please use drm.edid_firmware instead.\n");
>  
>  	return __drm_set_edid_firmware_path(val);
>  }
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
