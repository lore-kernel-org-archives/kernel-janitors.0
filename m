From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Apr 2019 10:15:08 +0000
Subject: [PATCH] KVM: vmx: clean up some debug output
Message-Id: <20190424101508.GA23656@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains about this:

    arch/x86/kvm/vmx/vmx.c:5730 dump_vmcs()
    warn: KERN_* level not at start of string

The code should be using pr_cont() instead of pr_err().

Fixes: 9d609649bb29 ("KVM: vmx: print more APICv fields in dump_vmcs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 arch/x86/kvm/vmx/vmx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 574250e566d3..1e677d95a92c 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5727,10 +5727,10 @@ void dump_vmcs(void)
 			u16 status = vmcs_read16(GUEST_INTR_STATUS);
 			pr_err("SVI|RVI = %02x|%02x ", status >> 8, status & 0xff);
 		}
-		pr_err(KERN_CONT "TPR Threshold = 0x%02x\n", vmcs_read32(TPR_THRESHOLD));
+		pr_cont("TPR Threshold = 0x%02x\n", vmcs_read32(TPR_THRESHOLD));
 		if (secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
 			pr_err("APIC-access addr = 0x%016llx ", vmcs_read64(APIC_ACCESS_ADDR));
-		pr_err(KERN_CONT "virt-APIC addr = 0x%016llx\n", vmcs_read64(VIRTUAL_APIC_PAGE_ADDR));
+		pr_cont("virt-APIC addr = 0x%016llx\n", vmcs_read64(VIRTUAL_APIC_PAGE_ADDR));
 	}
 	if (pin_based_exec_ctrl & PIN_BASED_POSTED_INTR)
 		pr_err("PostedIntrVec = 0x%02x\n", vmcs_read16(POSTED_INTR_NV));
-- 
2.18.0
