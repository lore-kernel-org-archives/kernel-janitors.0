From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 11 Sep 2019 15:28:20 +0000
Subject: Re: [PATCH] x86: KVM: svm: Fix a check in nested_svm_vmrun()
Message-Id: <5d683b17-5eee-78cc-8a92-401f0ff27e17@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827093852.GA8443@mwanda>
In-Reply-To: <20190827093852.GA8443@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On 27/08/19 11:38, Dan Carpenter wrote:
> We refactored this code a bit and accidentally deleted the "-" character
> from "-EINVAL".  The kvm_vcpu_map() function never returns positive
> EINVAL.
> 
> Fixes: c8e16b78c614 ("x86: KVM: svm: eliminate hardcoded RIP advancement from vmrun_interception()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  I don't really know the impact.
> 
> 
>  arch/x86/kvm/svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
> index 1f220a85514f..ef646e22d1ab 100644
> --- a/arch/x86/kvm/svm.c
> +++ b/arch/x86/kvm/svm.c
> @@ -3598,7 +3598,7 @@ static int nested_svm_vmrun(struct vcpu_svm *svm)
>  	vmcb_gpa = svm->vmcb->save.rax;
>  
>  	ret = kvm_vcpu_map(&svm->vcpu, gpa_to_gfn(vmcb_gpa), &map);
> -	if (ret = EINVAL) {
> +	if (ret = -EINVAL) {
>  		kvm_inject_gp(&svm->vcpu, 0);
>  		return 1;
>  	} else if (ret) {
> 

Queued, thanks.

Paolo
