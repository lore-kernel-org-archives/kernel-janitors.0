From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Date: Wed, 21 Apr 2010 13:15:22 +0000
Subject: Re: [patch] logfs: testing the wrong variable
Message-Id: <20100421131517.GB18441@logfs.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100421103354.GF29647@bicker>
In-Reply-To: <20100421103354.GF29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, 21 April 2010 12:33:54 +0200, Dan Carpenter wrote:
>=20
> There is a typo here.  We should test "last" instead of "first".
>=20
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>=20
> diff --git a/fs/logfs/super.c b/fs/logfs/super.c
> index b60bfac..1e0449e 100644
> --- a/fs/logfs/super.c
> +++ b/fs/logfs/super.c
> @@ -377,7 +377,7 @@ static struct page *find_super_block(struct super_blo=
ck *sb)
>  	if (!first || IS_ERR(first))
>  		return NULL;
>  	last =3D super->s_devops->find_last_sb(sb, &super->s_sb_ofs[1]);
> -	if (!last || IS_ERR(first)) {
> +	if (!last || IS_ERR(last)) {
>  		page_cache_release(first);
>  		return NULL;
>  	}

Applied, thanks!

Did you use a tool to find this?  And if yes, where would I find it? ;)

J=C3=B6rn

--=20
In America you can have either a flimsy box banged together out of two
by fours and drywall, or a McMansion -- a flimsy box banged together
out of two by fours and drywall, but larger, more dramatic-looking,
and full of expensive fittings.
-- Paul Graham
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
