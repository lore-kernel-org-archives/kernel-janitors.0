From: Julia Lawall <julia@diku.dk>
Date: Thu, 24 Jul 2008 12:27:04 +0000
Subject: Re: [PATCH retry] arch/ia64/kvm/kvm-ia64.c: Add local_irq_restore
Message-Id: <Pine.LNX.4.64.0807241421480.2580@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 24 Jul 2008, walter harms wrote:

>         local_irq_save(saved_psr);
>  	slot = ia64_itr_entry(0x3, KVM_VMM_BASE, pte, KVM_VMM_SHIFT);
> 	local_irq_restore(saved_psr);
> 
> maybe it is posible to move that local_irq_save() into  ia64_itr_entry() directly ?

How would one make that decision?  At the moment, the function is only 
called in four places, all in the same file (arch/ia64/kvm/kvm-ia64.c).  
In two places, the code has the above pattern.  In the other two, the 
turning off of interrupts is around several levels of enclosing fuction 
calls.

In the defining file (arch/ia64/mm/tlb.c), there is also the function 
ia64_ptr_entry.  One seems to allocate and the other deallocates.  Both 
have the comment "Must be called with preemption disabled."  So perhaps if 
one is changed, the other should be changed as well?

julia
