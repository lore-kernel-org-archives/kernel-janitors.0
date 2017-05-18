From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 May 2017 07:39:53 +0000
Subject: [PATCH 2/2] KVM: Tidy the whitespace in nested_svm_check_permissions()
Message-Id: <20170518073953.uz6ix4azwlgvfa3k@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170518073853.b3dkw2zibj7ayvwh@mwanda>
In-Reply-To: <20170518073853.b3dkw2zibj7ayvwh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

I moved the || to the line before.  Also I replaced some spaces with a
tab on the "return 0;" line.  It looks OK in the diff but originally
that line was only indented 7 spaces.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
index c27ac6923a18..226954f8106f 100644
--- a/arch/x86/kvm/svm.c
+++ b/arch/x86/kvm/svm.c
@@ -2370,8 +2371,8 @@ static void nested_svm_uninit_mmu_context(struct kvm_vcpu *vcpu)
 
 static int nested_svm_check_permissions(struct vcpu_svm *svm)
 {
-	if (!(svm->vcpu.arch.efer & EFER_SVME)
-	    || !is_paging(&svm->vcpu)) {
+	if (!(svm->vcpu.arch.efer & EFER_SVME) ||
+	    !is_paging(&svm->vcpu)) {
 		kvm_queue_exception(&svm->vcpu, UD_VECTOR);
 		return 1;
 	}
@@ -2381,7 +2382,7 @@ static int nested_svm_check_permissions(struct vcpu_svm *svm)
 		return 1;
 	}
 
-       return 0;
+	return 0;
 }
 
 static int nested_svm_check_exception(struct vcpu_svm *svm, unsigned nr,
