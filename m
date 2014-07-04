From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 04 Jul 2014 17:07:03 +0000
Subject: [PATCH] MIPS: Fix incorrect NULL check in local_flush_tlb_page()
Message-Id: <1404493623-22705-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, John Crispin <blogic@openwrt.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

We check that the struct vm_area_struct pointer vma is NULL and
then dereference it. The intent must have been to check that
vma is not NULL before we dereference it in the next condition.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 arch/mips/mm/tlb-r3k.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
index d657493..6546758 100644
--- a/arch/mips/mm/tlb-r3k.c
+++ b/arch/mips/mm/tlb-r3k.c
@@ -158,7 +158,7 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 {
 	int cpu = smp_processor_id();
 
-	if (!vma || cpu_context(cpu, vma->vm_mm) != 0) {
+	if (vma && cpu_context(cpu, vma->vm_mm) != 0) {
 		unsigned long flags;
 		int oldpid, newpid, idx;
 
-- 
1.7.10.4

