From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 23:46:24 +0000
Subject: [KJ] [PATCH 1/2] arm: add KERN_ constants to
Message-Id: <20060907234624.9789.38966.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-at91rm9200/clock.c b/arch/arm/mach-at91rm9200/clock.c
index edc2cc8..20ccef4 100644
--- a/arch/arm/mach-at91rm9200/clock.c
+++ b/arch/arm/mach-at91rm9200/clock.c
@@ -717,7 +717,7 @@ int __init at91_clock_init(unsigned long
 	/* MCK and CPU clock are "always on" */
 	clk_enable(&mck);
 
-	printk("Clocks: CPU %u MHz, master %u MHz, main %u.%03u MHz\n",
+	pr_info("Clocks: CPU %u MHz, master %u MHz, main %u.%03u MHz\n",
 		freq / 1000000, (unsigned) mck.rate_hz / 1000000,
 		(unsigned) main_clock / 1000000,
 		((unsigned) main_clock % 1000000) / 1000);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
