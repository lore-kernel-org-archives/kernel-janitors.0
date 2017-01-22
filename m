From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:13:30 +0000
Subject: [PATCH 3/9] KVM: Move error code settings in kvm_vcpu_compat_ioctl()
Message-Id: <0fa315b6-2fc7-3833-32eb-4e58671ac776@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
In-Reply-To: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 13:57:40 +0100

* A local variable was set to an error code before a concrete error
  situation was detected. Thus move the corresponding settings
  into if branches to indicate a software failure there.

  This issue was detected by using the Coccinelle software.

* Return directly after a call of the function "copy_from_user"
  (or an other check) failed in a case block.

* Delete the jump label "out" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 virt/kvm/kvm_main.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2773e5012948..62f24d8eaaa2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2743,17 +2743,14 @@ static long kvm_vcpu_compat_ioctl(struct file *filp,
 		sigset_t sigset;
 
 		if (argp) {
-			r = -EFAULT;
 			if (copy_from_user(&kvm_sigmask, argp,
 					   sizeof(kvm_sigmask)))
-				goto out;
-			r = -EINVAL;
+				return -EFAULT;
 			if (kvm_sigmask.len != sizeof(csigset))
-				goto out;
-			r = -EFAULT;
+				return -EINVAL;
 			if (copy_from_user(&csigset, sigmask_arg->sigset,
 					   sizeof(csigset)))
-				goto out;
+				return -EFAULT;
 			sigset_from_compat(&sigset, &csigset);
 			r = kvm_vcpu_ioctl_set_sigmask(vcpu, &sigset);
 		} else
@@ -2763,8 +2760,6 @@ static long kvm_vcpu_compat_ioctl(struct file *filp,
 	default:
 		r = kvm_vcpu_ioctl(filp, ioctl, arg);
 	}
-
-out:
 	return r;
 }
 #endif
-- 
2.11.0

