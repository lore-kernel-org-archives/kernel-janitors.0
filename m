From: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 04 Dec 2018 13:00:35 +0000
Subject: Re: [PATCH -next] drm/fb-helper: Fix typo in parameter description
Message-Id: <1a361bb9-6ccd-7042-56b9-562f2437d496@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543905135-35293-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1543905135-35293-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Wei,

On 04/12/2018 07:32, Wei Yongjun wrote:
> Fix typo in parameter description.
>=20
> Fixes: 4be9bd10e22d ("drm/fb_helper: Allow leaking fbdev smem_start")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index 9a69ad7..f90d596 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -71,7 +71,7 @@
>  #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
>  static bool drm_leak_fbdev_smem =3D false;
>  module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
> -MODULE_PARM_DESC(fbdev_emulation,
> +MODULE_PARM_DESC(drm_leak_fbdev_smem,
>  		 "Allow unsafe leaking fbdev physical smem address [default=FAlse]");
>  #endif
>=20
>=20
>=20

Food catch !

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applying to drm-misc-fixes

Neil
