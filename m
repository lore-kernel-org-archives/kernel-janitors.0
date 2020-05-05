From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 05 May 2020 19:57:11 +0000
Subject: Re: [PATCH -next] mm: remove duplicated include from madvise.c
Message-Id: <CAFqt6zYfX68YBjtErDEC35Y-SSsGS1Sy=9Yz35h8-pOztq+5HA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200505100049.191351-1-yuehaibing@huawei.com>
In-Reply-To: <20200505100049.191351-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <christian@brauner.io>, Linux-MM <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 5, 2020 at 3:26 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Remove duplicated include.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Tested-by: Souptick Joarder <jrdr.linux@gmail.com>

> ---
>  mm/madvise.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 8fec261457a6..f8be54dd92d3 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -29,7 +29,6 @@
>  #include <linux/swapops.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/mmu_notifier.h>
> -#include <linux/sched/mm.h>
>  #include <linux/uio.h>
>
>  #include <asm/tlb.h>
>
>
>
>
>
>
