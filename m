From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 14 Sep 2015 08:30:29 +0000
Subject: Re: [PATCH 31/39] KVM: MMU: drop null test before destroy functions
Message-Id: <55F685A5.1050805@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
 <1442146532-9100-32-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-32-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Gleb Natapov <gleb@kernel.org>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org



On 13/09/2015 14:15, Julia Lawall wrote:
> Remove unneeded NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ expression x; @@
> -if (x != NULL)
>   \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  arch/x86/kvm/mmu.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
> index 69088a1..fb0c1bd 100644
> --- a/arch/x86/kvm/mmu.c
> +++ b/arch/x86/kvm/mmu.c
> @@ -4883,10 +4883,8 @@ static struct shrinker mmu_shrinker = {
>  
>  static void mmu_destroy_caches(void)
>  {
> -	if (pte_list_desc_cache)
> -		kmem_cache_destroy(pte_list_desc_cache);
> -	if (mmu_page_header_cache)
> -		kmem_cache_destroy(mmu_page_header_cache);
> +	kmem_cache_destroy(pte_list_desc_cache);
> +	kmem_cache_destroy(mmu_page_header_cache);
>  }
>  
>  int kvm_mmu_module_init(void)
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
