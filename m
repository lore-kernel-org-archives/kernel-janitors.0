From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Thu, 27 Aug 2020 16:38:51 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/vlv_dsi_pll: fix spelling mistake "Cant" -> "Can't"
Message-Id: <20200827163851.GU6112@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200810095952.60968-1-colin.king@canonical.com>
In-Reply-To: <20200810095952.60968-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

On Mon, Aug 10, 2020 at 10:59:52AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in a drm_err message. Fix it.

Thanks. Applied to dinq.

>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/vlv_dsi_pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c b/drivers/gpu/drm=
/i915/display/vlv_dsi_pll.c
> index d0a514301575..4070b00c3690 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi_pll.c
> @@ -483,7 +483,7 @@ int bxt_dsi_pll_compute(struct intel_encoder *encoder,
> =20
>  	if (dsi_ratio < dsi_ratio_min || dsi_ratio > dsi_ratio_max) {
>  		drm_err(&dev_priv->drm,
> -			"Cant get a suitable ratio from DSI PLL ratios\n");
> +			"Can't get a suitable ratio from DSI PLL ratios\n");
>  		return -ECHRNG;
>  	} else
>  		drm_dbg_kms(&dev_priv->drm, "DSI PLL calculation is Done!!\n");
> --=20
> 2.27.0
>=20
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--=20
Ville Syrj=E4l=E4
Intel
