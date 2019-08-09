From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Fri, 09 Aug 2019 00:58:40 +0000
Subject: Re: [PATCH] drm/i915: Use after free in error path in intel_vgpu_create_workload()
Message-Id: <20190809005840.GA7032@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="FCuugMFkClbJLl1L"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190808103236.GB30506@mwanda>
 <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
In-Reply-To: <156526106102.20411.17520131390381233492@skylake-alporthouse-com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.08.08 11:44:21 +0100, Chris Wilson wrote:
> Quoting Dan Carpenter (2019-08-08 11:32:36)
> > We can't free "workload" until after the printk or it's a use after
> > free.
> >=20
> > Fixes: 2089a76ade90 ("drm/i915/gvt: Checking workload's gma earlier")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> That's the simpler patch,
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks a lot, will queue this up.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXUzFQAAKCRCxBBozTXgY
J5EAAJkBRaKvljSknayoIbjCoWwSQK+1XgCeKPC2dx9VcLD8Sd9OLXGHqHyWtS8=
=O1aB
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
