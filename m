From: walter harms <wharms@bfs.de>
Date: Thu, 24 Jul 2008 11:35:58 +0000
Subject: Re: [PATCH retry] arch/ia64/kvm/kvm-ia64.c: Add local_irq_restore
Message-Id: <4888691E.5000103@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

        local_irq_save(saved_psr);
 	slot = ia64_itr_entry(0x3, KVM_VMM_BASE, pte, KVM_VMM_SHIFT);
	local_irq_restore(saved_psr);

maybe it is posible to move that local_irq_save() into  ia64_itr_entry() directly ?

re,
 wh



Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> There is a call to local_irq_restore in the normal exit case, so it would
> seem that there should be one on an error return as well.
> 
> The semantic patch that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> expression l;
> expression E,E1,E2;
> @@
> 
> local_irq_save(l);
> ... when != local_irq_restore(l)
>     when != spin_unlock_irqrestore(E,l)
>     when any
>     when strict
> (
> if (...) { ... when != local_irq_restore(l)
>                when != spin_unlock_irqrestore(E1,l)
> +   local_irq_restore(l);
>     return ...;
> }
> |
> if (...)
> +   {local_irq_restore(l);
>     return ...;
> +   }
> |
> spin_unlock_irqrestore(E2,l);
> |
> local_irq_restore(l);
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  .../julia/linuxcopy}/arch/ia64/kvm/kvm-ia64.c      |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/home/julia/linux-2.6/arch/ia64/kvm/kvm-ia64.c b/var/julia/linuxcopy/arch/ia64/kvm/kvm-ia64.c
> index 2672f4d..7a37d06 100644
> --- a/home/julia/linux-2.6/arch/ia64/kvm/kvm-ia64.c
> +++ b/var/julia/linuxcopy/arch/ia64/kvm/kvm-ia64.c
> @@ -125,9 +125,9 @@ void kvm_arch_hardware_enable(void *garbage)
>  				PAGE_KERNEL));
>  	local_irq_save(saved_psr);
>  	slot = ia64_itr_entry(0x3, KVM_VMM_BASE, pte, KVM_VMM_SHIFT);
> +	local_irq_restore(saved_psr);
>  	if (slot < 0)
>  		return;
> -	local_irq_restore(saved_psr);
>  
>  	spin_lock(&vp_lock);
>  	status = ia64_pal_vp_init_env(kvm_vsa_base ?
> @@ -160,9 +160,9 @@ void kvm_arch_hardware_disable(void *garbage)
>  
>  	local_irq_save(saved_psr);
>  	slot = ia64_itr_entry(0x3, KVM_VMM_BASE, pte, KVM_VMM_SHIFT);
> +	local_irq_restore(saved_psr);
>  	if (slot < 0)
>  		return;
> -	local_irq_restore(saved_psr);
>  
>  	status = ia64_pal_vp_exit_env(host_iva);
>  	if (status)
> @@ -1253,6 +1253,7 @@ static int vti_vcpu_setup(struct kvm_vcpu *vcpu, int id)
>  uninit:
>  	kvm_vcpu_uninit(vcpu);
>  fail:
> +	local_irq_restore(psr);
>  	return r;
>  }
>  
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
