From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:56:50 +0000
Subject: [KJ] [PATCH 04/72] arm: add KERN_ constants to
Message-Id: <20060908015650.10114.12825.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-integrator/clock.c b/arch/arm/mach-integrator/clock.c
index 95a1e26..5c42be8 100644
--- a/arch/arm/mach-integrator/clock.c
+++ b/arch/arm/mach-integrator/clock.c
@@ -83,7 +83,7 @@ int clk_set_rate(struct clk *clk, unsign
 		vco = icst525_khz_to_vco(clk->params, rate / 1000);
 		clk->rate = icst525_khz(clk->params, vco) * 1000;
 
-		printk("Clock %s: setting VCO reg params: S=%d R=%d V=%d\n",
+		pr_info("Clock %s: setting VCO reg params: S=%d R=%d V=%d\n",
 			clk->name, vco.s, vco.r, vco.v);
 
 		clk->setvco(clk, vco);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
