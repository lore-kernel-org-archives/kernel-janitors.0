From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Aug 2019 09:38:52 +0000
Subject: [PATCH] x86: KVM: svm: Fix a check in nested_svm_vmrun()
Message-Id: <20190827093852.GA8443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

We refactored this code a bit and accidentally deleted the "-" character
from "-EINVAL".  The kvm_vcpu_map() function never returns positive
EINVAL.

Fixes: c8e16b78c614 ("x86: KVM: svm: eliminate hardcoded RIP advancement from vmrun_interception()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  I don't really know the impact.


 arch/x86/kvm/svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
index 1f220a85514f..ef646e22d1ab 100644
--- a/arch/x86/kvm/svm.c
+++ b/arch/x86/kvm/svm.c
@@ -3598,7 +3598,7 @@ static int nested_svm_vmrun(struct vcpu_svm *svm)
 	vmcb_gpa = svm->vmcb->save.rax;
 
 	ret = kvm_vcpu_map(&svm->vcpu, gpa_to_gfn(vmcb_gpa), &map);
-	if (ret = EINVAL) {
+	if (ret = -EINVAL) {
 		kvm_inject_gp(&svm->vcpu, 0);
 		return 1;
 	} else if (ret) {
-- 
2.20.1
