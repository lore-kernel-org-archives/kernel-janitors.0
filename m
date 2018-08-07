From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Tue, 07 Aug 2018 02:40:39 +0000
Subject: Re: [PATCH] drm/i915/kvmgt: fix an error code in gvt_dma_map_page()
Message-Id: <20180807024039.GA22630@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nynJ8Zgemp8dhn89"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081921.jdair4cgqllst5yj@mwanda>
In-Reply-To: <20180719081921.jdair4cgqllst5yj@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org


--nynJ8Zgemp8dhn89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2018.07.19 11:19:21 +0300, Dan Carpenter wrote:
> The dma_mapping_error() returns true on error but we want to return
> -ENOMEM here.
>=20
> Fixes: 79e542f5af79 ("drm/i915/kvmgt: Support setting dma map for huge pa=
ges")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Applied, thanks!

> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 4d2f53ae9f0f..32ec5748f176 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -187,14 +187,14 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu=
, unsigned long gfn,
> =20
>  	/* Setup DMA mapping. */
>  	*dma_addr =3D dma_map_page(dev, page, 0, size, PCI_DMA_BIDIRECTIONAL);
> -	ret =3D dma_mapping_error(dev, *dma_addr);
> -	if (ret) {
> +	if (dma_mapping_error(dev, *dma_addr)) {
>  		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
>  			     page_to_pfn(page), ret);
>  		gvt_unpin_guest_page(vgpu, gfn, size);
> +		return -ENOMEM;
>  	}
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gf=
n,
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--nynJ8Zgemp8dhn89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCW2kGpwAKCRCxBBozTXgY
J740AJ9AmjZmzCry4HxFFNLnq9J8DsJ5fgCePClfgCdW5P3VSAKyn7OUUAltgbg=
=PtTe
-----END PGP SIGNATURE-----

--nynJ8Zgemp8dhn89--
