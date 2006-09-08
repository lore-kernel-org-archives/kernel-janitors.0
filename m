From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:59:53 +0000
Subject: [KJ] [PATCH 31/72] arm: add KERN_ constants to
Message-Id: <20060908015953.10114.51851.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-realview/hotplug.c b/arch/arm/mach-realview/hotplug.c
index 09748cb..e451a9e 100644
--- a/arch/arm/mach-realview/hotplug.c
+++ b/arch/arm/mach-realview/hotplug.c
@@ -84,9 +84,7 @@ static inline void platform_do_lowpower(
 		 * possible, since we are currently running incoherently, and
 		 * therefore cannot safely call printk() or anything else
 		 */
-#ifdef DEBUG
-		printk("CPU%u: spurious wakeup call\n", cpu);
-#endif
+		pr_debug("CPU%u: spurious wakeup call\n", cpu);
 	}
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
