From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Fri, 19 Jul 2019 17:23:35 +0000
Subject: Re: [PATCH -next] drm/i915/dsi: remove set but not used variable 'hfront_porch'
Message-Id: <20190719172335.GT5942@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190719015136.103988-1-yuehaibing@huawei.com>
In-Reply-To: <20190719015136.103988-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: YueHaibing <yuehaibing@huawei.com>
Cc: airlied@linux.ie, Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org

On Fri, Jul 19, 2019 at 01:51:36AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/gpu/drm/i915/display/icl_dsi.c: In function 'gen11_dsi_set_transc=
oder_timings':
> drivers/gpu/drm/i915/display/icl_dsi.c:768:6: warning:
>  variable 'hfront_porch' set but not used [-Wunused-but-set-variable]
>=20
> It is never used and can be removed.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks. Applied to drm-intel-next-queued.

> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i91=
5/display/icl_dsi.c
> index 4d952accfaaa..a42348be0438 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -763,7 +763,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder=
 *encoder,
>  	enum transcoder dsi_trans;
>  	/* horizontal timings */
>  	u16 htotal, hactive, hsync_start, hsync_end, hsync_size;
> -	u16 hfront_porch, hback_porch;
> +	u16 hback_porch;
>  	/* vertical timings */
>  	u16 vtotal, vactive, vsync_start, vsync_end, vsync_shift;
> =20
> @@ -772,8 +772,6 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder=
 *encoder,
>  	hsync_start =3D adjusted_mode->crtc_hsync_start;
>  	hsync_end =3D adjusted_mode->crtc_hsync_end;
>  	hsync_size  =3D hsync_end - hsync_start;
> -	hfront_porch =3D (adjusted_mode->crtc_hsync_start -
> -			adjusted_mode->crtc_hdisplay);
>  	hback_porch =3D (adjusted_mode->crtc_htotal -
>  		       adjusted_mode->crtc_hsync_end);
>  	vactive =3D adjusted_mode->crtc_vdisplay;
>=20
>=20

--=20
Ville Syrj=E4l=E4
Intel
