From: Finn Thain <fthain@telegraphics.com.au>
Date: Fri, 05 Jul 2019 23:56:56 +0000
Subject: Re: [PATCH] m68k: One function call less in cf_tlb_miss()
Message-Id: <alpine.LNX.2.21.1907060951060.67@nippy.intranet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5713aa4-d290-0f7d-7de8-82bcdf74ee95@web.de>
In-Reply-To: <c5713aa4-d290-0f7d-7de8-82bcdf74ee95@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-m68k@lists.linux-m68k.org, Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


On Fri, 5 Jul 2019, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 17:11:37 +0200
> 
> Avoid an extra function call 

Not really. You've avoided an extra statement.

> by using a ternary operator instead of a conditional statement for a 
> setting selection.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/m68k/mm/mcfmmu.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> index 6cb1e41d58d0..02fc0778028e 100644
> --- a/arch/m68k/mm/mcfmmu.c
> +++ b/arch/m68k/mm/mcfmmu.c
> @@ -146,12 +146,10 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
> 
>  	mmu_write(MMUDR, (pte_val(*pte) & PAGE_MASK) |
>  		((pte->pte) & CF_PAGE_MMUDR_MASK) | MMUDR_SZ_8KB | MMUDR_X);
> -
> -	if (dtlb)
> -		mmu_write(MMUOR, MMUOR_ACC | MMUOR_UAA);
> -	else
> -		mmu_write(MMUOR, MMUOR_ITLB | MMUOR_ACC | MMUOR_UAA);
> -
> +	mmu_write(MMUOR,
> +		  dtlb
> +		  ? MMUOR_ACC | MMUOR_UAA
> +		  : MMUOR_ITLB | MMUOR_ACC | MMUOR_UAA);

If you are trying to avoid redundancy, why not finish the job?

+     mmu_write(MMUOR, (dtlb ? 0 : MMUOR_ITLB) | MMUOR_ACC | MMUOR_UAA);

-- 

>  	local_irq_restore(flags);
>  	return 0;
>  }
> --
> 2.22.0
> 
> 
