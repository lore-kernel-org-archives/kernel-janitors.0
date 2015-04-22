From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 22 Apr 2015 17:05:56 +0000
Subject: Re: [PATCH 16/16] Clean up unnecessary void* pointer cast.
Message-Id: <alpine.DEB.2.10.1504221905380.2917@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429720530-20044-16-git-send-email-firogm@gmail.com>
In-Reply-To: <1429720530-20044-16-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Thu, 23 Apr 2015, Firo Yang wrote:

> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  arch/arm/kvm/mmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/kvm/mmu.c b/arch/arm/kvm/mmu.c
> index 1d5accb..fb52a52 100644
> --- a/arch/arm/kvm/mmu.c
> +++ b/arch/arm/kvm/mmu.c
> @@ -691,8 +691,7 @@ int kvm_alloc_stage2_pgd(struct kvm *kvm)
>  		 * work.  This is not used by the hardware and we have no
>  		 * alignment requirement for this allocation.
>  		 */
> -		pgd = (pgd_t *)kmalloc(PTRS_PER_S2_PGD * sizeof(pgd_t),
> -				       GFP_KERNEL | __GFP_ZERO);
> +		pgd = kmalloc(PTRS_PER_S2_PGD * sizeof(pgd_t), GFP_KERNEL | __GFP_ZERO);

The resulting code does not respect the 80 character limit.

julia

>
>  		if (!pgd) {
>  			kvm_free_hwpgd(hwpgd);
> --
> 2.1.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
