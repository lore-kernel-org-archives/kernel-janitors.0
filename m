From: Mike Marshall <hubcap@omnibond.com>
Date: Mon, 04 Jan 2016 16:18:00 +0000
Subject: Re: [PATCH] OrangeFS: constify export_operations structures
Message-Id: <CAOg9mSSmMTyAy0m7z9iYdHn_zK44xUx9yJ1Q6rAYCv7ZPPLMVA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451638912-6613-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451638912-6613-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Julia... thanks for the patch... I've applied it to my github repo,
so it will be in the next push to kernel.org.

Orangefs is still out-of-tree (only temporarily I hope ;-) so I guess I
don't belong in the MAINTAINERS file yet...

-Mike

On Fri, Jan 1, 2016 at 4:01 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> This export_operations structure is never modified, so declare it as const.
> Most other structures of this type are already const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>
> Mike, I saw your name on all of the patches for this driver, but you aren't
> in the MAINTAINERS file.  If you are the maintainer of this file, maybe you
> should add yourself there.
>
>  fs/orangefs/super.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/super.c b/fs/orangefs/super.c
> index 52bc522..bee67b3 100644
> --- a/fs/orangefs/super.c
> +++ b/fs/orangefs/super.c
> @@ -342,7 +342,7 @@ out:
>         return type;
>  }
>
> -static struct export_operations orangefs_export_ops = {
> +static const struct export_operations orangefs_export_ops = {
>         .encode_fh = orangefs_encode_fh,
>         .fh_to_dentry = orangefs_fh_to_dentry,
>  };
>
