From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Fri, 19 Jul 2019 12:39:52 +0000
Subject: Re: [PATCH -next] drm/i915/icl: Remove set but not used variable 'src_y'
Message-Id: <20190719123952.GK5942@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190719024100.64738-1-yuehaibing@huawei.com>
In-Reply-To: <20190719024100.64738-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: YueHaibing <yuehaibing@huawei.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, matthew.d.roper@intel.com, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Fri, Jul 19, 2019 at 02:41:00AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/gpu/drm/i915/display/intel_sprite.c: In function 'g4x_sprite_chec=
k_scaling':
> drivers/gpu/drm/i915/display/intel_sprite.c:1494:13: warning:
>  variable 'src_y' set but not used [-Wunused-but-set-variable]
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks. Applied to drm-intel-next-queued.

PS. I removed the "/icl" from the subject line because this has nothing
to do with icelake hardware.

> ---
>  drivers/gpu/drm/i915/display/intel_sprite.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/dr=
m/i915/display/intel_sprite.c
> index 34586f29be60..9c3367491f04 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -1491,7 +1491,7 @@ g4x_sprite_check_scaling(struct intel_crtc_state *c=
rtc_state,
>  	const struct drm_framebuffer *fb =3D plane_state->base.fb;
>  	const struct drm_rect *src =3D &plane_state->base.src;
>  	const struct drm_rect *dst =3D &plane_state->base.dst;
> -	int src_x, src_y, src_w, src_h, crtc_w, crtc_h;
> +	int src_x, src_w, src_h, crtc_w, crtc_h;
>  	const struct drm_display_mode *adjusted_mode >  		&crtc_state->base.adj=
usted_mode;
>  	unsigned int cpp =3D fb->format->cpp[0];
> @@ -1502,7 +1502,6 @@ g4x_sprite_check_scaling(struct intel_crtc_state *c=
rtc_state,
>  	crtc_h =3D drm_rect_height(dst);
> =20
>  	src_x =3D src->x1 >> 16;
> -	src_y =3D src->y1 >> 16;
>  	src_w =3D drm_rect_width(src) >> 16;
>  	src_h =3D drm_rect_height(src) >> 16;
>=20
>=20

--=20
Ville Syrj=E4l=E4
Intel
