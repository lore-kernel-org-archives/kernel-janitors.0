From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jan 2015 14:32:32 +0000
Subject: [patch] KVM: always initialize *pdata in get_msr()
Message-Id: <20150123143232.GA4298@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gleb Natapov <gleb@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that there are some paths where we use uninitialized
data in em_sysenter().

        arch/x86/kvm/emulate.c:2410 em_sysenter()
        error: potentially using uninitialized 'msr_data'.

A couple examples of paths which don't set "pdata" are found in
get_msr_hyperv() and kvm_x2apic_msr_read().  I looked at this code and
it seems like setting it to zero is a common default behaviour.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis only, not from real life.

diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
index a17d848..f0e30d2 100644
--- a/arch/x86/kvm/svm.c
+++ b/arch/x86/kvm/svm.c
@@ -3063,6 +3063,8 @@ static int svm_get_msr(struct kvm_vcpu *vcpu, unsigned ecx, u64 *data)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 
+	*data = 0;
+
 	switch (ecx) {
 	case MSR_IA32_TSC: {
 		*data = svm->vmcb->control.tsc_offset +
diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
index ce35071..3bdb9ca 100644
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@ -2544,6 +2544,7 @@ static int vmx_get_msr(struct kvm_vcpu *vcpu, u32 msr_index, u64 *pdata)
 		printk(KERN_ERR "BUG: get_msr called with NULL pdata\n");
 		return -EINVAL;
 	}
+	*pdata = 0;
 
 	switch (msr_index) {
 #ifdef CONFIG_X86_64
