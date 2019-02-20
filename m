From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Date: Wed, 20 Feb 2019 12:36:18 +0000
Subject: Re: [PATCH v2 -next] btrfs: Remove unnecessary casts in btrfs_read_root_item
Message-Id: <a141e8c2-ec40-3a41-3d4a-fa2a8a978b61@gmx.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="VQAk2EcGfbtQYq2ZG4Nplb3a1xKgKxeFb"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220030840.188854-1-yuehaibing@huawei.com>
 <20190220123202.43256-1-yuehaibing@huawei.com>
In-Reply-To: <20190220123202.43256-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VQAk2EcGfbtQYq2ZG4Nplb3a1xKgKxeFb
Content-Type: multipart/mixed; boundary="EKwfjgP3xMdvfGuJ97upe0lFn9qkFvCVQ";
 protected-headers="v1"
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
To: YueHaibing <yuehaibing@huawei.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <a141e8c2-ec40-3a41-3d4a-fa2a8a978b61@gmx.com>
Subject: Re: [PATCH v2 -next] btrfs: Remove unnecessary casts in
 btrfs_read_root_item
References: <20190220030840.188854-1-yuehaibing@huawei.com>
 <20190220123202.43256-1-yuehaibing@huawei.com>
In-Reply-To: <20190220123202.43256-1-yuehaibing@huawei.com>

--EKwfjgP3xMdvfGuJ97upe0lFn9qkFvCVQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2019/2/20 =E4=B8=8B=E5=8D=888:32, YueHaibing wrote:
> There is a messy cast here:
> 	min_t(int, len, (int)sizeof(*item)));
>=20
> min_t() should normally cast to unsigned.  It's not possible for
> "len" to be negative, but if it were then we definitely
> wouldn't want to pass negatives to read_extent_buffer().  Also there
> is an extra cast.
>=20
> This patch shouldn't affect runtime, it's just a clean up.
>=20
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Qu Wenruo <wqu@suse.com>

The commit message is much better.

Thanks,
Qu

> ---
> v2: modify commit message as Dan suggested=20
> ---
>  fs/btrfs/root-tree.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/btrfs/root-tree.c b/fs/btrfs/root-tree.c
> index 02d1a57af78b..893d12fbfda0 100644
> --- a/fs/btrfs/root-tree.c
> +++ b/fs/btrfs/root-tree.c
> @@ -21,12 +21,12 @@ static void btrfs_read_root_item(struct extent_buff=
er *eb, int slot,
>  				struct btrfs_root_item *item)
>  {
>  	uuid_le uuid;
> -	int len;
> +	u32 len;
>  	int need_reset =3D 0;
> =20
>  	len =3D btrfs_item_size_nr(eb, slot);
>  	read_extent_buffer(eb, item, btrfs_item_ptr_offset(eb, slot),
> -			min_t(int, len, (int)sizeof(*item)));
> +			   min_t(u32, len, sizeof(*item)));
>  	if (len < sizeof(*item))
>  		need_reset =3D 1;
>  	if (!need_reset && btrfs_root_generation(item)
>=20
>=20
>=20


--EKwfjgP3xMdvfGuJ97upe0lFn9qkFvCVQ--

--VQAk2EcGfbtQYq2ZG4Nplb3a1xKgKxeFb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAlxtScIACgkQwj2R86El
/qgv9wgAkCODEPZ6E8+ECLbmeSimSxlkehYyYdrPx91jRrIjoNhfDnedWnKGqlKE
nMkeBkttD8URGblky+23lRl76XQl+nEBuz3IOlAPwOhLKjCkZaMe+nVaCcBr9wwP
KxH9vA7/O0hVvu9PTnauapDqwUPFTnqDEpT6rMPnG0lYJcaxBjkl0NBobQfeggGu
cLFovH/C5PN5901mrBwu6Mhm4IyshwG4HLSCyAU8WpwQiSe6qe+dvZ/86l2dCLLs
dSJG6WyQ6ElguO+T+08Jps1TVHWnghjFMRdyapLU+68DMizlwaMlrR8741S+3LMq
LN+ut/TyqWOzA9Dcv/YK4FbvR/bblg==
=g1QZ
-----END PGP SIGNATURE-----

--VQAk2EcGfbtQYq2ZG4Nplb3a1xKgKxeFb--
