From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:58:04 +0000
Subject: [KJ] [PATCH 15/72] arm: add KERN_ constants to
Message-Id: <20060908015804.10114.71119.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-netx/generic.c b/arch/arm/mach-netx/generic.c
index af0b135..4a020ea 100644
--- a/arch/arm/mach-netx/generic.c
+++ b/arch/arm/mach-netx/generic.c
@@ -62,11 +62,7 @@ static struct platform_device *devices[]
 	&netx_rtc_device,
 };
 
-#if 0
-#define DEBUG_IRQ(fmt...)	printk(fmt)
-#else
-#define DEBUG_IRQ(fmt...)	while (0) {}
-#endif
+#define DEBUG_IRQ(fmt, args...)	pr_debug("%s: " fmt, __FUNCTION__, ## args)
 
 static void
 netx_hif_demux_handler(unsigned int irq_unused, struct irqdesc *desc,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
