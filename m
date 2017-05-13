From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 13 May 2017 11:40:05 +0000
Subject: [PATCH 1/2] ARM: davinci: PM: Free resources in error handling path in 'davinci_pm_init'
Message-Id: <20170513114005.23617-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

If 'sram_alloc' fails, we need to free already allocated resources.

Fixes: aa9aa1ec2df6 ("ARM: davinci: PM: rework init, remove platform device")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm/mach-davinci/pm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-davinci/pm.c b/arch/arm/mach-davinci/pm.c
index efb80354f303..d282b0783ecf 100644
--- a/arch/arm/mach-davinci/pm.c
+++ b/arch/arm/mach-davinci/pm.c
@@ -153,7 +153,8 @@ int __init davinci_pm_init(void)
 	davinci_sram_suspend = sram_alloc(davinci_cpu_suspend_sz, NULL);
 	if (!davinci_sram_suspend) {
 		pr_err("PM: cannot allocate SRAM memory\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto no_sram_mem;
 	}
 
 	davinci_sram_push(davinci_sram_suspend, davinci_cpu_suspend,
@@ -161,6 +162,8 @@ int __init davinci_pm_init(void)
 
 	suspend_set_ops(&davinci_pm_ops);
 
+no_sram_mem:
+	iounmap(pm_config.ddrpsc_reg_base);
 no_ddrpsc_mem:
 	iounmap(pm_config.ddrpll_reg_base);
 no_ddrpll_mem:
-- 
2.11.0

