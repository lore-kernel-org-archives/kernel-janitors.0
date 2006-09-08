From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:01:53 +0000
Subject: [KJ] [PATCH 49/72] arm: add KERN_ constants to
Message-Id: <20060908020153.10114.28815.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/usb-simtec.c b/arch/arm/mach-s3c2410/usb-simtec.c
index 6b22d8f..302e683 100644
--- a/arch/arm/mach-s3c2410/usb-simtec.c
+++ b/arch/arm/mach-s3c2410/usb-simtec.c
@@ -111,7 +111,7 @@ static struct s3c2410_hcd_info usb_simte
 
 int usb_simtec_init(void)
 {
-	printk("USB Power Control, (c) 2004 Simtec Electronics\n");
+	pr_info("USB Power Control, (c) 2004 Simtec Electronics\n");
 	s3c_device_usb.dev.platform_data = &usb_simtec_info;
 
 	s3c2410_gpio_cfgpin(S3C2410_GPB4, S3C2410_GPB4_OUTP);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
