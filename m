From: Dan Streetman <ddstreet@ieee.org>
Date: Wed, 16 Aug 2017 11:19:12 +0000
Subject: Re: [PATCH 1/2] zpool: Delete an error message for a failed memory allocation in zpool_create_pool()
Message-Id: <CALZtONACUD_EjnBh71accGgLZ+aH44pORv7aBpVDYPgZsBgyow@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0fec59a9-ac68-33f6-533a-adfb5fa3c380@users.sourceforge.net> <81cdf225-ebaa-19dc-30d8-80ec6cfab6cd@users.sourceforge.net>
In-Reply-To: <81cdf225-ebaa-19dc-30d8-80ec6cfab6cd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Aug 14, 2017 at 7:15 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 14 Aug 2017 12:57:16 +0200
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Dan Streetman <ddstreet@ieee.org>

> ---
>  mm/zpool.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/mm/zpool.c b/mm/zpool.c
> index fd3ff719c32c..fe1943f7d844 100644
> --- a/mm/zpool.c
> +++ b/mm/zpool.c
> @@ -172,7 +172,6 @@ struct zpool *zpool_create_pool(const char *type, const char *name, gfp_t gfp,
>
>         zpool = kmalloc(sizeof(*zpool), gfp);
>         if (!zpool) {
> -               pr_err("couldn't create zpool - out of memory\n");
>                 zpool_put_driver(driver);
>                 return NULL;
>         }
> --
> 2.14.0
>
