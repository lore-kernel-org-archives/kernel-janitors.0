From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 May 2016 10:20:10 +0000
Subject: [patch] svm: bitwise vs logical AND typo
Message-Id: <20160523102010.GB10712@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

This was supposed to be a bitwise AND but there is a typo.

Fixes: 18f40c53e10f ('svm: Add VMEXIT handlers for AVIC')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
index 2214214..2eb615e 100644
--- a/arch/x86/kvm/svm.c
+++ b/arch/x86/kvm/svm.c
@@ -3597,7 +3597,7 @@ static int avic_incomplete_ipi_interception(struct vcpu_svm *svm)
 	u32 icrh = svm->vmcb->control.exit_info_1 >> 32;
 	u32 icrl = svm->vmcb->control.exit_info_1;
 	u32 id = svm->vmcb->control.exit_info_2 >> 32;
-	u32 index = svm->vmcb->control.exit_info_2 && 0xFF;
+	u32 index = svm->vmcb->control.exit_info_2 & 0xFF;
 	struct kvm_lapic *apic = svm->vcpu.arch.apic;
 
 	trace_kvm_avic_incomplete_ipi(svm->vcpu.vcpu_id, icrh, icrl, id, index);
