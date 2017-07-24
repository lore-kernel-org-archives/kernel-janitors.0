From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 24 Jul 2017 16:54:28 +0000
Subject: Re: [PATCH] KVM: x86: masking out upper bits
Message-Id: <f5718f64-149d-26da-15af-41cc22721af5@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170717081426.ma6b2w37zuowbu7o@mwanda>
In-Reply-To: <20170717081426.ma6b2w37zuowbu7o@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On 17/07/2017 10:14, Dan Carpenter wrote:
> kvm_read_cr3() returns an unsigned long and gfn is a u64.  We intended
> to mask out the bottom 5 bits but because of the type issue we mask the
> top 32 bits as well.  I don't know if this is a real problem, but it
> causes static checker warnings.

It's intended.  The VM is running in 32-bit PAE mode, and Table 4-7 of
the Intel manual says:

Table 4-7. Use of CR3 with PAE Paging
Bit Position(s)	Contents
4:0		Ignored
31:5		Physical address of the 32-Byte aligned
		page-directory-pointer table used for linear-address
		translation
63:32		Ignored (these bits exist only on processors supporting
		the Intel-64 architecture)

I'll queue a revert of this patch.

Paolo

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ca128a9c9cc4..476b7f4e0e1f 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -594,8 +594,8 @@ bool pdptrs_changed(struct kvm_vcpu *vcpu)
>  		      (unsigned long *)&vcpu->arch.regs_avail))
>  		return true;
>  
> -	gfn = (kvm_read_cr3(vcpu) & ~31u) >> PAGE_SHIFT;
> -	offset = (kvm_read_cr3(vcpu) & ~31u) & (PAGE_SIZE - 1);
> +	gfn = (kvm_read_cr3(vcpu) & ~31ul) >> PAGE_SHIFT;
> +	offset = (kvm_read_cr3(vcpu) & ~31ul) & (PAGE_SIZE - 1);
>  	r = kvm_read_nested_guest_page(vcpu, gfn, pdpte, offset, sizeof(pdpte),
>  				       PFERR_USER_MASK | PFERR_WRITE_MASK);
>  	if (r < 0)
> 

