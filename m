From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 01:10:14 +0000
Subject: Re: [PATCH 11/16] fs/super.c: fix sparse warning: Using plain integer
Message-Id: <154e089b0902261710ybebe696p2c87334b29bf08a0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000459.17557.20005.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000459.17557.20005.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Feb 22, 2009 at 1:05 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warning:
> =A0fs/super.c:849:26: warning: Using plain integer as NULL pointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0fs/super.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/super.c b/fs/super.c
> index c38eef4..c6ad02d 100644
> --- a/fs/super.c
> +++ b/fs/super.c
> @@ -846,7 +846,7 @@ void kill_block_super(struct super_block *sb)
> =A0 =A0 =A0 =A0struct block_device *bdev =3D sb->s_bdev;
> =A0 =A0 =A0 =A0fmode_t mode =3D sb->s_mode;
>
> - =A0 =A0 =A0 bdev->bd_super =3D 0;
> + =A0 =A0 =A0 bdev->bd_super =3D NULL;
> =A0 =A0 =A0 =A0generic_shutdown_super(sb);
> =A0 =A0 =A0 =A0sync_blockdev(bdev);
> =A0 =A0 =A0 =A0close_bdev_exclusive(bdev, mode);
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
