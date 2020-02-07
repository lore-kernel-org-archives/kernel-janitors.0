From: Colin King <colin.king@canonical.com>
Date: Fri, 07 Feb 2020 23:18:13 +0000
Subject: [PATCH][next] KVM: x86: remove redundant WARN_ON check of an unsigned less than zero
Message-Id: <20200207231813.786224-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check cpu->hv_clock.system_time < 0 is redundant since system_time
is a u64 and hence can never be less than zero. Remove it.

Addresses-Coverity: ("Macro compares unsigned to 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kvm/x86.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fbabb2f06273..d4967ac47e68 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2448,7 +2448,6 @@ static int kvm_guest_time_update(struct kvm_vcpu *v)
 	vcpu->hv_clock.tsc_timestamp = tsc_timestamp;
 	vcpu->hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
 	vcpu->last_guest_tsc = tsc_timestamp;
-	WARN_ON(vcpu->hv_clock.system_time < 0);
 
 	/* If the host uses TSC clocksource, then it is stable */
 	pvclock_flags = 0;
-- 
2.24.0
