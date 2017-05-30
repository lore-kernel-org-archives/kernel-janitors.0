From: Dan Streetman <ddstreet@ieee.org>
Date: Tue, 30 May 2017 23:18:55 +0000
Subject: Re: [PATCH 1/3] zswap: Delete an error message for a failed memory allocation in zswap_pool_create()
Message-Id: <CALZtONC5Jb15itFG-zxDC317oqdKGosp=44c=hpsEdaoYLmmUg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05101843-91f6-3243-18ea-acac8e8ef6af@users.sourceforge.net> <2345aabc-ae98-1d31-afba-40a02c5baf3d@users.sourceforge.net>
In-Reply-To: <2345aabc-ae98-1d31-afba-40a02c5baf3d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux-MM <linux-mm@kvack.org>, Seth Jennings <sjenning@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, May 21, 2017 at 4:25 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 20 May 2017 22:33:21 +0200
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Dan Streetman <ddstreet@ieee.org>

> ---
>  mm/zswap.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index eedc27894b10..18d8e87119a6 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -518,7 +518,5 @@ static struct zswap_pool *zswap_pool_create(char *type, char *compressor)
> -       if (!pool) {
> -               pr_err("pool alloc failed\n");
> +       if (!pool)
>                 return NULL;
> -       }
>
>         /* unique name for each pool specifically required by zsmalloc */
>         snprintf(name, 38, "zswap%x", atomic_inc_return(&zswap_pools_count));
> --
> 2.13.0
>
> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo@kvack.org.  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
