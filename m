From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:03:01 +0000
Subject: [KJ] [PATCH 59/72] arm: add KERN_ constants to arch/arm/mm/init.c
Message-Id: <20060908020301.10114.52602.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index fe3f7f6..b17a60a 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -49,9 +49,9 @@ void show_mem(void)
 	int free = 0, total = 0, reserved = 0;
 	int shared = 0, cached = 0, slab = 0, node;
 
-	printk("Mem-info:\n");
+	pr_info("Mem-info:\n");
 	show_free_areas();
-	printk("Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
+	pr_info("Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
 
 	for_each_online_node(node) {
 		struct page *page, *end;
@@ -75,12 +75,12 @@ void show_mem(void)
 		} while (page < end);
 	}
 
-	printk("%d pages of RAM\n", total);
-	printk("%d free pages\n", free);
-	printk("%d reserved pages\n", reserved);
-	printk("%d slab pages\n", slab);
-	printk("%d pages shared\n", shared);
-	printk("%d pages swap cached\n", cached);
+	pr_info("%d pages of RAM\n", total);
+	pr_info("%d free pages\n", free);
+	pr_info("%d reserved pages\n", reserved);
+	pr_info("%d slab pages\n", slab);
+	pr_info("%d pages shared\n", shared);
+	pr_info("%d pages swap cached\n", cached);
 }
 
 static inline pmd_t *pmd_off(pgd_t *pgd, unsigned long virt)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
