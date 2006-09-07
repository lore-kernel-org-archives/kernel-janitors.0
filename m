From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 22:25:30 +0000
Subject: [KJ] [PATCH 3/3] alpha: add KERN_ constants to arch/alpha/mm/remap.c
Message-Id: <20060907222529.9459.54096.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/mm/remap.c b/arch/alpha/mm/remap.c
index a78356c..c1d6b80 100644
--- a/arch/alpha/mm/remap.c
+++ b/arch/alpha/mm/remap.c
@@ -18,7 +18,7 @@ remap_area_pte(pte_t * pte, unsigned lon
 	pfn = phys_addr >> PAGE_SHIFT;
 	do {
 		if (!pte_none(*pte)) {
-			printk("remap_area_pte: page already exists\n");
+			printk(KERN_CRIT "remap_area_pte: page already exists\n");
 			BUG();
 		}
 		set_pte(pte, pfn_pte(pfn, 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
