From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:01:00 +0000
Subject: [KJ] [PATCH 41/72] arm: add KERN_ constants to
Message-Id: <20060908020100.10114.62388.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/s3c2412-clock.c b/arch/arm/mach-s3c2410/s3c2412-clock.c
index c95ed3e..bd72824 100644
--- a/arch/arm/mach-s3c2410/s3c2412-clock.c
+++ b/arch/arm/mach-s3c2410/s3c2412-clock.c
@@ -663,7 +663,7 @@ int __init s3c2412_baseclk_add(void)
 		clk_set_rate(&clk_usbsrc, 48*1000*1000);
 	}
 
-	printk("S3C2412: upll %s, %ld.%03ld MHz, usb-bus %ld.%03ld MHz\n",
+	pr_info("S3C2412: upll %s, %ld.%03ld MHz, usb-bus %ld.%03ld MHz\n",
 	       (__raw_readl(S3C2410_UPLLCON) & S3C2412_PLLCON_OFF) ? "off":"on",
 	       print_mhz(clk_get_rate(&clk_upll)),
 	       print_mhz(clk_get_rate(&clk_usb_bus)));
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
