From: Nai Xia <nai.xia@gmail.com>
Date: Fri, 18 Mar 2011 07:29:43 +0000
Subject: Re: [PATCH] ksm: add vm_stat and meminfo entry to reflect pte mapping to ksm pages
Message-Id: <201103181529.43659.nai.xia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201102262256.31565.nai.xia@gmail.com> <20110302143142.a3c0002b.akpm@linux-foundation.org>
In-Reply-To: <20110302143142.a3c0002b.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Izik Eidus <ieidus@redhat.com>, Hugh Dickins <hugh.dickins@tiscali.co.uk>, Andrea Arcangeli <aarcange@redhat.com>, Chris Wright <chrisw@sous-sol.org>, Rik van Riel <riel@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-janitors@vger.kernel.org


>On Thursday 03 March 2011, at 06:31:42, <Andrew Morton <akpm@linux-foundation.org>> wrote
> This patch obviously wasn't tested with CONFIG_KSM=n, which was a
> pretty basic patch-testing failure :(

Oops, I will be careful to avoid similar mistakes next time.

> 
> I fixed up my tree with the below, but really the amount of ifdeffing
> is unacceptable - please find a cleaner way to fix up this patch.

Ok, I will have a try in my next patch submit. 

Thanks,
-Nai
> 
> --- a/mm/ksm.c~ksm-add-vm_stat-and-meminfo-entry-to-reflect-pte-mapping-to-ksm-pages-fix
> +++ a/mm/ksm.c
> @@ -883,7 +883,6 @@ static int try_to_merge_one_page(struct 
>  	 */
>  	if (write_protect_page(vma, page, &orig_pte) = 0) {
>  		if (!kpage) {
> -			long mapcount = page_mapcount(page);
>  			/*
>  			 * While we hold page lock, upgrade page from
>  			 * PageAnon+anon_vma to PageKsm+NULL stable_node:
> @@ -891,10 +890,12 @@ static int try_to_merge_one_page(struct 
>  			 */
>  			set_page_stable_node(page, NULL);
>  			mark_page_accessed(page);
> -			if (mapcount)
> +#ifdef CONFIG_KSM
> +			if (page_mapcount(page))
>  				add_zone_page_state(page_zone(page),
>  						    NR_KSM_PAGES_SHARING,
>  						    mapcount);
> +#endif
>  			err = 0;
>  		} else if (pages_identical(page, kpage))
>  			err = replace_page(vma, page, kpage, orig_pte);
> --- a/mm/memory.c~ksm-add-vm_stat-and-meminfo-entry-to-reflect-pte-mapping-to-ksm-pages-fix
> +++ a/mm/memory.c
> @@ -719,8 +719,10 @@ copy_one_pte(struct mm_struct *dst_mm, s
>  			rss[MM_ANONPAGES]++;
>  		else
>  			rss[MM_FILEPAGES]++;
> +#ifdef CONFIG_KSM
>  		if (PageKsm(page)) /* follows page_dup_rmap() */
>  			inc_zone_page_state(page, NR_KSM_PAGES_SHARING);
> +#endif
>  	}
>  
>  out_set_pte:
> --- a/mm/rmap.c~ksm-add-vm_stat-and-meminfo-entry-to-reflect-pte-mapping-to-ksm-pages-fix
> +++ a/mm/rmap.c
> @@ -893,11 +893,12 @@ void do_page_add_anon_rmap(struct page *
>  			__inc_zone_page_state(page,
>  					      NR_ANON_TRANSPARENT_HUGEPAGES);
>  	}
> +#ifdef CONFIG_KSM
>  	if (unlikely(PageKsm(page))) {
>  		__inc_zone_page_state(page, NR_KSM_PAGES_SHARING);
>  		return;
>  	}
> -
> +#endif
>  	VM_BUG_ON(!PageLocked(page));
>  	VM_BUG_ON(address < vma->vm_start || address >= vma->vm_end);
>  	if (first)
> @@ -955,9 +956,10 @@ void page_add_file_rmap(struct page *pag
>   */
>  void page_remove_rmap(struct page *page)
>  {
> +#ifdef CONFIG_KSM
>  	if (PageKsm(page))
>  		__dec_zone_page_state(page, NR_KSM_PAGES_SHARING);
> -
> +#endif
>  	/* page still mapped by someone else? */
>  	if (!atomic_add_negative(-1, &page->_mapcount))
>  		return;
> _
> 
> 
