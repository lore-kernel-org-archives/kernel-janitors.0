From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:59:40 +0000
Subject: [KJ] [PATCH 29/72] arm: add KERN_ constants to
Message-Id: <20060908015940.10114.68561.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-pxa/idp.c b/arch/arm/mach-pxa/idp.c
index 6914d22..57db4dc 100644
--- a/arch/arm/mach-pxa/idp.c
+++ b/arch/arm/mach-pxa/idp.c
@@ -136,7 +136,7 @@ static struct pxamci_platform_data idp_m
 
 static void __init idp_init(void)
 {
-	printk("idp_init()\n");
+	pr_info("idp_init()\n");
 
 	platform_device_register(&smc91x_device);
 	//platform_device_register(&mst_audio_device);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
