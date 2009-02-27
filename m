From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 01:12:18 +0000
Subject: Re: [PATCH 12/16] reiserfs: fix sparse warning: Using plain integer
Message-Id: <154e089b0902261712q3dad68d7s567d0b6d9c7ee031@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000511.17557.96434.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000511.17557.96434.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

[Added To, Cc]

On Sun, Feb 22, 2009 at 1:05 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warning:
> =A0fs/reiserfs/inode.c:2555:19: warning: Using plain integer as NULL poin=
ter
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0fs/reiserfs/inode.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
> index 823227a..e69d63a 100644
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -2552,7 +2552,7 @@ static int reiserfs_write_begin(struct file *file,
> =A0 =A0 =A0 =A0int old_ref =3D 0;
>
> =A0 =A0 =A0 =A0inode =3D mapping->host;
> - =A0 =A0 =A0 *fsdata =3D 0;
> + =A0 =A0 =A0 *fsdata =3D NULL;
> =A0 =A0 =A0 =A0if (flags & AOP_FLAG_CONT_EXPAND &&
> =A0 =A0 =A0 =A0 =A0 =A0(pos & (inode->i_sb->s_blocksize - 1)) =3D 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pos ++;
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
