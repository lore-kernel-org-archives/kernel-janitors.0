From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?=  <ernesto.mnd.fernandez@gmail.com>
Date: Wed, 17 Oct 2018 17:49:54 +0000
Subject: Re: [PATCH] hfs: fix array out of bounds read of array extent
Message-Id: <20181017174954.6rd3tpcwqv42koh5@eaf>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180831140538.31566-1-colin.king@canonical.com>
In-Reply-To: <20180831140538.31566-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: linux-fsdevel@vger.kernel.org, dhowells@redhat.com, viro@zeniv.linux.org.uk, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Fri, Aug 31, 2018 at 03:05:38PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently extent and index i are both being incremented causing
> an array out of bounds read on extent[i]. Fix this by removing
> the extraneous increment of extent.
>=20
> Detected by CoverityScan, CID#711541 ("Out of bounds read")
>=20
> Fixes: d1081202f1d0 ("HFS rewrite")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I don't think this got picked up yet; let's see if I can help.

Reviewed-by: Ernesto A. Fern=C3=A1ndez <ernesto.mnd.fernandez@gmail.com>

> ---
>  fs/hfs/extent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
> index 5d0182654580..636cdfcecb26 100644
> --- a/fs/hfs/extent.c
> +++ b/fs/hfs/extent.c
> @@ -300,7 +300,7 @@ int hfs_free_fork(struct super_block *sb, struct hfs_=
cat_file *file, int type)
>  		return 0;
> =20
>  	blocks =3D 0;
> -	for (i =3D 0; i < 3; extent++, i++)
> +	for (i =3D 0; i < 3; i++)
>  		blocks +=3D be16_to_cpu(extent[i].count);
> =20
>  	res =3D hfs_free_extents(sb, extent, blocks, blocks);
> --=20
> 2.17.1
>=20
