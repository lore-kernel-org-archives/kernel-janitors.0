From: walter harms <wharms@bfs.de>
Date: Mon, 12 Oct 2009 11:59:54 +0000
Subject: Re: [PATCH 1/1] kvm/mmu: Resolve compile warning
Message-Id: <4AD31A3A.90108@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1255242503.4326.39.camel@laptop>
In-Reply-To: <1255242503.4326.39.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: javier martinez canillas <martinez.javier@gmail.com>
Cc: avi@redhat.com, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org



javier martinez canillas schrieb:
> I got this compile warning with today linux-next:
> 
> arch/x86/kvm/mmu.c: In function ‘kvm_set_pte_rmapp’:
> arch/x86/kvm/mmu.c:770: warning: cast to pointer from integer of different size
> arch/x86/kvm/mmu.c: In function ‘kvm_set_spte_hva’:
> arch/x86/kvm/mmu.c:849: warning: cast from pointer to integer of different size
> 
> This patch solves the issue:
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> ---
>  arch/x86/kvm/mmu.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
> index 20a2cd1..a0b2610 100644
> --- a/arch/x86/kvm/mmu.c
> +++ b/arch/x86/kvm/mmu.c
> @@ -767,7 +767,7 @@ static int kvm_set_pte_rmapp(struct kvm *kvm, unsigned long *rmapp, u64 data)
>  {
>  	int need_flush = 0;
>  	u64 *spte, new_spte;
> -	pte_t *ptep = (pte_t *)data;
> +	pte_t *ptep = (pte_t *)(unsigned long)data;
>  	pfn_t new_pfn;
>  
>  	WARN_ON(pte_huge(*ptep));
> @@ -846,7 +846,7 @@ int kvm_unmap_hva(struct kvm *kvm, unsigned long hva)
>  
>  void kvm_set_spte_hva(struct kvm *kvm, unsigned long hva, pte_t pte)
>  {
> -	kvm_handle_hva(kvm, hva, (u64)&pte, kvm_set_pte_rmapp);
> +	kvm_handle_hva(kvm, hva, (unsigned long)&pte, kvm_set_pte_rmapp);
>  }
>  
>  static int kvm_age_rmapp(struct kvm *kvm, unsigned long *rmapp, u64 data)


Hi javier,
from the part is see in the patch i see the follwing problem:
 in kvm_set_pte_rmapp() you cast an U64 to (unsigned long)
it seems that kvm_set_pte_rmapp is mapped via kvm_handle_hva().
here pte_t pte is casted into (unsigned long).
Does look wired.


btw: there is also cleanup available claiming to fix the same warning
http://article.gmane.org/gmane.linux.kernel/900102

ntl: to much casting points to seroius trouble

re,
 wh
