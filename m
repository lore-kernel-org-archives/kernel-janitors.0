From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Fri, 09 Aug 2013 10:04:34 +0000
Subject: Re: [patch] drm/i915: precedence bug in hsw_compute_wm_results()
Message-Id: <20130809100434.GC5004@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130809094302.GA29282@elgon.mountain>
In-Reply-To: <20130809094302.GA29282@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Fri, Aug 09, 2013 at 12:43:02PM +0300, Dan Carpenter wrote:
> The '!' operation has higher precedence than the compare so probably
> this test is never true.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel=
_pm.c
> index a5a9959..0b9d9a7 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -2562,7 +2562,7 @@ static void hsw_compute_wm_results(struct drm_devic=
e *dev,
>  	 * a WM level. */
>  	results->enable_fbc_wm =3D true;
>  	for (level =3D 1; level <=3D max_level; level++) {
> -		if (!lp_results[level - 1].fbc_val > lp_maximums->fbc) {
> +		if (lp_results[level - 1].fbc_val <=3D lp_maximums->fbc) {

Whoops. My bad.

It should still be > but ! should just be dropped.

>  			results->enable_fbc_wm =3D false;
>  			lp_results[level - 1].fbc_val =3D 0;
>  		}
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Ville Syrj=E4l=E4
Intel OTC
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
