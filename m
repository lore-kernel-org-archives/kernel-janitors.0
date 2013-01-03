From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 03 Jan 2013 09:34:53 +0000
Subject: [PATCH 2/2] arch/mips/kernel/cpufreq/loongson2_cpufreq.c: use clk API instead of direct dereferences
Message-Id: <1357209260-15412-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

A struct clk value is intended to be an abstract pointer, so it should be
manipulated using the various API functions.

clk_put is additionally added on the failure paths.

The semantic match that finds the first problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1;
identifier i;
@@

*e = clk_get(...)
 ... when != e = e1
     when any
*e->i
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
I am not able to compile this code.

 arch/mips/kernel/cpufreq/loongson2_cpufreq.c |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/cpufreq/loongson2_cpufreq.c b/arch/mips/kernel/cpufreq/loongson2_cpufreq.c
index e7c98e2..51f5b68 100644
--- a/arch/mips/kernel/cpufreq/loongson2_cpufreq.c
+++ b/arch/mips/kernel/cpufreq/loongson2_cpufreq.c
@@ -107,6 +107,8 @@ static int loongson2_cpufreq_target(struct cpufreq_policy *policy,
 static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
 	int i;
+	unsigned long rate;
+	int ret;
 
 	if (!cpu_online(policy->cpu))
 		return -ENODEV;
@@ -117,15 +119,22 @@ static int loongson2_cpufreq_cpu_init(struct cpufreq_policy *policy)
 		return PTR_ERR(cpuclk);
 	}
 
-	cpuclk->rate = cpu_clock_freq / 1000;
-	if (!cpuclk->rate)
+	rate = cpu_clock_freq / 1000;
+	if (!rate) {
+		clk_put(cpuclk);
 		return -EINVAL;
+	}
+	ret = clk_set_rate(cpuclk, rate);
+	if (ret) {
+		clk_put(cpuclk);
+		return ret;
+	}
 
 	/* clock table init */
 	for (i = 2;
 	     (loongson2_clockmod_table[i].frequency != CPUFREQ_TABLE_END);
 	     i++)
-		loongson2_clockmod_table[i].frequency = (cpuclk->rate * i) / 8;
+		loongson2_clockmod_table[i].frequency = (rate * i) / 8;
 
 	policy->cur = loongson2_cpufreq_get(policy->cpu);
 

