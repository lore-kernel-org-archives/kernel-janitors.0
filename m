From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Fri, 05 Jul 2019 12:42:04 +0000
Subject: Re: [PATCH -next] drm/i915: Remove set but not used variable 'intel_dig_port'
Message-Id: <20190705124204.GO5942@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190705113138.65880-1-yuehaibing@huawei.com>
In-Reply-To: <20190705113138.65880-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: YueHaibing <yuehaibing@huawei.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, kernel-janitors@vger.kernel.org, lucas.demarchi@intel.com, linux-kernel@vger.kernel.org, jose.souza@intel.com, rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org

On Fri, Jul 05, 2019 at 11:31:38AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/gpu/drm/i915/display/intel_ddi.c: In function 'intel_ddi_get_conf=
ig':
> drivers/gpu/drm/i915/display/intel_ddi.c:3774:29: warning:
>  variable 'intel_dig_port' set but not used [-Wunused-but-set-variable]
>   struct intel_digital_port *intel_dig_port;
>=20
> It is never used, so can be removed.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to drm-intel-next-queued. Thanks for the patch.

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index a4172595c8d8..30e48609db1d 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3771,7 +3771,6 @@ void intel_ddi_get_config(struct intel_encoder *enc=
oder,
>  	struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
>  	struct intel_crtc *intel_crtc =3D to_intel_crtc(pipe_config->base.crtc);
>  	enum transcoder cpu_transcoder =3D pipe_config->cpu_transcoder;
> -	struct intel_digital_port *intel_dig_port;
>  	u32 temp, flags =3D 0;
> =20
>  	/* XXX: DSI transcoder paranoia */
> @@ -3810,7 +3809,6 @@ void intel_ddi_get_config(struct intel_encoder *enc=
oder,
>  	switch (temp & TRANS_DDI_MODE_SELECT_MASK) {
>  	case TRANS_DDI_MODE_SELECT_HDMI:
>  		pipe_config->has_hdmi_sink =3D true;
> -		intel_dig_port =3D enc_to_dig_port(&encoder->base);
> =20
>  		pipe_config->infoframes.enable |>  			intel_hdmi_infoframes_enabled(en=
coder, pipe_config);
>=20
>=20

--=20
Ville Syrj=E4l=E4
Intel
