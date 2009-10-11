From: javier martinez canillas <martinez.javier@gmail.com>
Date: Sun, 11 Oct 2009 06:28:23 +0000
Subject: [PATCH 1/1] kvm/mmu: Resolve compile warning
Message-Id: <1255242503.4326.39.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: avi@redhat.com, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

I got this compile warning with today linux-next:

arch/x86/kvm/mmu.c: In function ‘kvm_set_pte_rmapp’:
arch/x86/kvm/mmu.c:770: warning: cast to pointer from integer of different size
arch/x86/kvm/mmu.c: In function ‘kvm_set_spte_hva’:
arch/x86/kvm/mmu.c:849: warning: cast from pointer to integer of different size

This patch solves the issue:

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 arch/x86/kvm/mmu.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
index 20a2cd1..a0b2610 100644
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@ -767,7 +767,7 @@ static int kvm_set_pte_rmapp(struct kvm *kvm, unsigned long *rmapp, u64 data)
 {
 	int need_flush = 0;
 	u64 *spte, new_spte;
-	pte_t *ptep = (pte_t *)data;
+	pte_t *ptep = (pte_t *)(unsigned long)data;
 	pfn_t new_pfn;
 
 	WARN_ON(pte_huge(*ptep));
@@ -846,7 +846,7 @@ int kvm_unmap_hva(struct kvm *kvm, unsigned long hva)
 
 void kvm_set_spte_hva(struct kvm *kvm, unsigned long hva, pte_t pte)
 {
-	kvm_handle_hva(kvm, hva, (u64)&pte, kvm_set_pte_rmapp);
+	kvm_handle_hva(kvm, hva, (unsigned long)&pte, kvm_set_pte_rmapp);
 }
 
 static int kvm_age_rmapp(struct kvm *kvm, unsigned long *rmapp, u64 data)
-- 
1.6.0.4










