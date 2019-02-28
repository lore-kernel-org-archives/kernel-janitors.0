From: Steve French <smfrench@gmail.com>
Date: Thu, 28 Feb 2019 05:44:14 +0000
Subject: Re: [PATCH] cifs: Clean up an error code in cifs_root_iget()
Message-Id: <CAH2r5ms1+5Kj_qmWx3oww7Af_rfiCSBbkGos_gqieqH7jW98BQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190228052659.GA3253@kadam>
In-Reply-To: <20190228052659.GA3253@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>

Won't that change behavior and cause the success case (server returned
0, and does support POSIX and &inode pointer is ok) to now return
-EINVAL.

Before if rc was 0 and inode was filled in we wouldn't execute this else block:

    } else if (rc) {
        iget_failed(inode);
        inode = ERR_PTR(rc);
    }

But with your change, won't we return EINVAL for the success case?

How about just changing:

iget_no_retry:
    if (!inode) {
        inode = ERR_PTR(rc);
        goto out;
    }

to

iget_no_retry:
    if (!inode) {
        if (rc = 0)
              rc = -EINVAL;
        inode = ERR_PTR(rc);
        goto out;
    }



On Wed, Feb 27, 2019 at 11:28 PM Dan Carpenter via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> This patch silences a Smatch warning:
>
> fs/cifs/inode.c:1094 cifs_root_iget() warn: passing zero to 'ERR_PTR'
>
> The shouldn't have a noticeable effect on runtime, it's basically
> a cleanup.  The code is checking to ensure that cifs_get_inode_info_unix()
> returns -EOPNOTSUPP when we have the UNIX extensions.  From the patch
> description in commit b5b374eab11e ("Workaround Mac server problem")
> this affects Macs.
>
> Presumably most of the time "rc" is zero, which means we return
> ERR_PTR(0) which is NULL.  This cifs_root_iget() function is only called
> from cifs_read_super() and if we return NULL that causes d_make_root()
> to return NULL so in the end we fail with -ENOMEM.
>
> After this patch is applied we instead return with -EINVAL.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/inode.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> index 0f53ecb071ac..e40c554bb2f3 100644
> --- a/fs/cifs/inode.c
> +++ b/fs/cifs/inode.c
> @@ -1080,8 +1080,10 @@ struct inode *cifs_root_iget(struct super_block *sb)
>         if (tcon->unix_ext) {
>                 rc = cifs_get_inode_info_unix(&inode, path, sb, xid);
>                 /* some servers mistakenly claim POSIX support */
> -               if (rc != -EOPNOTSUPP)
> +               if (rc != -EOPNOTSUPP) {
> +                       rc = -EINVAL;
>                         goto iget_no_retry;
> +               }
>                 cifs_dbg(VFS, "server does not support POSIX extensions");
>                 tcon->unix_ext = false;
>         }
> --
> 2.17.1
>
>


--
Thanks,

Steve
