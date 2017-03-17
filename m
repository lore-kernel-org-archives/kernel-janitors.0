From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Mar 2017 20:41:14 +0000
Subject: [patch] KVM: PPC: Book3S HV: check for kmalloc errors in ioctl
Message-Id: <20170317204113.GA16505@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, kernel-janitors@vger.kernel.org, kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>

kzalloc() won't actually fail because sizeof(*resize) is small, but
static checkers complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 8c68145ba1bd..710e491206ed 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -1487,6 +1487,10 @@ long kvm_vm_ioctl_resize_hpt_prepare(struct kvm *kvm,
 	/* start new resize */
 
 	resize = kzalloc(sizeof(*resize), GFP_KERNEL);
+	if (!resize) {
+		ret = -ENOMEM;
+		goto out;
+	}
 	resize->order = shift;
 	resize->kvm = kvm;
 	INIT_WORK(&resize->work, resize_hpt_prepare_work);
