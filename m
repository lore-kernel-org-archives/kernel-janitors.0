From: Steve French <smfrench@gmail.com>
Date: Thu, 07 Nov 2019 03:34:30 +0000
Subject: Re: [PATCH 6/8] CIFS: Return directly after a failed build_path_from_dentry() in cifs_do_create()
Message-Id: <CAH2r5msOyZXi6msPOPNnM4pF_YJEEOkxFk=dScUW0ZMuEvHFaQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <826310e5-e01c-38af-90df-c5630f761a4d@users.sourceforge.net> <24a10b1a-3b4a-da70-1670-23b4ec9abff8@users.sourceforge.net>
In-Reply-To: <24a10b1a-3b4a-da70-1670-23b4ec9abff8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: CIFS <linux-cifs@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>, Steve French <sfrench@samba.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

merged into cifs-2.6.git for-next

On Sun, Aug 20, 2017 at 11:40 AM SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 20 Aug 2017 17:17:30 +0200
>
> Return directly after a call of the function "build_path_from_dentry"
> failed at the beginning.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/cifs/dir.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
> index 2c9cbd8393d6..248aead1f3f4 100644
> --- a/fs/cifs/dir.c
> +++ b/fs/cifs/dir.c
> @@ -239,10 +239,8 @@ cifs_do_create(struct inode *inode, struct dentry *direntry, unsigned int xid,
>                 *oplock = REQ_OPLOCK;
>
>         full_path = build_path_from_dentry(direntry);
> -       if (full_path = NULL) {
> -               rc = -ENOMEM;
> -               goto out;
> -       }
> +       if (!full_path)
> +               return -ENOMEM;
>
>         if (tcon->unix_ext && cap_unix(tcon->ses) && !tcon->broken_posix_open &&
>             (CIFS_UNIX_POSIX_PATH_OPS_CAP &
> --
> 2.14.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks,

Steve
