From: "Richard Genoud" <richard.genoud@gmail.com>
Date: Thu, 11 Sep 2008 13:46:57 +0000
Subject: Re: [PATCH 3/5] fs/namespace.c: Drop code after return
Message-Id: <80b317760809110646m703f126cv9da4bd840a41b2a8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0809111433270.9593@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0809111433270.9593@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, vigneshbabu@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2008/9/11 Julia Lawall <julia@diku.dk>:
> From: Julia Lawall <julia@diku.dk>
>
> The extra semicolon serves no purpose.
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
Reviewed-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>
>  fs/namespace.c                |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/namespace.c b/fs/namespace.c
> index 6e283c9..7e6151a 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -1993,7 +1993,7 @@ static struct mnt_namespace *dup_mnt_ns(struct mnt_namespace *mnt_ns,
>        if (!new_ns->root) {
>                up_write(&namespace_sem);
>                kfree(new_ns);
> -               return ERR_PTR(-ENOMEM);;
> +               return ERR_PTR(-ENOMEM);
>        }
>        spin_lock(&vfsmount_lock);
>        list_add_tail(&new_ns->list, &new_ns->root->mnt_list);
>
