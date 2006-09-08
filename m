From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:03:07 +0000
Subject: [KJ] [PATCH 60/72] arm: add KERN_ constants to arch/arm/mm/ioremap.c
Message-Id: <20060908020307.10114.64355.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 88a999d..7b3d951 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -61,7 +61,7 @@ remap_area_pte(pte_t * pte, unsigned lon
 	return;
 
  bad:
-	printk("remap_area_pte: page already exists\n");
+	printk(KERN_CRIT "remap_area_pte: page already exists\n");
 	BUG();
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
