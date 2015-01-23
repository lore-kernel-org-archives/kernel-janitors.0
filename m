From: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Date: Fri, 23 Jan 2015 16:08:03 +0000
Subject: Re: [patch] KVM: always initialize *pdata in get_msr()
Message-Id: <20150123160803.GA3267@potion.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150123143232.GA4298@mwanda>
In-Reply-To: <20150123143232.GA4298@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Gleb Natapov <gleb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

2015-01-23 17:32+0300, Dan Carpenter:
> Smatch complains that there are some paths where we use uninitialized
> data in em_sysenter().
> 
>         arch/x86/kvm/emulate.c:2410 em_sysenter()
>         error: potentially using uninitialized 'msr_data'.
> 

I have two hypotheses why smatch thinks so
 1) vmcs_readl() return value is treated as potentially uninitialized
 2) even non-reachable switch cases are considered

Both of them would likely throw other false positives and I think the
rest is covered in analysis at the bottom ... have I missed something?
(I presume that this patch fixes that message.)

> A couple examples of paths which don't set "pdata" are found in
> get_msr_hyperv() and kvm_x2apic_msr_read().  I looked at this code and
> it seems like setting it to zero is a common default behaviour.

This patch will prevent future detection of functional bugs :(
But those bugs could be CVEs (the fear!) and zero is sane,

Reviewed-by: Radim Krčmář <rkrcmar@redhat.com>

> +++ b/arch/x86/kvm/svm.c
> @@ -3063,6 +3063,8 @@ static int svm_get_msr(struct kvm_vcpu *vcpu, unsigned ecx, u64 *data)
>  {
>  	struct vcpu_svm *svm = to_svm(vcpu);
>  
> +	*data = 0;

(Not sure why we don't check data for NULL too, or don't remove the
 check from vmx_get_msr() ...)


---
msr_data is always initialized.
It is set with

  ops->get_msr(ctxt, MSR_IA32_SYSENTER_CS, &msr_data);
   emulator_get_msr(ctxt, MSR_IA32_SYSENTER_CS, &msr_data);
    kvm_get_msr(emul_to_vcpu(ctxt), MSR_IA32_SYSENTER_CS, &msr_data);
     kvm_x86_ops->get_msr(emul_to_vcpu(ctxt), MSR_IA32_SYSENTER_CS, &msr_data);

where kvm_x86_ops->get_msr is either svm_get_msr or vmx_get_msr.
(If smatch thinks that it can also be something else, fixing it there
 won't shut it up.)

svm_get_msr: msr_data is always initialized.

  svm_get_msr(struct kvm_vcpu *vcpu, unsigned ecx, u64 *data) {
    [...]
    switch (ecx) {
    [...]
    case MSR_IA32_SYSENTER_CS:
      *data = svm->vmcb->save.sysenter_cs;
      break;
    [...]
    }

    return 0;
  }

vmx_get_msr: msr_data can only remain uninitialized if msr_data is
located at memory offset 0.  (Won't happen in Linux and still wouldn't
suppress the warning, because the patch sets msr_data after the check.)

  vmx_get_msr(struct kvm_vcpu *vcpu, u32 msr_index, u64 *pdata) {
  [...]
  if (!pdata) {
    [...]
    return -EINVAL;
  }

  switch (msr_index) {
  [...]
  case MSR_IA32_SYSENTER_CS:
    data = vmcs_read32(GUEST_SYSENTER_CS);
    break;
  [...]
  }

  *pdata = data;
  return 0;
