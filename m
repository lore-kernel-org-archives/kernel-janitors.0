From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:59:33 +0000
Subject: [KJ] [PATCH 28/72] arm: add KERN_ constants to
Message-Id: <20060908015933.10114.12531.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-pnx4008/gpio.c b/arch/arm/mach-pnx4008/gpio.c
index e1ce050..3081c7a 100644
--- a/arch/arm/mach-pnx4008/gpio.c
+++ b/arch/arm/mach-pnx4008/gpio.c
@@ -233,7 +233,7 @@ int pnx4008_gpio_write_pin(unsigned shor
 
 	gpio_lock();
 	if (GPIO_ISOUT(pin)) {
-		printk( "writing '%x' to '%x'\n",
+		pr_info( "writing '%x' to '%x'\n",
 				gpio, output ? PIO_OUTP_SET : PIO_OUTP_CLR );
 		ret = gpio_set_bit(output ? PIO_OUTP_SET : PIO_OUTP_CLR, gpio);
 	} else if (GPIO_ISRAM(pin)) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
