From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 18:20:50 +0000
Subject: [PATCH 02/11] KVM: PPC: Book3S HV: Improve a size determination in kvmppc_alloc_hpt()
Message-Id: <755544bd-b29c-f240-d526-8a8aec6d620a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
In-Reply-To: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 10:00:13 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index dc34729e4ad0..4655f27e0518 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -91,7 +91,7 @@ long kvmppc_alloc_hpt(struct kvm *kvm, u32 *htab_orderp)
 	atomic64_set(&kvm->arch.mmio_update, 0);
 
 	/* Allocate reverse map array */
-	rev = vmalloc(sizeof(struct revmap_entry) * kvm->arch.hpt_npte);
+	rev = vmalloc(sizeof(*rev) * kvm->arch.hpt_npte);
 	if (!rev) {
 		pr_err("kvmppc_alloc_hpt: Couldn't alloc reverse map array\n");
 		goto out_freehpt;
-- 
2.11.0

