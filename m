From: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Date: Wed, 14 Aug 2013 13:24:36 +0000
Subject: Re: [patch] f2fs: alloc_page() doesn't return an ERR_PTR
Message-Id: <1376486676.2354.5.camel@kjgkr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130814114136.GA8044@elgon.mountain>
In-Reply-To: <20130814114136.GA8044@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

Hi Dan,

Agreed.
Could you make a patch that covers other alloc_page cases too?

# grep alloc_page fs/f2fs/*
fs/f2fs/node.c:	page =3D alloc_page(GFP_NOFS | __GFP_ZERO);
fs/f2fs/recovery.c: page =3D alloc_page(GFP_F2FS_ZERO);
fs/f2fs/recovery.c: page =3D alloc_page(GFP_NOFS | __GFP_ZERO);

Thank you,

2013-08-14 (=EC=88=98), 14:41 +0300, Dan Carpenter:
> alloc_page() returns a NULL on failure, it never returns an ERR_PTR.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index f5172e2..3e87fe0 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1515,8 +1515,8 @@ int restore_node_summary(struct f2fs_sb_info *sbi,
> =20
>  	/* alloc temporal page for read node */
>  	page =3D alloc_page(GFP_NOFS | __GFP_ZERO);
> -	if (IS_ERR(page))
> -		return PTR_ERR(page);
> +	if (!page)
> +		return -ENOMEM;
>  	lock_page(page);
> =20
>  	/* scan the node segment */

--=20
Jaegeuk Kim
Samsung

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
