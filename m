From: Helge Deller <deller@gmx.de>
Date: Mon, 13 Jul 2015 18:52:37 +0000
Subject: Re: [PATCH] parisc: mm: Fix a memory leak related to pmd not attached to the pgd
Message-Id: <55A408F5.601@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jejb@parisc-linux.org, mpatocka@redhat.com, kirill.shutemov@linux.intel.com
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, John David Anglin <dave.anglin@bell.net>, Meelis Roos <mroos@linux.ee>

Hi Christophe,

On 13.07.2015 11:32, Christophe JAILLET wrote:
> Commit 0e0da48dee8d ("parisc: mm: don't count preallocated pmds")
> introduced a memory leak.
>
> After this commit, the 'return' statement in pmd_free is executed in all
> cases. Even for pmd that are not attached to the pgd.
> So 'free_pages' can never be called anymore, leading to a memory leak.

That's really great!!! Thanks for spotting this!

I assume this fixes the leak which killed our debian buildds with OOM
after an uptime of 1-4 days and which only happened since kernel 4.0.
Meelis Roos reported the issue already in this thread:
http://marc.info/?l=linux-parisc&m2999113232154&w=2

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Helge Deller <deller@gmx.de>


Will this patch be pushed via linux-mm or another tree, if
not I can take it via the parisc tree?


Helge


> ---
> This patch is *untested* as I don't have the hardware to test it.
>
> This is just a guess based on the indentation, the comment in the code
> and the commit log.
> ---
>   arch/parisc/include/asm/pgalloc.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
> index 3a08eae..f66d3738 100644
> --- a/arch/parisc/include/asm/pgalloc.h
> +++ b/arch/parisc/include/asm/pgalloc.h
> @@ -72,7 +72,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>
>   static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
>   {
> -	if(pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
> +	if (pmd_flag(*pmd) & PxD_FLAG_ATTACHED) {
>   		/*
>   		 * This is the permanent pmd attached to the pgd;
>   		 * cannot free it.
> @@ -81,6 +81,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
>   		 */
>   		mm_inc_nr_pmds(mm);
>   		return;
> +	}
>   	free_pages((unsigned long)pmd, PMD_ORDER);
>   }
>
>

