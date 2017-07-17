From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Jul 2017 08:14:26 +0000
Subject: [PATCH] KVM: x86: masking out upper bits
Message-Id: <20170717081426.ma6b2w37zuowbu7o@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

kvm_read_cr3() returns an unsigned long and gfn is a u64.  We intended
to mask out the bottom 5 bits but because of the type issue we mask the
top 32 bits as well.  I don't know if this is a real problem, but it
causes static checker warnings.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ca128a9c9cc4..476b7f4e0e1f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -594,8 +594,8 @@ bool pdptrs_changed(struct kvm_vcpu *vcpu)
 		      (unsigned long *)&vcpu->arch.regs_avail))
 		return true;
 
-	gfn = (kvm_read_cr3(vcpu) & ~31u) >> PAGE_SHIFT;
-	offset = (kvm_read_cr3(vcpu) & ~31u) & (PAGE_SIZE - 1);
+	gfn = (kvm_read_cr3(vcpu) & ~31ul) >> PAGE_SHIFT;
+	offset = (kvm_read_cr3(vcpu) & ~31ul) & (PAGE_SIZE - 1);
 	r = kvm_read_nested_guest_page(vcpu, gfn, pdpte, offset, sizeof(pdpte),
 				       PFERR_USER_MASK | PFERR_WRITE_MASK);
 	if (r < 0)
