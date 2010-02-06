From: Julia Lawall <julia@diku.dk>
Date: Sat, 06 Feb 2010 08:43:03 +0000
Subject: [PATCH 4/11] arch/x86/kvm: Correct NULL test
Message-Id: <Pine.LNX.4.64.1002060942390.8092@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

msr was tested above, so the second test is not needed.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression *x;
expression e;
identifier l;
@@

if (x = NULL || ...) {
    ... when forall
    return ...; }
... when != goto l;
    when != x = e
    when != &x
*x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/x86/kvm/vmx.c                  |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
index 7375ae1..422bfc8 100644
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@ -1609,8 +1609,6 @@ static void vmx_set_efer(struct kvm_vcpu *vcpu, u64 efer)
 	 */
 	vmx_load_host_state(to_vmx(vcpu));
 	vcpu->arch.shadow_efer = efer;
-	if (!msr)
-		return;
 	if (efer & EFER_LMA) {
 		vmcs_write32(VM_ENTRY_CONTROLS,
 			     vmcs_read32(VM_ENTRY_CONTROLS) |
