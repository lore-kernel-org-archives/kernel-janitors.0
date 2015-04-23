From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 05:34:04 +0000
Subject: [PATCH 14/15] arm: Remove pointless kmalloc() return value cast in kvm mmu.
Message-Id: <1429767245-32453-15-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

No need to cast the void pointer returned by kmalloc() in
arch/arm/kvm/mmu.c::kvm_alloc_stage2_pgd().

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 arch/arm/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kvm/mmu.c b/arch/arm/kvm/mmu.c
index 1d5accb..ce0bce4 100644
--- a/arch/arm/kvm/mmu.c
+++ b/arch/arm/kvm/mmu.c
@@ -691,8 +691,8 @@ int kvm_alloc_stage2_pgd(struct kvm *kvm)
 		 * work.  This is not used by the hardware and we have no
 		 * alignment requirement for this allocation.
 		 */
-		pgd = (pgd_t *)kmalloc(PTRS_PER_S2_PGD * sizeof(pgd_t),
-				       GFP_KERNEL | __GFP_ZERO);
+		pgd = kmalloc(PTRS_PER_S2_PGD * sizeof(pgd_t),
+				GFP_KERNEL | __GFP_ZERO);
 
 		if (!pgd) {
 			kvm_free_hwpgd(hwpgd);
-- 
2.1.0

