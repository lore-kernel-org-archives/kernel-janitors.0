From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 21 Nov 2017 12:46:35 +0000
Subject: [PATCH] kvm_main: Use common error handling code in kvm_dev_ioctl_create_vm()
Message-Id: <46892736-f9a1-cd30-0968-80c0cf41c3ee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 21 Nov 2017 13:40:17 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 virt/kvm/kvm_main.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 39e4db469f2e..c84341c79955 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3155,21 +3155,18 @@ static int kvm_dev_ioctl_create_vm(unsigned long type)
 		return PTR_ERR(kvm);
 #ifdef CONFIG_KVM_MMIO
 	r = kvm_coalesced_mmio_init(kvm);
-	if (r < 0) {
-		kvm_put_kvm(kvm);
-		return r;
-	}
+	if (r < 0)
+		goto put_kvm;
 #endif
 	r = get_unused_fd_flags(O_CLOEXEC);
-	if (r < 0) {
-		kvm_put_kvm(kvm);
-		return r;
-	}
+	if (r < 0)
+		goto put_kvm;
+
 	file = anon_inode_getfile("kvm-vm", &kvm_vm_fops, kvm, O_RDWR);
 	if (IS_ERR(file)) {
 		put_unused_fd(r);
-		kvm_put_kvm(kvm);
-		return PTR_ERR(file);
+		r = PTR_ERR(file);
+		goto put_kvm;
 	}
 
 	/*
@@ -3187,6 +3184,10 @@ static int kvm_dev_ioctl_create_vm(unsigned long type)
 
 	fd_install(r, file);
 	return r;
+
+put_kvm:
+	kvm_put_kvm(kvm);
+	return r;
 }
 
 static long kvm_dev_ioctl(struct file *filp,
-- 
2.15.0

