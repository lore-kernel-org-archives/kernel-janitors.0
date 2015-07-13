From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Date: Mon, 13 Jul 2015 09:46:25 +0000
Subject: RE: [PATCH] parisc: mm: Fix a memory leak related to pmd not attached to the pgd
Message-Id: <20150713094625.79B6EA4@black.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jejb@parisc-linux.org, deller@gmx.de, mpatocka@redhat.com, kirill.shutemov@linux.intel.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET wrote:
> Commit 0e0da48dee8d ("parisc: mm: don't count preallocated pmds")
> introduced a memory leak.
> 
> After this commit, the 'return' statement in pmd_free is executed in all
> cases. Even for pmd that are not attached to the pgd.
> So 'free_pages' can never be called anymore, leading to a memory leak.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

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
