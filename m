From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Fri, 11 Sep 2020 11:49:42 +0000
Subject: Re: [PATCH][next] KVM: SVM: nested: fix free of uninitialized pointers save and ctl
Message-Id: <87o8mclei1.fsf@vitty.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200911110730.24238-1-colin.king@canonical.com>
In-Reply-To: <20200911110730.24238-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "maintainer:X86 ARCHITECTURE" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the error exit path to outt_set_gif will kfree on
> uninitialized

typo: out_set_gif

> pointers save and ctl.  Fix this by ensuring these pointers are
> inintialized to NULL to avoid garbage pointer freeing.
>
> Addresses-Coverity: ("Uninitialized pointer read")
> Fixes: 6ccbd29ade0d ("KVM: SVM: nested: Don't allocate VMCB structures
> on stack")

Where is this commit id from? I don't see it in Paolo's kvm tree, if
it's not yet merged, maybe we should fix it and avoid introducing the
issue in the first place?

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/x86/kvm/svm/nested.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 28036629abf8..2b15f49f9e5a 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -1060,8 +1060,8 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
>  	struct vmcb *hsave = svm->nested.hsave;
>  	struct vmcb __user *user_vmcb = (struct vmcb __user *)
>  		&user_kvm_nested_state->data.svm[0];
> -	struct vmcb_control_area *ctl;
> -	struct vmcb_save_area *save;
> +	struct vmcb_control_area *ctl = NULL;
> +	struct vmcb_save_area *save = NULL;
>  	int ret;
>  	u32 cr0;

I think it would be better if we eliminate 'out_set_gif; completely as
the 'error path' we have looks a bit weird anyway. Something like
(untested):

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 28036629abf8..d1ae94f40907 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1092,7 +1092,8 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 
        if (!(kvm_state->flags & KVM_STATE_NESTED_GUEST_MODE)) {
                svm_leave_nested(svm);
-               goto out_set_gif;
+               svm_set_gif(svm, !!(kvm_state->flags & KVM_STATE_NESTED_GIF_SET));
+               return 0;
        }
 
        if (!page_address_valid(vcpu, kvm_state->hdr.svm.vmcb_pa))
@@ -1145,7 +1146,6 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
        load_nested_vmcb_control(svm, ctl);
        nested_prepare_vmcb_control(svm);
 
-out_set_gif:
        svm_set_gif(svm, !!(kvm_state->flags & KVM_STATE_NESTED_GIF_SET));
 
        ret = 0;

-- 
Vitaly
