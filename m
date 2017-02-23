From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Feb 2017 11:20:19 +0000
Subject: Re: [Intel-gfx] [patch] drm/i915: return false on failure in intel_dp_compute_config()
Message-Id: <20170223112019.GC4196@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170223103956.GA27484@mwanda>
 <1487848154.3052.40.camel@linux.intel.com>
In-Reply-To: <1487848154.3052.40.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>

On Thu, Feb 23, 2017 at 01:09:14PM +0200, Joonas Lahtinen wrote:
> On to, 2017-02-23 at 13:39 +0300, Dan Carpenter wrote:
> > This function is a bool type where we are supposed to return false on
> > failure and true on success.=A0=A0Negative error codes are currently tr=
eated
> > as true.
> >=20
> > Fixes: a1b2278e4dfc ("drm/i915: skylake panel fitting using shared scal=
ers")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> <SNIP>
>=20
> >=20
> > @@ -1637,10 +1637,8 @@ intel_dp_compute_config(struct intel_encoder *en=
coder,
> > =A0				=A0=A0=A0=A0=A0=A0=A0adjusted_mode);
> > =A0
> > =A0		if (INTEL_GEN(dev_priv) >=3D 9) {
> > -			int ret;
> > -			ret =3D skl_update_scaler_crtc(pipe_config);
> > -			if (ret)
> > -				return ret;
> > +			if (skl_update_scaler_crtc(pipe_config))
> > +				return false;
> > =A0		}
>=20
> You can drop the braces, too.
>=20

Multi-line indents get braces for readability.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
