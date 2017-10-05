From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Oct 2017 11:23:30 +0000
Subject: [PATCH] KVM: PPC: Book3S HV: Delete an error message for a failed memory allocation in kvmppc_alloca
Message-Id: <124a92d4-7d49-0769-ae0e-c4ab007ae146@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Oct 2017 13:16:51 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 7c62967d672c..7df89d58ee91 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -106,7 +106,6 @@ int kvmppc_allocate_hpt(struct kvm_hpt_info *info, u32 order)
 	/* Allocate reverse map array */
 	rev = vmalloc(sizeof(struct revmap_entry) * npte);
 	if (!rev) {
-		pr_err("kvmppc_allocate_hpt: Couldn't alloc reverse map array\n");
 		if (cma)
 			kvm_free_hpt_cma(page, 1 << (order - PAGE_SHIFT));
 		else
-- 
2.14.2

