From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:11:48 +0000
Subject: [PATCH 1/9] KVM: Return directly after a failed copy_from_user() in kvm_vm_compat_ioctl()
Message-Id: <45c0ff89-7f60-a58a-3ba7-a938709aaf00@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
In-Reply-To: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 11:30:21 +0100

* Return directly after a call of the function "copy_from_user" failed
  in a case block.

  This issue was detected by using the Coccinelle software.

* Delete the jump label "out" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 virt/kvm/kvm_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de102cae7125..eeb340708d97 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3133,10 +3133,9 @@ static long kvm_vm_compat_ioctl(struct file *filp,
 		struct compat_kvm_dirty_log compat_log;
 		struct kvm_dirty_log log;
 
-		r = -EFAULT;
 		if (copy_from_user(&compat_log, (void __user *)arg,
 				   sizeof(compat_log)))
-			goto out;
+			return -EFAULT;
 		log.slot	 = compat_log.slot;
 		log.padding1	 = compat_log.padding1;
 		log.padding2	 = compat_log.padding2;
@@ -3148,8 +3147,6 @@ static long kvm_vm_compat_ioctl(struct file *filp,
 	default:
 		r = kvm_vm_ioctl(filp, ioctl, arg);
 	}
-
-out:
 	return r;
 }
 #endif
-- 
2.11.0

