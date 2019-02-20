From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Date: Wed, 20 Feb 2019 03:38:44 +0000
Subject: Re: [PATCH -next] btrfs: Fix type conversion in btrfs_read_root_item
Message-Id: <0b9cbf46-950a-2135-8c71-be4c7dfd9420@gmx.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="SKuvs6x35yDlQdbgK1bVklwvtfwVjNsqE"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220030840.188854-1-yuehaibing@huawei.com>
In-Reply-To: <20190220030840.188854-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SKuvs6x35yDlQdbgK1bVklwvtfwVjNsqE
Content-Type: multipart/mixed; boundary="jTaruMgeTddB66kxsFNmViwpZnNwMA5dl";
 protected-headers="v1"
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
To: YueHaibing <yuehaibing@huawei.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-ID: <0b9cbf46-950a-2135-8c71-be4c7dfd9420@gmx.com>
Subject: Re: [PATCH -next] btrfs: Fix type conversion in btrfs_read_root_item
References: <20190220030840.188854-1-yuehaibing@huawei.com>
In-Reply-To: <20190220030840.188854-1-yuehaibing@huawei.com>

--jTaruMgeTddB66kxsFNmViwpZnNwMA5dl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2019/2/20 =E4=B8=8A=E5=8D=8811:08, YueHaibing wrote:
> btrfs_item_size_nr return value is u32, convert it to int may result
> in truncation.Also read_extent_buffer expect a unsigned param, so
> min_t should use type u32 to compare.

Btrfs has a up limit on item size, it will never exceed 64K - various
overhead.

Furthermore, btrfs has metadata read time check to exclude such
obviously corrupted tree blocks, thus corrupted tree block will never
reach here.

Thanks,
Qu

>=20
> Fixes: 8ea05e3a4262 ("Btrfs: introduce subvol uuids and times")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
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


--jTaruMgeTddB66kxsFNmViwpZnNwMA5dl--

--SKuvs6x35yDlQdbgK1bVklwvtfwVjNsqE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAlxsy8QACgkQwj2R86El
/qhJaAf6AgR7NSKtc4KR67kkqWFzh37VXspXmAZ4+jAfpJXS7Y5wKDM+RCXrXYhr
FtworWumikyqilxSXWsvhd76+6zHgmEGowybTGSopy0LFl4y0PxsBFOby2PuPmsc
kYEXhPWieq16IY/oyj2NZrXb4sR4sdVEGGkAricUGP2j803tFAv9wwSgLm1XRug7
eklKDXwzmGw8/qn5WtCurL5++svaKhX+VOyfIVbr8E6SSCKnrJvdV9NGb67rIVJk
orKXZ5/I8kOlGr0M49GlnzuYC1eo3cEIdn1rGFSkVTKekdZGPTyGy8CeCXP+1VDO
YSXfbe69UTIH7+r9mHdqJe7LOJtsTA==
=e6mE
-----END PGP SIGNATURE-----

--SKuvs6x35yDlQdbgK1bVklwvtfwVjNsqE--
