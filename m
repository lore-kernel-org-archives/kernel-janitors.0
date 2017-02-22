From: Greg Kurz <groug@kaod.org>
Date: Wed, 22 Feb 2017 08:08:21 +0000
Subject: Re: [V9fs-developer] [PATCH] fs/9p: Remove cast from memory allocation
Message-Id: <20170222090821.4b6f32b0@bahia.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/rMs4mZr7Sck4J7TTYZN7t=K"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1487745253-15411-1-git-send-email-me@tobin.cc>
In-Reply-To: <1487745253-15411-1-git-send-email-me@tobin.cc>
To: "Tobin C. Harding" <me@tobin.cc>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/rMs4mZr7Sck4J7TTYZN7t=K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Feb 2017 17:34:13 +1100
"Tobin C. Harding" <me@tobin.cc> wrote:

> Coccinelle emits WARNING: casting value returned by memory allocation
> function to (struct v9fs_inode *) is useless.
>=20
> Remove unnecessary cast.
>=20
> Signed-off-by: Tobin C. Harding <me@tobin.cc>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  fs/9p/vfs_inode.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
> index f4f4450..462e9e4 100644
> --- a/fs/9p/vfs_inode.c
> +++ b/fs/9p/vfs_inode.c
> @@ -238,8 +238,7 @@ v9fs_blank_wstat(struct p9_wstat *wstat)
>  struct inode *v9fs_alloc_inode(struct super_block *sb)
>  {
>  	struct v9fs_inode *v9inode;
> -	v9inode =3D (struct v9fs_inode *)kmem_cache_alloc(v9fs_inode_cache,
> -							GFP_KERNEL);
> +	v9inode =3D kmem_cache_alloc(v9fs_inode_cache, GFP_KERNEL);
>  	if (!v9inode)
>  		return NULL;
>  #ifdef CONFIG_9P_FSCACHE


--Sig_/rMs4mZr7Sck4J7TTYZN7t=K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlitRvUACgkQAvw66wEB28IoLQCfaSoreBIzfM3kg+uvPm95VByb
aDcAniMfjo8DkvVEMUmb+0KjTzQa7osu
=mgfN
-----END PGP SIGNATURE-----

--Sig_/rMs4mZr7Sck4J7TTYZN7t=K--
