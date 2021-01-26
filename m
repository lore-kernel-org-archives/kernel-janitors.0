From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Tue, 26 Jan 2021 05:09:01 +0000
Subject: Re: [PATCH] drm/i915/gvt: fix uninitialized return in intel_gvt_update_reg_whitelist()
Message-Id: <20210126050901.GF1538@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="/WwmFnJnmDyWGHa4"
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6F3oF8mRaNQWjb@mwanda>
 <161156789392.31416.7341729779003502151@build.alporthouse.com>
In-Reply-To: <161156789392.31416.7341729779003502151@build.alporthouse.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Yan Zhao <yan.y.zhao@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.01.25 09:44:53 +0000, Chris Wilson wrote:
> Quoting Dan Carpenter (2021-01-25 08:48:30)
> > Smatch found an uninitialized variable bug in this code:
> >=20
> >     drivers/gpu/drm/i915/gvt/cmd_parser.c:3191 intel_gvt_update_reg_whi=
telist()
> >     error: uninitialized symbol 'ret'.
> >=20
> > The first thing that Smatch complains about is that "ret" isn't set if
> > we don't enter the "for_each_engine(engine, &dev_priv->gt, id) {" loop.
> > Presumably we always have at least one engine so that's a false
> > positive.
> >=20
> > But it's definitely a bug to not set "ret" if i915_gem_object_pin_map()
> > fails.
>=20
> True.
> =20
> > Let's fix the bug and silence the false positive.
> >=20
> > Fixes: 493f30cd086e ("drm/i915/gvt: parse init context to update cmd ac=
cessible reg whitelist")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks, Dan & Chris! Queued this up.

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYA+j6AAKCRCxBBozTXgY
J5cJAJ9sFEZY0fDpLiQtUxokU7lBHau3GQCePa3i/LHx5XYBX6y/5g6zbXsx+DQ=
=ooGI
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
