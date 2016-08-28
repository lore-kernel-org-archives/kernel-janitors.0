From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Aug 2016 17:18:07 +0000
Subject: [PATCH 5/6] KVM: PPC: e500: Use kmalloc_array() in kvmppc_e500_tlb_init()
Message-Id: <fd0f443b-eba8-bd99-83dd-476104f2dac0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <c3fd4483-38d2-af0f-0e19-a7e57e120c5b@users.sourceforge.net>
In-Reply-To: <c3fd4483-38d2-af0f-0e19-a7e57e120c5b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, Paul Mackerras <paulus@samba.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Aug 2016 18:40:08 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/e500_mmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu.c b/arch/powerpc/kvm/e500_mmu.c
index 2be2afc4..0a2eeb1 100644
--- a/arch/powerpc/kvm/e500_mmu.c
+++ b/arch/powerpc/kvm/e500_mmu.c
@@ -905,8 +905,6 @@ static int vcpu_mmu_init(struct kvm_vcpu *vcpu,
 int kvmppc_e500_tlb_init(struct kvmppc_vcpu_e500 *vcpu_e500)
 {
 	struct kvm_vcpu *vcpu = &vcpu_e500->vcpu;
-	int entry_size = sizeof(struct kvm_book3e_206_tlb_entry);
-	int entries = KVM_E500_TLB0_SIZE + KVM_E500_TLB1_SIZE;
 
 	if (e500_mmu_host_init(vcpu_e500))
 		goto err;
@@ -921,7 +919,10 @@ int kvmppc_e500_tlb_init(struct kvmppc_vcpu_e500 *vcpu_e500)
 	vcpu_e500->gtlb_params[1].ways = KVM_E500_TLB1_SIZE;
 	vcpu_e500->gtlb_params[1].sets = 1;
 
-	vcpu_e500->gtlb_arch = kmalloc(entries * entry_size, GFP_KERNEL);
+	vcpu_e500->gtlb_arch = kmalloc_array(KVM_E500_TLB0_SIZE +
+					     KVM_E500_TLB1_SIZE,
+					     sizeof(*vcpu_e500->gtlb_arch),
+					     GFP_KERNEL);
 	if (!vcpu_e500->gtlb_arch)
 		return -ENOMEM;
 
-- 
2.9.3

