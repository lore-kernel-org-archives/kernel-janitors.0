From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 19:52:28 +0000
Subject: [PATCH] MIPS: KVM: Return directly after a failed copy_from_user() in kvm_arch_vcpu_ioctl()
Message-Id: <87aac8b8-4f30-2edd-4688-42d32d815cd1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 20:43:41 +0100

Return directly after a call of the function "copy_from_user" failed
in a case block.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kvm/mips.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 06a60b19acfb..1dad78f74e8c 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1152,10 +1152,8 @@ long kvm_arch_vcpu_ioctl(struct file *filp, unsigned int ioctl,
 		{
 			struct kvm_mips_interrupt irq;
 
-			r = -EFAULT;
 			if (copy_from_user(&irq, argp, sizeof(irq)))
-				goto out;
-
+				return -EFAULT;
 			kvm_debug("[%d] %s: irq: %d\n", vcpu->vcpu_id, __func__,
 				  irq.irq);
 
@@ -1165,9 +1163,8 @@ long kvm_arch_vcpu_ioctl(struct file *filp, unsigned int ioctl,
 	case KVM_ENABLE_CAP: {
 		struct kvm_enable_cap cap;
 
-		r = -EFAULT;
 		if (copy_from_user(&cap, argp, sizeof(cap)))
-			goto out;
+			return -EFAULT;
 		r = kvm_vcpu_ioctl_enable_cap(vcpu, &cap);
 		break;
 	}
-- 
2.11.0

