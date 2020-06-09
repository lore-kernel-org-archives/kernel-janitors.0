From: Colin King <colin.king@canonical.com>
Date: Tue, 09 Jun 2020 23:31:21 +0000
Subject: [PATCH] kvm: i8254: remove redundant assignment to pointer s
Message-Id: <20200609233121.1118683-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <sean.j.christopherson@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer s is being assigned a value that is never read, the
assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kvm/i8254.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index febca334c320..a6e218c6140d 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -462,7 +462,6 @@ static int pit_ioport_write(struct kvm_vcpu *vcpu,
 		if (channel = 3) {
 			/* Read-Back Command. */
 			for (channel = 0; channel < 3; channel++) {
-				s = &pit_state->channels[channel];
 				if (val & (2 << channel)) {
 					if (!(val & 0x20))
 						pit_latch_count(pit, channel);
-- 
2.27.0.rc0
