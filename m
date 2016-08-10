From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 10 Aug 2016 12:27:24 +0000
Subject: [PATCH] nios2: use of_property_read_bool
Message-Id: <20160810122724.9398-1-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ley Foon Tan <lftan@altera.com>
Cc: nios2-dev@lists.rocketboards.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Use of_property_read_bool instead of open-coding it as fpcu_has. Convert
the members of struct cpuinfo from u32 to bool accordingly as they are
only used as boolean anyhow.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/nios2/include/asm/cpuinfo.h |  8 ++++----
 arch/nios2/kernel/cpuinfo.c      | 15 +++++----------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/arch/nios2/include/asm/cpuinfo.h b/arch/nios2/include/asm/cpuinfo.h
index e88fcae464d9..348bb228fec9 100644
--- a/arch/nios2/include/asm/cpuinfo.h
+++ b/arch/nios2/include/asm/cpuinfo.h
@@ -25,10 +25,10 @@ struct cpuinfo {
 	/* Core CPU configuration */
 	char cpu_impl[12];
 	u32 cpu_clock_freq;
-	u32 mmu;
-	u32 has_div;
-	u32 has_mul;
-	u32 has_mulx;
+	bool mmu;
+	bool has_div;
+	bool has_mul;
+	bool has_mulx;
 
 	/* CPU caches */
 	u32 icache_line_size;
diff --git a/arch/nios2/kernel/cpuinfo.c b/arch/nios2/kernel/cpuinfo.c
index 1d96de0bd4aa..1cccc36877bc 100644
--- a/arch/nios2/kernel/cpuinfo.c
+++ b/arch/nios2/kernel/cpuinfo.c
@@ -41,11 +41,6 @@ static inline u32 fcpu(struct device_node *cpu, const char *n)
 	return val;
 }
 
-static inline u32 fcpu_has(struct device_node *cpu, const char *n)
-{
-	return of_get_property(cpu, n, NULL) ? 1 : 0;
-}
-
 void __init setup_cpuinfo(void)
 {
 	struct device_node *cpu;
@@ -56,7 +51,7 @@ void __init setup_cpuinfo(void)
 	if (!cpu)
 		panic("%s: No CPU found in devicetree!\n", __func__);
 
-	if (!fcpu_has(cpu, "altr,has-initda"))
+	if (!of_property_read_bool(cpu, "altr,has-initda"))
 		panic("initda instruction is unimplemented. Please update your "
 			"hardware system to have more than 4-byte line data "
 			"cache\n");
@@ -69,10 +64,10 @@ void __init setup_cpuinfo(void)
 	else
 		strcpy(cpuinfo.cpu_impl, "<unknown>");
 
-	cpuinfo.has_div = fcpu_has(cpu, "altr,has-div");
-	cpuinfo.has_mul = fcpu_has(cpu, "altr,has-mul");
-	cpuinfo.has_mulx = fcpu_has(cpu, "altr,has-mulx");
-	cpuinfo.mmu = fcpu_has(cpu, "altr,has-mmu");
+	cpuinfo.has_div = of_property_read_bool(cpu, "altr,has-div");
+	cpuinfo.has_mul = of_property_read_bool(cpu, "altr,has-mul");
+	cpuinfo.has_mulx = of_property_read_bool(cpu, "altr,has-mulx");
+	cpuinfo.mmu = of_property_read_bool(cpu, "altr,has-mmu");
 
 	if (IS_ENABLED(CONFIG_NIOS2_HW_DIV_SUPPORT) && !cpuinfo.has_div)
 		err_cpu("DIV");
-- 
2.9.0


