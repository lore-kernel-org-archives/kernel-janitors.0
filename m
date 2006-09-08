From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:03:14 +0000
Subject: [KJ] [PATCH 61/72] arm: add KERN_ constants to arch/arm/mm/mm-armv.c
Message-Id: <20060908020314.10114.69711.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mm/mm-armv.c b/arch/arm/mm/mm-armv.c
index 38769f5..12d20e5 100644
--- a/arch/arm/mm/mm-armv.c
+++ b/arch/arm/mm/mm-armv.c
@@ -485,7 +485,7 @@ #endif
 		mem_types[MT_CACHECLEAN].prot_sect |= PMD_SECT_WB;
 		break;
 	}
-	printk("Memory policy: ECC %sabled, Data cache %s\n",
+	pr_info("Memory policy: ECC %sabled, Data cache %s\n",
 		ecc_mask ? "en" : "dis", cp->policy);
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
