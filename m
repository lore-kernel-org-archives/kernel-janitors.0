From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Feb 2014 12:34:19 +0000
Subject: [patch RFC] kvm, cpuid: silence a buffer overflow warning
Message-Id: <20140220123419.GA10110@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gleb Natapov <gleb@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

This seems like a harmless off by one overflow if "i" is the last
element in the vcpu->arch.cpuid_entries[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.  I always wonder if it's worth fixing these or if it's worth
reporting them?  Either of those seem like a lot of work for something
harmless.

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index c6976257eff5..7d02c0fc768c 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -660,7 +660,7 @@ static int move_to_next_stateful_cpuid_entry(struct kvm_vcpu *vcpu, int i)
 
 	e->flags &= ~KVM_CPUID_FLAG_STATE_READ_NEXT;
 	/* when no next entry is found, the current entry[i] is reselected */
-	for (j = i + 1; ; j = (j + 1) % nent) {
+	for (j = (i + 1) % nent; ; j = (j + 1) % nent) {
 		struct kvm_cpuid_entry2 *ej = &vcpu->arch.cpuid_entries[j];
 		if (ej->function = e->function) {
 			ej->flags |= KVM_CPUID_FLAG_STATE_READ_NEXT;
