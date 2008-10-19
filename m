From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Sun, 19 Oct 2008 12:44:43 +0000
Subject: Re: [PATCH] mtd: Fix compilation warnings in drivers/mtd/nand/cs553x_nand.c
Message-Id: <ea11fea30810190532l44289012tbc18cc6ac5c1b92f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30810141113i81694depeb69c50a373fcf3e@mail.gmail.com>
In-Reply-To: <ea11fea30810141113i81694depeb69c50a373fcf3e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Cc: mkatiyar@gmail.com, akpm@linux-foundation.org, kernel-janitors@vger.kernel.org

On Tue, Oct 14, 2008 at 11:43 PM, Manish Katiyar <mkatiyar@gmail.com> wrote:
> Below patch fixes the following compilation warnings.
> drivers/mtd/nand/cs553x_nand.c:293: warning: unused variable 'mtd_parts'
> drivers/mtd/nand/cs553x_nand.c:292: warning: unused variable 'mtd_parts_nb'
>
>
> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
>
> ---
>  drivers/mtd/nand/cs553x_nand.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
> index 3370a80..9f1b451 100644
> --- a/drivers/mtd/nand/cs553x_nand.c
> +++ b/drivers/mtd/nand/cs553x_nand.c
> @@ -289,8 +289,10 @@ static int __init cs553x_init(void)
>        int i;
>        uint64_t val;
>
> +#ifdef CONFIG_MTD_PARTITIONS
>        int mtd_parts_nb = 0;
>        struct mtd_partition *mtd_parts = NULL;
> +#endif
>
>        /* If the CPU isn't a Geode GX or LX, abort */
>        if (!is_geode())
> --
> 1.5.4.3
>

Resending it adding kernel-janitors, since I didn't get any response
from the linux-mtd list.

Thanks -
Manish


> Thanks -
> Manish
>
