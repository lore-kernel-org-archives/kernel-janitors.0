From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Wed, 07 Mar 2007 23:18:20 +0000
Subject: [KJ] [PATCH 2.6.21-rc3] i386: Fix GDT's number of quadwords in
Message-Id: <20070307231819.GC1949@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi list,

Fix comments to represent the true number of quadwords in GDT.

Signed-off-by: Ahmed S. Darwish <darwish.07@gmail.com>
---

diff --git a/arch/i386/kernel/head.S b/arch/i386/kernel/head.S
index 3fa7f93..cb185f4 100644
--- a/arch/i386/kernel/head.S
+++ b/arch/i386/kernel/head.S
@@ -612,7 +612,7 @@ ENTRY(boot_gdt_table)
 	.quad 0x00cf92000000ffff	/* kernel 4GB data at 0x00000000 */
 
 /*
- * The Global Descriptor Table contains 28 quadwords, per-CPU.
+ * The Global Descriptor Table contains 32 quadwords, per-CPU.
  */
 	.align L1_CACHE_BYTES
 ENTRY(cpu_gdt_table)
@@ -639,7 +639,7 @@ ENTRY(cpu_gdt_table)
 
 	/*
 	 * Segments used for calling PnP BIOS have byte granularity.
-	 * They code segments and data segments have fixed 64k limits,
+	 * The code segments and data segments have fixed 64k limits,
 	 * the transfer segment sizes are set at run time.
 	 */
 	.quad 0x00409a000000ffff	/* 0x90 32-bit code */


-- 
Ahmed S. Darwish
http://darwish.07.googlepages.com

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
