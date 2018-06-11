From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Mon, 11 Jun 2018 16:25:52 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: remove redundant GEM_BUG_ON check
Message-Id: <20180611162552.GY23723@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180611160037.23402-1-colin.king@canonical.com>
In-Reply-To: <20180611160037.23402-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

On Mon, Jun 11, 2018 at 05:00:37PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The check for level being less than zero is redundant as level
> is an unsigned u32 and hence will never be less than zero.
> Remove this redundant check.
>=20
> Detected by CoverityScan, CID#1468363 ("Macro compares unsigned to 0")
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/intel_guc.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/intel_guc.c b/drivers/gpu/drm/i915/inte=
l_guc.c
> index 116f4ccf1bbd..a2f782a4f97d 100644
> --- a/drivers/gpu/drm/i915/intel_guc.c
> +++ b/drivers/gpu/drm/i915/intel_guc.c
> @@ -208,8 +208,6 @@ static u32 get_log_control_flags(void)
>  	u32 level =3D i915_modparams.guc_log_level;
>  	u32 flags =3D 0;
> =20
> -	GEM_BUG_ON(level < 0);

i915_modparams.guc_log_level is a signed int. So s/u32/int would seem
like a better fix.

> -
>  	if (!GUC_LOG_LEVEL_IS_ENABLED(level))
>  		flags |=3D GUC_LOG_DEFAULT_DISABLED;
> =20
> --=20
> 2.17.0
>=20
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--=20
Ville Syrj=E4l=E4
Intel
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
