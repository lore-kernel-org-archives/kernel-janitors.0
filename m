From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Tue, 13 Mar 2018 02:34:42 +0000
Subject: Re: [PATCH][drm-next] drm/i915/gvt: fix spelling mistake: "destoried" -> "destroyed"
Message-Id: <20180313023442.g7i2cyudsvqf7l6k@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zkgfnu4cdiknmifa"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180312114358.24456-1-colin.king@canonical.com>
In-Reply-To: <20180312114358.24456-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org


--zkgfnu4cdiknmifa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2018.03.12 12:43:58 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Trivial fix to spelling mistake in gvt_err error message text.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks Colin, will pick up.

>  drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 0a100a288e6d..8eb76becd676 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2046,7 +2046,7 @@ static void intel_vgpu_destroy_all_ppgtt_mm(struct =
intel_vgpu *vgpu)
>  	}
> =20
>  	if (GEM_WARN_ON(!list_empty(&vgpu->gtt.ppgtt_mm_list_head)))
> -		gvt_err("vgpu ppgtt mm is not fully destoried\n");
> +		gvt_err("vgpu ppgtt mm is not fully destroyed\n");
> =20
>  	if (GEM_WARN_ON(!radix_tree_empty(&vgpu->gtt.spt_tree))) {
>  		gvt_err("Why we still has spt not freed?\n");
> --=20
> 2.15.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--zkgfnu4cdiknmifa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCWqc4wgAKCRCxBBozTXgY
J8MCAJ4rhkHtaLw/o3jDxpLeMnewA7qXowCfbrXOUcjnuVC5LfsV4uu6/UEVqac=
=Wm9f
-----END PGP SIGNATURE-----

--zkgfnu4cdiknmifa--
