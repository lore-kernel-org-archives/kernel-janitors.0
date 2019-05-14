From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Tue, 14 May 2019 06:56:26 +0000
Subject: Re: [PATCH] drm/i915/gvt: Fix an error code in ppgtt_populate_spt_by_guest_entry()
Message-Id: <20190514065626.GK12913@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="/Q1T9Q8JmUrFqdou"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190513092244.GA12077@mwanda>
In-Reply-To: <20190513092244.GA12077@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org


--/Q1T9Q8JmUrFqdou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.13 12:22:44 +0300, Dan Carpenter wrote:
> "ret" is uninitialized on this path but it should be -EINVAL.
>=20
> Fixes: 930c8dfea4b8 ("drm/i915/gvt: Check if get_next_pt_type() always re=
turns a valid value")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 08c74e65836b..244ad1729764 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1076,8 +1076,10 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_populate=
_spt_by_guest_entry(
>  	} else {
>  		int type =3D get_next_pt_type(we->type);
> =20
> -		if (!gtt_type_is_pt(type))
> +		if (!gtt_type_is_pt(type)) {
> +			ret =3D -EINVAL;
>  			goto err;
> +		}
> =20
>  		spt =3D ppgtt_alloc_spt_gfn(vgpu, type, ops->get_pfn(we), ips);
>  		if (IS_ERR(spt)) {
> --=20

Applied this, thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--/Q1T9Q8JmUrFqdou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXNpmmgAKCRCxBBozTXgY
J8PrAJ9hmMJUVJA/WcxFVYDp5dmrCIWThACfXEUodqTtaZAUTakJt7C3vBzTioI=
=FjA+
-----END PGP SIGNATURE-----

--/Q1T9Q8JmUrFqdou--
