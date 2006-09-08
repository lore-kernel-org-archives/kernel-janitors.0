From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:04:10 +0000
Subject: [KJ] [PATCH 69/72] arm: add KERN_ constants to
Message-Id: <20060908020410.10114.29586.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/plat-omap/mux.c b/arch/arm/plat-omap/mux.c
index 042105a..a1b8144 100644
--- a/arch/arm/plat-omap/mux.c
+++ b/arch/arm/plat-omap/mux.c
@@ -84,7 +84,7 @@ int __init_or_module omap_cfg_reg(const 
 		if(cfg->pu_pd_val)
 			reg |= OMAP24XX_PULL_UP;
 #ifdef CONFIG_OMAP_MUX_DEBUG
-		printk("Muxing %s (0x%08x): 0x%02x -> 0x%02x\n",
+		pr_info("Muxing %s (0x%08x): 0x%02x -> 0x%02x\n",
 		       cfg->name, OMAP24XX_L4_BASE + cfg->mux_reg,
 		       omap_readb(OMAP24XX_L4_BASE + cfg->mux_reg), reg);
 #endif
@@ -168,20 +168,20 @@ #endif
 
 #ifdef CONFIG_OMAP_MUX_DEBUG
 	if (cfg->debug || warn) {
-		printk("MUX: Setting register %s\n", cfg->name);
-		printk("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
+		pr_info("MUX: Setting register %s\n", cfg->name);
+		pr_info("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
 		       cfg->mux_reg_name, cfg->mux_reg, reg_orig, reg);
 
 		if (!cpu_is_omap1510()) {
 			if (cfg->pu_pd_reg && cfg->pull_val) {
-				printk("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
+				pr_info("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
 				       cfg->pu_pd_name, cfg->pu_pd_reg,
 				       pu_pd_orig, pu_pd);
 			}
 		}
 
 		if (cfg->pull_reg)
-			printk("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
+			pr_info("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
 			       cfg->pull_name, cfg->pull_reg, pull_orig, pull);
 	}
 #endif
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
