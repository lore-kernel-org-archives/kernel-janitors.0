From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 17 Jul 2018 16:08:33 +0000
Subject: Re: [PATCH] gfs2: remove redundant variable 'moved'
Message-Id: <CAHc6FU79qQuWD4o1SFbTshQcmuYAoQvSsNZ49jEWc-oSTthhFw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180717145928.29494-1-colin.king@canonical.com>
In-Reply-To: <20180717145928.29494-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Bob Peterson <rpeterso@redhat.com>, cluster-devel <cluster-devel@redhat.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Colin,

On 17 July 2018 at 16:59, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable 'moved' s being assigned but is never used hence it is
> redundant and can be removed.
>
> Cleans up clang warning:
> warning: variable 'moved' set but not used [-Wunused-but-set-variable]

thanks. I've looked up since when the variable is unused and added
that info. The patch is on for-next now.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/gfs2/dir.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
> index d97ad89955d1..e37002560c11 100644
> --- a/fs/gfs2/dir.c
> +++ b/fs/gfs2/dir.c
> @@ -1011,7 +1011,7 @@ static int dir_split_leaf(struct inode *inode, const struct qstr *name)
>         u64 bn, leaf_no;
>         __be64 *lp;
>         u32 index;
> -       int x, moved = 0;
> +       int x;
>         int error;
>
>         index = name->hash >> (32 - dip->i_depth);
> @@ -1113,8 +1113,6 @@ static int dir_split_leaf(struct inode *inode, const struct qstr *name)
>
>                         if (!prev)
>                                 prev = dent;
> -
> -                       moved = 1;
>                 } else {
>                         prev = dent;
>                 }
> --
> 2.17.1
>

Andreas
