From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Fri, 27 Apr 2018 14:10:07 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Potential uninitialized return in live_reset_whitelist()
Message-Id: <20180427141007.GY23723@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427140616.GC19583@mwanda>
In-Reply-To: <20180427140616.GC19583@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

On Fri, Apr 27, 2018 at 05:06:16PM +0300, Dan Carpenter wrote:
> Smatch complains that "err" could be uninitialized at the end.  I don't
> know the code well but that seems like a reasonable warning.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/gpu/drm/i915/selftests/intel_workarounds.c b/drivers=
/gpu/drm/i915/selftests/intel_workarounds.c
> index 5455b2626627..17444a3abbb9 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_workarounds.c
> @@ -239,7 +239,7 @@ static int live_reset_whitelist(void *arg)
>  	struct intel_engine_cs *engine =3D i915->engine[RCS];
>  	struct i915_gpu_error *error =3D &i915->gpu_error;
>  	struct whitelist w;
> -	int err;
> +	int err =3D 0;
> =20
>  	/* If we reset the gpu, we should not lose the RING_NONPRIV */

Looks like this is already fixed.

commit a3997159133d56e444f0c0f56ab1ae59863912a8
Author: Gustavo A. R. Silva <gustavo@embeddedor.com>
Date:   Tue Apr 24 08:15:45 2018 -0500

    drm/i915/selftests: Fix uninitialized variable

--=20
Ville Syrj=E4l=E4
Intel
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
