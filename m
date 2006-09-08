From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:01:46 +0000
Subject: [KJ] [PATCH 48/72] arm: add KERN_ constants to
Message-Id: <20060908020146.10114.21594.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/time.c b/arch/arm/mach-s3c2410/time.c
index 00d1cfc..0283209 100644
--- a/arch/arm/mach-s3c2410/time.c
+++ b/arch/arm/mach-s3c2410/time.c
@@ -218,7 +218,7 @@ static void s3c2410_timer_setup (void)
 
 	tcnt--;
 
-	printk("timer tcon=%08lx, tcnt %04lx, tcfg %08lx,%08lx, usec %08lx\n",
+	pr_info("timer tcon=%08lx, tcnt %04lx, tcfg %08lx,%08lx, usec %08lx\n",
 	       tcon, tcnt, tcfg0, tcfg1, timer_usec_ticks);
 
 	/* check to see if timer is within 16bit range... */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
