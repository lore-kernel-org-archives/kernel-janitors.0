From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Fri, 09 Aug 2013 10:29:33 +0000
Subject: Re: [Intel-gfx] [patch v2] drm/i915: fix a limit check in hsw_compute_wm_results()
Message-Id: <20130809102933.GD5004@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130809095826.GA4313@cantiga.alporthouse.com>
 <20130809100731.GA31727@elgon.mountain>
In-Reply-To: <20130809100731.GA31727@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Fri, Aug 09, 2013 at 01:07:31PM +0300, Dan Carpenter wrote:
> The '!' here was not intended.  Since '!' has higher precedence than
> compare, it means the check is never true.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

The culprit for Daniel:

commit 71fff20ff1bb790f4defe0c880e028581ffab420
Author: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
Date:   Tue Aug 6 22:24:03 2013 +0300

    drm/i915: Kill fbc_enable from hsw_lp_wm_results

> ---
> v2: My first patch was wrong.
>=20
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel=
_pm.c
> index 96234c6..0f5eb21 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -2685,7 +2685,7 @@ static void hsw_compute_wm_results(struct drm_devic=
e *dev,
>  	 * a WM level. */
>  	results->enable_fbc_wm =3D true;
>  	for (level =3D 1; level <=3D max_level; level++) {
> -		if (!lp_results[level - 1].fbc_val > lp_maximums->fbc) {
> +		if (lp_results[level - 1].fbc_val > lp_maximums->fbc) {
>  			results->enable_fbc_wm =3D false;
>  			lp_results[level - 1].fbc_val =3D 0;
>  		}
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/intel-gfx

--=20
Ville Syrj=E4l=E4
Intel OTC
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
