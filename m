From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Aug 2018 16:10:46 +0000
Subject: [PATCH] x86/xen: remove redundant variable save_pud
Message-Id: <20180828161046.17165-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable save_pud is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
variable 'save_pud' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/xen/mmu_pv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 06a814d44b9b..2fe5c9b1816b 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2060,7 +2060,6 @@ void __init xen_relocate_p2m(void)
 	pud_t *pud;
 	pgd_t *pgd;
 	unsigned long *new_p2m;
-	int save_pud;
 
 	size = PAGE_ALIGN(xen_start_info->nr_pages * sizeof(unsigned long));
 	n_pte = roundup(size, PAGE_SIZE) >> PAGE_SHIFT;
@@ -2090,7 +2089,6 @@ void __init xen_relocate_p2m(void)
 
 	pgd = __va(read_cr3_pa());
 	new_p2m = (unsigned long *)(2 * PGDIR_SIZE);
-	save_pud = n_pud;
 	for (idx_pud = 0; idx_pud < n_pud; idx_pud++) {
 		pud = early_memremap(pud_phys, PAGE_SIZE);
 		clear_page(pud);
-- 
2.17.1
