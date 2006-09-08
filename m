From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:58:45 +0000
Subject: [KJ] [PATCH 21/72] arm: add KERN_ constants to
Message-Id: <20060908015845.10114.89871.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index f1958e8..ee418fe 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -713,7 +713,7 @@ #elif defined(CONFIG_ARCH_OMAP16XX)
 		ck_ref.rate = 19200000;
 #endif
 
-	printk("Clocks: ARM_SYSST: 0x%04x DPLL_CTL: 0x%04x ARM_CKCTL: 0x%04x\n",
+	pr_info("Clocks: ARM_SYSST: 0x%04x DPLL_CTL: 0x%04x ARM_CKCTL: 0x%04x\n",
 	       omap_readw(ARM_SYSST), omap_readw(DPLL_CTL),
 	       omap_readw(ARM_CKCTL));
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
