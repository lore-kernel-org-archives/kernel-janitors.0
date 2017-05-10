From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 May 2017 19:43:17 +0000
Subject: [PATCH] kvm: nVMX: off by one in vmx_write_pml_buffer()
Message-Id: <20170510194317.uh72h3ez7hnvn62v@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

There are PML_ENTITY_NUM elements in the pml_address[] array so the >
should be >= or we write beyond the end of the array when we do:

	pml_address[vmcs12->guest_pml_index--] = gpa;

Fixes: c5f983f6e845 ("nVMX: Implement emulated Page Modification Logging")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
index c6f4ad44aa95..7698e8f321bf 100644
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@ -11213,7 +11213,7 @@ static int vmx_write_pml_buffer(struct kvm_vcpu *vcpu)
 		if (!nested_cpu_has_pml(vmcs12))
 			return 0;
 
-		if (vmcs12->guest_pml_index > PML_ENTITY_NUM) {
+		if (vmcs12->guest_pml_index >= PML_ENTITY_NUM) {
 			vmx->nested.pml_full = true;
 			return 1;
 		}
