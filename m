From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:15:12 +0000
Subject: [PATCH 5/9] KVM: Improve size determinations in kvm_vcpu_ioctl()
Message-Id: <d1662d7a-ac99-0885-21e2-7359478749d9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
In-Reply-To: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 17:11:16 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 virt/kvm/kvm_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9d463b7a3912..6a74a3796b3f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2569,7 +2569,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 	case KVM_GET_REGS: {
 		struct kvm_regs *kvm_regs;
 
-		kvm_regs = kzalloc(sizeof(struct kvm_regs), GFP_KERNEL);
+		kvm_regs = kzalloc(sizeof(*kvm_regs), GFP_KERNEL);
 		if (!kvm_regs) {
 			r = -ENOMEM;
 			goto put_vcpu;
@@ -2577,7 +2577,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		r = kvm_arch_vcpu_ioctl_get_regs(vcpu, kvm_regs);
 		if (r)
 			goto free_regs;
-		if (copy_to_user(argp, kvm_regs, sizeof(struct kvm_regs)))
+		if (copy_to_user(argp, kvm_regs, sizeof(*kvm_regs)))
 			r = -EFAULT;
 free_regs:
 		kfree(kvm_regs);
@@ -2598,7 +2598,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 	case KVM_GET_SREGS: {
 		struct kvm_sregs *kvm_sregs;
 
-		kvm_sregs = kzalloc(sizeof(struct kvm_sregs), GFP_KERNEL);
+		kvm_sregs = kzalloc(sizeof(*kvm_sregs), GFP_KERNEL);
 		if (!kvm_sregs) {
 			r = -ENOMEM;
 			goto put_vcpu;
@@ -2606,7 +2606,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		r = kvm_arch_vcpu_ioctl_get_sregs(vcpu, kvm_sregs);
 		if (r)
 			goto free_sregs;
-		if (copy_to_user(argp, kvm_sregs, sizeof(struct kvm_sregs)))
+		if (copy_to_user(argp, kvm_sregs, sizeof(*kvm_sregs)))
 			r = -EFAULT;
 free_sregs:
 		kfree(kvm_sregs);
@@ -2697,7 +2697,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 	case KVM_GET_FPU: {
 		struct kvm_fpu *fpu;
 
-		fpu = kzalloc(sizeof(struct kvm_fpu), GFP_KERNEL);
+		fpu = kzalloc(sizeof(*fpu), GFP_KERNEL);
 		if (!fpu) {
 			r = -ENOMEM;
 			goto put_vcpu;
@@ -2705,7 +2705,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		r = kvm_arch_vcpu_ioctl_get_fpu(vcpu, fpu);
 		if (r)
 			goto free_fpu;
-		if (copy_to_user(argp, fpu, sizeof(struct kvm_fpu)))
+		if (copy_to_user(argp, fpu, sizeof(*fpu)))
 			r = -EFAULT;
 free_fpu:
 		kfree(fpu);
-- 
2.11.0

