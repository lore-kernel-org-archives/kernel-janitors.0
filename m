From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Fri, 21 Oct 2016 08:27:38 +0000
Subject: Re: [patch] drm/i915/gvt: cleanup a type issue in submit_context()
Message-Id: <20161021082738.2va437v2qzsf7inq@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ks2flzm62jm6x46u"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161021080601.GA28738@elgon.mountain>
In-Reply-To: <20161021080601.GA28738@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Yulei Zhang <yulei.zhang@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org


--ks2flzm62jm6x46u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2016.10.21 11:06:01 +0300, Dan Carpenter wrote:
> submit_context() should return negative error codes and zero on success
> but by mistake we made it a bool.  I've changed it to int.  Also I made
> it static because this isn't referenced in any other files.
>=20
> This doesn't affect runtime because the return is eventually propogated
> to elsp_mmio_write() where it is ignored.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/g=
vt/execlist.c
> index c50a3d1a5131..bc69ba1842ea 100644
> --- a/drivers/gpu/drm/i915/gvt/execlist.c
> +++ b/drivers/gpu/drm/i915/gvt/execlist.c
> @@ -616,7 +616,7 @@ static int prepare_mm(struct intel_vgpu_workload *wor=
kload)
>  	(list_empty(q) ? NULL : container_of(q->prev, \
>  	struct intel_vgpu_workload, list))
> =20
> -bool submit_context(struct intel_vgpu *vgpu, int ring_id,
> +static int submit_context(struct intel_vgpu *vgpu, int ring_id,
>  		struct execlist_ctx_descriptor_format *desc,
>  		bool emulate_schedule_in)
>  {

Dan, this has been fixed in our recent pull, should hit linux-next very soo=
n.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ks2flzm62jm6x46u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEABECAAYFAlgJ0XoACgkQsQQaM014GCfiBgCaA7nO7DoCAYfCSckGv3fpjHTu
ATQAni8ZK2tGcwvpkMluTsKuN0sonGjt
=/rtw
-----END PGP SIGNATURE-----

--ks2flzm62jm6x46u--
