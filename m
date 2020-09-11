From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Sep 2020 11:07:30 +0000
Subject: [PATCH][next] KVM: SVM: nested: fix free of uninitialized pointers save and ctl
Message-Id: <20200911110730.24238-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "maintainer:X86 ARCHITECTURE" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the error exit path to outt_set_gif will kfree on uninitialized
pointers save and ctl.  Fix this by ensuring these pointers are
inintialized to NULL to avoid garbage pointer freeing.

Addresses-Coverity: ("Uninitialized pointer read")
Fixes: 6ccbd29ade0d ("KVM: SVM: nested: Don't allocate VMCB structures on stack")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kvm/svm/nested.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 28036629abf8..2b15f49f9e5a 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1060,8 +1060,8 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	struct vmcb *hsave = svm->nested.hsave;
 	struct vmcb __user *user_vmcb = (struct vmcb __user *)
 		&user_kvm_nested_state->data.svm[0];
-	struct vmcb_control_area *ctl;
-	struct vmcb_save_area *save;
+	struct vmcb_control_area *ctl = NULL;
+	struct vmcb_save_area *save = NULL;
 	int ret;
 	u32 cr0;
 
-- 
2.27.0
