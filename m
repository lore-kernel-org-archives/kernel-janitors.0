From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Fri, 23 Nov 2018 07:30:20 +0000
Subject: Re: [PATCH] drm/i915/gvt: Use after free in intel_vgpu_destroy_ggtt_mm()
Message-Id: <20181123073020.GA22276@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181123072219.m3xfwlg2o4iujfk5@kili.mountain>
In-Reply-To: <20181123072219.m3xfwlg2o4iujfk5@kili.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hang Yuan <hang.yuan@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2018.11.23 10:22:19 +0300, Dan Carpenter wrote:
> We need to use the _safe() version of this macro so that we don't
> dereference "pos" when it is freed.
>

Thanks, Dan.

I've already merged one same fix from Chris for this found by smatch.

> Fixes: bc0686ff5fad ("drm/i915/gvt: support inconsecutive partial gtt ent=
ry write")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 58e166effa45..3f416341ae5f 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2447,9 +2447,9 @@ static void intel_vgpu_destroy_all_ppgtt_mm(struct =
intel_vgpu *vgpu)
> =20
>  static void intel_vgpu_destroy_ggtt_mm(struct intel_vgpu *vgpu)
>  {
> -	struct intel_gvt_partial_pte *pos;
> +	struct intel_gvt_partial_pte *pos, *n;
> =20
> -	list_for_each_entry(pos,
> +	list_for_each_entry_safe(pos, n,
>  			&vgpu->gtt.ggtt_mm->ggtt_mm.partial_pte_list, list) {
>  		gvt_dbg_mm("partial PTE update on hold 0x%lx : 0x%llx\n",
>  			pos->offset, pos->data);
> --=20
> 2.11.0
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCW/esjAAKCRCxBBozTXgY
J+nFAJ0U79FUvGGXPZicZl0ISjtuK68ZMgCfUHYUTOyH+PW49qS45Ak9R8xDdB4=
=QmJi
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
