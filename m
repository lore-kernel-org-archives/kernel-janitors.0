From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:12:39 +0000
Subject: [PATCH 2/9] KVM: Move error code settings in kvm_vm_ioctl()
Message-Id: <18acab5d-a10d-77c0-8e8c-67bbaa1f0edb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
In-Reply-To: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 13:45:18 +0100

* A local variable was set to an error code before a concrete error
  situation was detected. Thus move the corresponding assignments
  into if branches to indicate a software failure there.

  This issue was detected by using the Coccinelle software.

* Return directly after a call of the function "copy_from_user"
  (or two other checks) failed in a case block.

* Delete the jump label "out" and two zero assignments which became
  unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 virt/kvm/kvm_main.c | 66 ++++++++++++++++++-----------------------------------
 1 file changed, 22 insertions(+), 44 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eeb340708d97..2773e5012948 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2960,20 +2960,17 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_SET_USER_MEMORY_REGION: {
 		struct kvm_userspace_memory_region kvm_userspace_mem;
 
-		r = -EFAULT;
 		if (copy_from_user(&kvm_userspace_mem, argp,
 						sizeof(kvm_userspace_mem)))
-			goto out;
-
+			return -EFAULT;
 		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
 		break;
 	}
 	case KVM_GET_DIRTY_LOG: {
 		struct kvm_dirty_log log;
 
-		r = -EFAULT;
 		if (copy_from_user(&log, argp, sizeof(log)))
-			goto out;
+			return -EFAULT;
 		r = kvm_vm_ioctl_get_dirty_log(kvm, &log);
 		break;
 	}
@@ -2981,18 +2978,16 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_REGISTER_COALESCED_MMIO: {
 		struct kvm_coalesced_mmio_zone zone;
 
-		r = -EFAULT;
 		if (copy_from_user(&zone, argp, sizeof(zone)))
-			goto out;
+			return -EFAULT;
 		r = kvm_vm_ioctl_register_coalesced_mmio(kvm, &zone);
 		break;
 	}
 	case KVM_UNREGISTER_COALESCED_MMIO: {
 		struct kvm_coalesced_mmio_zone zone;
 
-		r = -EFAULT;
 		if (copy_from_user(&zone, argp, sizeof(zone)))
-			goto out;
+			return -EFAULT;
 		r = kvm_vm_ioctl_unregister_coalesced_mmio(kvm, &zone);
 		break;
 	}
@@ -3000,18 +2995,16 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_IRQFD: {
 		struct kvm_irqfd data;
 
-		r = -EFAULT;
 		if (copy_from_user(&data, argp, sizeof(data)))
-			goto out;
+			return -EFAULT;
 		r = kvm_irqfd(kvm, &data);
 		break;
 	}
 	case KVM_IOEVENTFD: {
 		struct kvm_ioeventfd data;
 
-		r = -EFAULT;
 		if (copy_from_user(&data, argp, sizeof(data)))
-			goto out;
+			return -EFAULT;
 		r = kvm_ioeventfd(kvm, &data);
 		break;
 	}
@@ -3019,9 +3012,8 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_SIGNAL_MSI: {
 		struct kvm_msi msi;
 
-		r = -EFAULT;
 		if (copy_from_user(&msi, argp, sizeof(msi)))
-			goto out;
+			return -EFAULT;
 		r = kvm_send_userspace_msi(kvm, &msi);
 		break;
 	}
@@ -3031,22 +3023,17 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_IRQ_LINE: {
 		struct kvm_irq_level irq_event;
 
-		r = -EFAULT;
 		if (copy_from_user(&irq_event, argp, sizeof(irq_event)))
-			goto out;
+			return -EFAULT;
 
 		r = kvm_vm_ioctl_irq_line(kvm, &irq_event,
 					ioctl = KVM_IRQ_LINE_STATUS);
 		if (r)
-			goto out;
-
-		r = -EFAULT;
-		if (ioctl = KVM_IRQ_LINE_STATUS) {
-			if (copy_to_user(argp, &irq_event, sizeof(irq_event)))
-				goto out;
-		}
+			return r;
 
-		r = 0;
+		if (ioctl = KVM_IRQ_LINE_STATUS &&
+		    copy_to_user(argp, &irq_event, sizeof(irq_event)))
+			return -EFAULT;
 		break;
 	}
 #endif
@@ -3056,24 +3043,20 @@ static long kvm_vm_ioctl(struct file *filp,
 		struct kvm_irq_routing __user *urouting;
 		struct kvm_irq_routing_entry *entries = NULL;
 
-		r = -EFAULT;
 		if (copy_from_user(&routing, argp, sizeof(routing)))
-			goto out;
-		r = -EINVAL;
-		if (routing.nr > KVM_MAX_IRQ_ROUTES)
-			goto out;
-		if (routing.flags)
-			goto out;
+			return -EFAULT;
+		if (routing.nr > KVM_MAX_IRQ_ROUTES || routing.flags)
+			return -EINVAL;
 		if (routing.nr) {
-			r = -ENOMEM;
 			entries = vmalloc(routing.nr * sizeof(*entries));
 			if (!entries)
-				goto out;
-			r = -EFAULT;
+				return -ENOMEM;
 			urouting = argp;
 			if (copy_from_user(entries, urouting->entries,
-					   routing.nr * sizeof(*entries)))
+					   routing.nr * sizeof(*entries))) {
+				r = -EFAULT;
 				goto out_free_irq_routing;
+			}
 		}
 		r = kvm_set_irq_routing(kvm, entries, routing.nr,
 					routing.flags);
@@ -3085,19 +3068,15 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_CREATE_DEVICE: {
 		struct kvm_create_device cd;
 
-		r = -EFAULT;
 		if (copy_from_user(&cd, argp, sizeof(cd)))
-			goto out;
+			return -EFAULT;
 
 		r = kvm_ioctl_create_device(kvm, &cd);
 		if (r)
-			goto out;
+			return r;
 
-		r = -EFAULT;
 		if (copy_to_user(argp, &cd, sizeof(cd)))
-			goto out;
-
-		r = 0;
+			return -EFAULT;
 		break;
 	}
 	case KVM_CHECK_EXTENSION:
@@ -3106,7 +3085,6 @@ static long kvm_vm_ioctl(struct file *filp,
 	default:
 		r = kvm_arch_vm_ioctl(filp, ioctl, arg);
 	}
-out:
 	return r;
 }
 
-- 
2.11.0

