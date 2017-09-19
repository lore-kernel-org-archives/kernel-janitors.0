From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Tue, 19 Sep 2017 21:46:14 +0000
Subject: Re: [PATCH][drm-next] drm/i915/gvt: ensure -ve return value is handled correctly
Message-Id: <20170919214614.cfiolgznopouv34e@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="puqbaxtjmqjz34dm"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170919155534.25334-1-colin.king@canonical.com>
In-Reply-To: <20170919155534.25334-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: fred gao <fred.gao@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org


--puqbaxtjmqjz34dm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017.09.19 16:55:34 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> An earlier fix changed the return type from find_bb_size however the
> integer return is being assigned to a unsigned int so the -ve error
> check will never be detected. Make bb_size an int to fix this.
>=20
> Detected by CoverityScan CID#1456886 ("Unsigned compared against 0")
>=20
> Fixes: 1e3197d6ad73 ("drm/i915/gvt: Refine error handling for perform_bb_=
shadow")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 2c0ccbb817dc..f41cbf664b69 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -1628,7 +1628,7 @@ static int perform_bb_shadow(struct parser_exec_sta=
te *s)
>  	struct intel_shadow_bb_entry *entry_obj;
>  	struct intel_vgpu *vgpu =3D s->vgpu;
>  	unsigned long gma =3D 0;
> -	uint32_t bb_size;
> +	int bb_size;
>  	void *dst =3D NULL;
>  	int ret =3D 0;
> =20

Applied this, thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--puqbaxtjmqjz34dm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCWcGQJgAKCRCxBBozTXgY
J+pdAJ4uIGk16BVbm+zb//3TeG+J6qGQQgCfWvWS8vf4aRtTFmz3WBUKfg7kNSw=
=ZFNa
-----END PGP SIGNATURE-----

--puqbaxtjmqjz34dm--
