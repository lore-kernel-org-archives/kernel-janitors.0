From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 May 2017 07:41:15 +0000
Subject: [PATCH] KVM: white space cleanup in nested_vmx_setup_ctls_msrs()
Message-Id: <20170518074115.3ynex63pnqirbtob@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

This should have been indented one more character over and it should use
tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
index c6f4ad44aa95..400de33b0e9d 100644
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@ -2769,7 +2769,7 @@ static void nested_vmx_setup_ctls_msrs(struct vcpu_vmx *vmx)
 		if (enable_ept_ad_bits) {
 			vmx->nested.nested_vmx_secondary_ctls_high | 				SECONDARY_EXEC_ENABLE_PML;
-		       vmx->nested.nested_vmx_ept_caps |= VMX_EPT_AD_BIT;
+			vmx->nested.nested_vmx_ept_caps |= VMX_EPT_AD_BIT;
 		}
 	} else
 		vmx->nested.nested_vmx_ept_caps = 0;
