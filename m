From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 04 Sep 2019 09:12:33 +0000
Subject: [PATCH] KVM: PPC: Book3S HV: Delete an unnecessary check before kfree() in __kvmhv_nested_page_fault
Message-Id: <238d3e33-5222-3829-742a-ced4e71a56cd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@ozlabs.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Sep 2019 11:00:20 +0200

The kfree() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 735e0ac6f5b2..36d21090a713 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1416,8 +1416,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_run *run,
 	rmapp = &memslot->arch.rmap[gfn - memslot->base_gfn];
 	ret = kvmppc_create_pte(kvm, gp->shadow_pgtable, pte, n_gpa, level,
 				mmu_seq, gp->shadow_lpid, rmapp, &n_rmap);
-	if (n_rmap)
-		kfree(n_rmap);
+	kfree(n_rmap);
 	if (ret == -EAGAIN)
 		ret = RESUME_GUEST;	/* Let the guest try again */

--
2.23.0
