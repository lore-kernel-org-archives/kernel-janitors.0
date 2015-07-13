From: Mikulas Patocka <mpatocka@redhat.com>
Date: Mon, 13 Jul 2015 12:48:49 +0000
Subject: Re: [PATCH] parisc: mm: Fix a memory leak related to pmd not attached to the pgd
Message-Id: <alpine.LRH.2.02.1507130846400.9026@file01.intranet.prod.int.rdu2.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jejb@parisc-linux.org, deller@gmx.de, kirill.shutemov@linux.intel.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Mon, 13 Jul 2015, Christophe JAILLET wrote:

> Commit 0e0da48dee8d ("parisc: mm: don't count preallocated pmds")
> introduced a memory leak.
> 
> After this commit, the 'return' statement in pmd_free is executed in all
> cases. Even for pmd that are not attached to the pgd.
> So 'free_pages' can never be called anymore, leading to a memory leak.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Mikulas Patocka <mpatocka@redhat.com>

also add this, so that it is backported to 4.0 and 4.2:
Cc: stable@vger.kernel.org	# 4.0+
Fixes: 0e0da48dee8d

> ---
> This patch is *untested* as I don't have the hardware to test it.
> 
> This is just a guess based on the indentation, the comment in the code
> and the commit log.
> ---
>  arch/parisc/include/asm/pgalloc.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
> index 3a08eae..f66d3738 100644
> --- a/arch/parisc/include/asm/pgalloc.h
> +++ b/arch/parisc/include/asm/pgalloc.h
> @@ -72,7 +72,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  
>  static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	if(pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
> +	if (pmd_flag(*pmd) & PxD_FLAG_ATTACHED) {
>  		/*
>  		 * This is the permanent pmd attached to the pgd;
>  		 * cannot free it.
> @@ -81,6 +81,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
>  		 */
>  		mm_inc_nr_pmds(mm);
>  		return;
> +	}
>  	free_pages((unsigned long)pmd, PMD_ORDER);
>  }
>  
> -- 
> 2.1.4
> 
