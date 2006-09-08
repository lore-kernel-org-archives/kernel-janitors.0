From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:02:14 +0000
Subject: [KJ] [PATCH 52/72] arm: add KERN_ constants to
Message-Id: <20060908020214.10114.4120.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-sa1100/cpu-sa1110.c b/arch/arm/mach-sa1100/cpu-sa1110.c
index 6395977..bb7b62b 100644
--- a/arch/arm/mach-sa1100/cpu-sa1110.c
+++ b/arch/arm/mach-sa1100/cpu-sa1110.c
@@ -206,7 +206,7 @@ sdram_update_refresh(u_int cpu_khz, stru
 
 #ifdef DEBUG
 	mdelay(250);
-	printk("new dri value = %d\n", dri);
+	pr_debug("new dri value = %d\n", dri);
 #endif
 
 	sdram_set_refresh(dri);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
