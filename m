From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Date: Fri, 25 Jan 2019 01:59:15 +0000
Subject: Re: [PATCH -next] btrfs: qgroup: Fix inconsistent IS_ERR and PTR_ERR
Message-Id: <87ac97b6-2b14-9b48-ed28-4d0cbce7322f@gmx.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="qgNe8SOIJ4U8KdQr62IyWiGQvTSoEzN5W"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548381009-80383-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548381009-80383-1-git-send-email-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qgNe8SOIJ4U8KdQr62IyWiGQvTSoEzN5W
Content-Type: multipart/mixed; boundary="YCXUkXFkYcRcwx6TRk94ZDFWGSRTkI3PB";
 protected-headers="v1"
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
To: YueHaibing <yuehaibing@huawei.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org
Message-ID: <87ac97b6-2b14-9b48-ed28-4d0cbce7322f@gmx.com>
Subject: Re: [PATCH -next] btrfs: qgroup: Fix inconsistent IS_ERR and PTR_ERR
References: <1548381009-80383-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548381009-80383-1-git-send-email-yuehaibing@huawei.com>

--YCXUkXFkYcRcwx6TRk94ZDFWGSRTkI3PB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2019/1/25 =E4=B8=8A=E5=8D=889:50, YueHaibing wrote:
> Change the call to PTR_ERR to access the value just tested by IS_ERR.
>=20
> Fixes: 2b35a512e9cf ("btrfs: qgroup: Use delayed subtree rescan for bal=
ance")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/btrfs/qgroup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
> index 8559ed9..16d7ec8 100644
> --- a/fs/btrfs/qgroup.c
> +++ b/fs/btrfs/qgroup.c
> @@ -3931,7 +3931,7 @@ int btrfs_qgroup_trace_subtree_after_cow(struct b=
trfs_trans_handle *trans,
>  				   block->reloc_generation, block->level,
>  				   &block->first_key);
>  	if (IS_ERR(reloc_eb)) {
> -		ret =3D PTR_ERR(subv_eb);
> +		ret =3D PTR_ERR(reloc_eb);

Nice catch.

I'll fold the this fix in my original patch if it's OK for you.

Thanks,
Qu

>  		reloc_eb =3D NULL;
>  		goto free_out;
>  	}
>=20
>=20
>=20


--YCXUkXFkYcRcwx6TRk94ZDFWGSRTkI3PB--

--qgNe8SOIJ4U8KdQr62IyWiGQvTSoEzN5W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAlxKbXMACgkQwj2R86El
/qjCQgf/ZGh+mpxDZQ1fNekELd9Z/WaugVr93RhnGG11Ly/FgHDGVTYPVJywNWpd
rQpxJ0dBO4KmW8i5nPpHsccxoGibcdZ8efdBklfoTWFKyIvKrMbfA1uFglNgKZVg
hH1LAsXnydjsI/J/rL/p1o13QI3lLA8seEL7/Y0QBgY4fgrtXL7C02rNdGFODYsp
SWgja5kZ6+iB+Kl0BUEhkg28cKeGoy64OOcj2usUZWVe2yDvl/GJ1MRRhypvXkH5
yrJddZLSzpJgEqJcxpHB0F+ne7l4y1hj2zvDOCEapGuAQObNXunPqu+cTFLtzY/f
nmSzOF27xJOemn7iG9ZFkn7hcC2yqw==
=RPRW
-----END PGP SIGNATURE-----

--qgNe8SOIJ4U8KdQr62IyWiGQvTSoEzN5W--
