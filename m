From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Sat, 29 Feb 2020 07:47:16 +0000
Subject: Re: [PATCH] mm/memblock: remove redundant assignment to variable max_addr
Message-Id: <CAM9Jb+jrC0C0RGV+uM_bs5QMSFaYPHjqzOo8vQZ+y-WghQtVvg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228235003.112718-1-colin.king@canonical.com>
In-Reply-To: <20200228235003.112718-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable max_addr is being initialized with a value that is never
> read and it is being updated later with a new value.  The initialization
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  mm/memblock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/memblock.c b/mm/memblock.c
> index eba94ee3de0b..4d06bbaded0f 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1698,7 +1698,7 @@ static phys_addr_t __init_memblock __find_max_addr(phys_addr_t limit)
>
>  void __init memblock_enforce_memory_limit(phys_addr_t limit)
>  {
> -       phys_addr_t max_addr = PHYS_ADDR_MAX;
> +       phys_addr_t max_addr;
>
>         if (!limit)
>                 return;
> --
> 2.25.0

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

>
>
