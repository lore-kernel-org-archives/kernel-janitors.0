From: "Zhang, Xiantao" <xiantao.zhang@intel.com>
Date: Wed, 23 Jul 2008 01:26:12 +0000
Subject: RE: [PATCH retry] arch/ia64/kvm/kvm-ia64.c: Add local_irq_restore in error handling code
Message-Id: <42DFA526FC41B1429CE7279EF83C6BDC01689A73@pdsmsx415.ccr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, avi@qumranet.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> There is a call to local_irq_restore in the normal exit case, so it
> would 
> seem that there should be one on an error return as well.
> 
> The semantic patch that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)

Good catch!  Excellent patch to find such issues!
Xiantao

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
>> 
> if (...)
> +   {local_irq_restore(l);
>     return ...;
> +   }
>> 
> spin_unlock_irqrestore(E2,l);
>> 
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
> diff --git a/home/julia/linux-2.6/arch/ia64/kvm/kvm-ia64.c
> b/var/julia/linuxcopy/arch/ia64/kvm/kvm-ia64.c index 2672f4d..7a37d06
> 100644 --- a/home/julia/linux-2.6/arch/ia64/kvm/kvm-ia64.c
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
> @@ -1253,6 +1253,7 @@ static int vti_vcpu_setup(struct kvm_vcpu
>  *vcpu, int id) uninit:
>  	kvm_vcpu_uninit(vcpu);
>  fail:
> +	local_irq_restore(psr);
>  	return r;
>  }

