From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:14:21 +0000
Subject: [PATCH 4/9] KVM: Move error code settings in kvm_vcpu_ioctl()
Message-Id: <d1d45a34-0f6d-dabe-750e-e6f3d20e72fb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
In-Reply-To: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 17:00:19 +0100

* A local variable was set to an error code before a concrete error
  situation was detected. Thus move the corresponding assignments
  into if branches to indicate a software failure there.

  This issue was detected by using the Coccinelle software.

* The kfree() function was called in some cases by the
  kvm_vcpu_ioctl() function even if the passed variable contained
  a null pointer.

  Adjust jump targets according to the Linux coding style convention.

  Move the definition for two variables into case blocks
  so that extra initialisations can be avoided at the beginning.

* Delete the jump label "out" and seven zero assignments which became
  unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 virt/kvm/kvm_main.c | 131 +++++++++++++++++++++++++++-------------------------
 1 file changed, 69 insertions(+), 62 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 62f24d8eaaa2..9d463b7a3912 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2527,8 +2527,6 @@ static long kvm_vcpu_ioctl(struct file *filp,
 	struct kvm_vcpu *vcpu = filp->private_data;
 	void __user *argp = (void __user *)arg;
 	int r;
-	struct kvm_fpu *fpu = NULL;
-	struct kvm_sregs *kvm_sregs = NULL;
 
 	if (vcpu->kvm->mm != current->mm)
 		return -EIO;
@@ -2551,9 +2549,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		return r;
 	switch (ioctl) {
 	case KVM_RUN:
-		r = -EINVAL;
-		if (arg)
-			goto out;
+		if (arg) {
+			r = -EINVAL;
+			goto put_vcpu;
+		}
 		if (unlikely(vcpu->pid != current->pids[PIDTYPE_PID].pid)) {
 			/* The thread running this VCPU changed. */
 			struct pid *oldpid = vcpu->pid;
@@ -2570,56 +2569,59 @@ static long kvm_vcpu_ioctl(struct file *filp,
 	case KVM_GET_REGS: {
 		struct kvm_regs *kvm_regs;
 
-		r = -ENOMEM;
 		kvm_regs = kzalloc(sizeof(struct kvm_regs), GFP_KERNEL);
-		if (!kvm_regs)
-			goto out;
+		if (!kvm_regs) {
+			r = -ENOMEM;
+			goto put_vcpu;
+		}
 		r = kvm_arch_vcpu_ioctl_get_regs(vcpu, kvm_regs);
 		if (r)
-			goto out_free1;
-		r = -EFAULT;
+			goto free_regs;
 		if (copy_to_user(argp, kvm_regs, sizeof(struct kvm_regs)))
-			goto out_free1;
-		r = 0;
-out_free1:
+			r = -EFAULT;
+free_regs:
 		kfree(kvm_regs);
 		break;
 	}
 	case KVM_SET_REGS: {
 		struct kvm_regs *kvm_regs;
 
-		r = -ENOMEM;
 		kvm_regs = memdup_user(argp, sizeof(*kvm_regs));
 		if (IS_ERR(kvm_regs)) {
 			r = PTR_ERR(kvm_regs);
-			goto out;
+			goto put_vcpu;
 		}
 		r = kvm_arch_vcpu_ioctl_set_regs(vcpu, kvm_regs);
 		kfree(kvm_regs);
 		break;
 	}
 	case KVM_GET_SREGS: {
+		struct kvm_sregs *kvm_sregs;
+
 		kvm_sregs = kzalloc(sizeof(struct kvm_sregs), GFP_KERNEL);
-		r = -ENOMEM;
-		if (!kvm_sregs)
-			goto out;
+		if (!kvm_sregs) {
+			r = -ENOMEM;
+			goto put_vcpu;
+		}
 		r = kvm_arch_vcpu_ioctl_get_sregs(vcpu, kvm_sregs);
 		if (r)
-			goto out;
-		r = -EFAULT;
+			goto free_sregs;
 		if (copy_to_user(argp, kvm_sregs, sizeof(struct kvm_sregs)))
-			goto out;
-		r = 0;
+			r = -EFAULT;
+free_sregs:
+		kfree(kvm_sregs);
 		break;
 	}
 	case KVM_SET_SREGS: {
+		struct kvm_sregs *kvm_sregs;
+
 		kvm_sregs = memdup_user(argp, sizeof(*kvm_sregs));
 		if (IS_ERR(kvm_sregs)) {
 			r = PTR_ERR(kvm_sregs);
-			kvm_sregs = NULL;
-			goto out;
+			goto put_vcpu;
 		}
 		r = kvm_arch_vcpu_ioctl_set_sregs(vcpu, kvm_sregs);
+		kfree(kvm_sregs);
 		break;
 	}
 	case KVM_GET_MP_STATE: {
@@ -2627,43 +2629,42 @@ static long kvm_vcpu_ioctl(struct file *filp,
 
 		r = kvm_arch_vcpu_ioctl_get_mpstate(vcpu, &mp_state);
 		if (r)
-			goto out;
-		r = -EFAULT;
+			goto put_vcpu;
 		if (copy_to_user(argp, &mp_state, sizeof(mp_state)))
-			goto out;
-		r = 0;
+			r = -EFAULT;
 		break;
 	}
 	case KVM_SET_MP_STATE: {
 		struct kvm_mp_state mp_state;
 
-		r = -EFAULT;
-		if (copy_from_user(&mp_state, argp, sizeof(mp_state)))
-			goto out;
+		if (copy_from_user(&mp_state, argp, sizeof(mp_state))) {
+			r = -EFAULT;
+			goto put_vcpu;
+		}
 		r = kvm_arch_vcpu_ioctl_set_mpstate(vcpu, &mp_state);
 		break;
 	}
 	case KVM_TRANSLATE: {
 		struct kvm_translation tr;
 
-		r = -EFAULT;
-		if (copy_from_user(&tr, argp, sizeof(tr)))
-			goto out;
+		if (copy_from_user(&tr, argp, sizeof(tr))) {
+			r = -EFAULT;
+			goto put_vcpu;
+		}
 		r = kvm_arch_vcpu_ioctl_translate(vcpu, &tr);
 		if (r)
-			goto out;
-		r = -EFAULT;
+			goto put_vcpu;
 		if (copy_to_user(argp, &tr, sizeof(tr)))
-			goto out;
-		r = 0;
+			r = -EFAULT;
 		break;
 	}
 	case KVM_SET_GUEST_DEBUG: {
 		struct kvm_guest_debug dbg;
 
-		r = -EFAULT;
-		if (copy_from_user(&dbg, argp, sizeof(dbg)))
-			goto out;
+		if (copy_from_user(&dbg, argp, sizeof(dbg))) {
+			r = -EFAULT;
+			goto put_vcpu;
+		}
 		r = kvm_arch_vcpu_ioctl_set_guest_debug(vcpu, &dbg);
 		break;
 	}
@@ -2674,53 +2675,59 @@ static long kvm_vcpu_ioctl(struct file *filp,
 
 		p = NULL;
 		if (argp) {
-			r = -EFAULT;
 			if (copy_from_user(&kvm_sigmask, argp,
-					   sizeof(kvm_sigmask)))
-				goto out;
-			r = -EINVAL;
-			if (kvm_sigmask.len != sizeof(sigset))
-				goto out;
-			r = -EFAULT;
+					   sizeof(kvm_sigmask))) {
+				r = -EFAULT;
+				goto put_vcpu;
+			}
+			if (kvm_sigmask.len != sizeof(sigset)) {
+				r = -EINVAL;
+				goto put_vcpu;
+			}
 			if (copy_from_user(&sigset, sigmask_arg->sigset,
-					   sizeof(sigset)))
-				goto out;
+					   sizeof(sigset))) {
+				r = -EFAULT;
+				goto put_vcpu;
+			}
 			p = &sigset;
 		}
 		r = kvm_vcpu_ioctl_set_sigmask(vcpu, p);
 		break;
 	}
 	case KVM_GET_FPU: {
+		struct kvm_fpu *fpu;
+
 		fpu = kzalloc(sizeof(struct kvm_fpu), GFP_KERNEL);
-		r = -ENOMEM;
-		if (!fpu)
-			goto out;
+		if (!fpu) {
+			r = -ENOMEM;
+			goto put_vcpu;
+		}
 		r = kvm_arch_vcpu_ioctl_get_fpu(vcpu, fpu);
 		if (r)
-			goto out;
-		r = -EFAULT;
+			goto free_fpu;
 		if (copy_to_user(argp, fpu, sizeof(struct kvm_fpu)))
-			goto out;
-		r = 0;
+			r = -EFAULT;
+free_fpu:
+		kfree(fpu);
 		break;
 	}
 	case KVM_SET_FPU: {
+		struct kvm_fpu *fpu;
+
 		fpu = memdup_user(argp, sizeof(*fpu));
 		if (IS_ERR(fpu)) {
 			r = PTR_ERR(fpu);
-			fpu = NULL;
-			goto out;
+			goto put_vcpu;
 		}
 		r = kvm_arch_vcpu_ioctl_set_fpu(vcpu, fpu);
+		kfree(fpu);
 		break;
 	}
 	default:
 		r = kvm_arch_vcpu_ioctl(filp, ioctl, arg);
 	}
-out:
+put_vcpu:
 	vcpu_put(vcpu);
-	kfree(fpu);
-	kfree(kvm_sregs);
 	return r;
 }
 
-- 
2.11.0

