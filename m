From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Wed, 11 Dec 2019 16:23:41 +0000
Subject: Re: [PATCH][next] drm/i915/display: remove duplicated assignment to pointer crtc_state
Message-Id: <20191211162341.GM1208@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191210144535.341977-1-colin.king@canonical.com>
In-Reply-To: <20191210144535.341977-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

On Tue, Dec 10, 2019 at 02:45:35PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Pointer crtc_state is being assigned twice, one of these is redundant
> and can be removed.
>=20
> Addresses-Coverity: ("Evaluation order violation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 5c50b7d2db25..f3389d315b19 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -17751,7 +17751,7 @@ intel_modeset_setup_hw_state(struct drm_device *d=
ev,
> =20
>  	for_each_intel_crtc(&dev_priv->drm, crtc) {
>  		struct intel_crtc_state *crtc_state > -			crtc_state =3D to_intel_crtc=
_state(crtc->base.state);
> +			to_intel_crtc_state(crtc->base.state);

Thanks.

Pushed to drm-intel-next-queued.

> =20
>  		intel_sanitize_crtc(crtc, ctx);
>  		intel_dump_pipe_config(crtc_state, NULL, "[setup_hw_state]");
> --=20
> 2.24.0

--=20
Ville Syrj=E4l=E4
Intel
