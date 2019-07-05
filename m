From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Fri, 05 Jul 2019 12:41:51 +0000
Subject: Re: [PATCH -next] drm/i915: Remove set but not used variable 'encoder'
Message-Id: <20190705124151.GN5942@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705113112.64715-1-yuehaibing@huawei.com>
In-Reply-To: <20190705113112.64715-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: YueHaibing <yuehaibing@huawei.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, manasi.d.navare@intel.com, dhinakaran.pandiyan@intel.com, rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org

On Fri, Jul 05, 2019 at 11:31:12AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/gpu/drm/i915/display/intel_dp.c: In function 'intel_dp_set_drrs_s=
tate':
> drivers/gpu/drm/i915/display/intel_dp.c:6623:24: warning:
>  variable 'encoder' set but not used [-Wunused-but-set-variable]
>=20
> It's never used, so can be removed.Also remove related
> variable 'dig_port'
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to drm-intel-next-queued. Thanks for the patch.

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 8f7188d71d08..0bdb7ecc5a81 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6620,8 +6620,6 @@ static void intel_dp_set_drrs_state(struct drm_i915=
_private *dev_priv,
>  				    const struct intel_crtc_state *crtc_state,
>  				    int refresh_rate)
>  {
> -	struct intel_encoder *encoder;
> -	struct intel_digital_port *dig_port =3D NULL;
>  	struct intel_dp *intel_dp =3D dev_priv->drrs.dp;
>  	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc_state->base.crtc);
>  	enum drrs_refresh_rate_type index =3D DRRS_HIGH_RR;
> @@ -6636,9 +6634,6 @@ static void intel_dp_set_drrs_state(struct drm_i915=
_private *dev_priv,
>  		return;
>  	}
> =20
> -	dig_port =3D dp_to_dig_port(intel_dp);
> -	encoder =3D &dig_port->base;
> -
>  	if (!intel_crtc) {
>  		DRM_DEBUG_KMS("DRRS: intel_crtc not initialized\n");
>  		return;
>=20
>=20

--=20
Ville Syrj=E4l=E4
Intel
