From: David Hildenbrand <david@redhat.com>
Date: Thu, 14 Jan 2021 09:21:04 +0000
Subject: Re: [PATCH] mm: memblock: remove return value of memblock_free_all()
Message-Id: <726525ab-d30d-e58c-21ea-db9d6ad4ae6b@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210114070817.GA2868715@AD01715016>
In-Reply-To: <20210114070817.GA2868715@AD01715016>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>, rppt@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14.01.21 08:08, Daeseok Youn wrote:
> No one checks the return value of memblock_free_all().
> Make the return value void.
> 
> memblock_free_all() is used on mem_init() for each
> architecture, and the total count of freed pages will be added
> to _totalram_pages variable by calling totalram_pages_add().
> 
> so do not need to return total count of freed pages.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  include/linux/memblock.h | 2 +-
>  mm/memblock.c            | 6 +-----
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 9c5cc95c7cee..076fda398dff 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -117,7 +117,7 @@ int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
>  int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
>  int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
>  
> -unsigned long memblock_free_all(void);
> +void memblock_free_all(void);
>  void reset_node_managed_pages(pg_data_t *pgdat);
>  void reset_all_zones_managed_pages(void);
>  void memblock_enforce_memory_reserved_overlap(void);
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 40ca30bfa387..2a2b1fe4b659 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -2074,10 +2074,8 @@ void __init reset_all_zones_managed_pages(void)
>  
>  /**
>   * memblock_free_all - release free pages to the buddy allocator
> - *
> - * Return: the number of pages actually released.
>   */
> -unsigned long __init memblock_free_all(void)
> +void __init memblock_free_all(void)
>  {
>  	unsigned long pages;
>  
> @@ -2086,8 +2084,6 @@ unsigned long __init memblock_free_all(void)
>  
>  	pages = free_low_memory_core_early();
>  	totalram_pages_add(pages);
> -
> -	return pages;
>  }
>  
>  #if defined(CONFIG_DEBUG_FS) && defined(CONFIG_ARCH_KEEP_MEMBLOCK)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb
