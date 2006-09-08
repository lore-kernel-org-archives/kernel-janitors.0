From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:02:00 +0000
Subject: [KJ] [PATCH 50/72] arm: add KERN_ constants to
Message-Id: <20060908020200.10114.18783.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index be06d66..ef093d3 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -244,7 +244,7 @@ static void __init assabet_init(void)
 		ASSABET_BCR = BCR_value = ASSABET_BCR_DB1111;
 
 #ifndef CONFIG_ASSABET_NEPONSET
-		printk( "Warning: Neponset detected but full support "
+		pr_info( "Warning: Neponset detected but full support "
 			"hasn't been configured in the kernel\n" );
 #endif
 	}
@@ -309,7 +309,7 @@ fixup_assabet(struct machine_desc *desc,
 	get_assabet_scr();
 
 	if (machine_has_neponset())
-		printk("Neponset expansion board detected\n");
+		pr_info("Neponset expansion board detected\n");
 }
 
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
