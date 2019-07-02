From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 12:56:46 +0000
Subject: [PATCH] powerpc/setup: Adjust six seq_printf() calls in show_cpuinfo()
Message-Id: <5b62379e-a35f-4f56-f1b5-6350f76007e7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@linux.ibm.com>, Paul Mackerras <paulus@samba.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 14:41:42 +0200

A bit of information should be put into a sequence.
Thus improve the execution speed for this data output by better usage
of corresponding functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kernel/setup-common.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 1f8db666468d..a381723b11bd 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -239,18 +239,17 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	maj = (pvr >> 8) & 0xFF;
 	min = pvr & 0xFF;

-	seq_printf(m, "processor\t: %lu\n", cpu_id);
-	seq_printf(m, "cpu\t\t: ");
+	seq_printf(m, "processor\t: %lu\ncpu\t\t: ", cpu_id);

 	if (cur_cpu_spec->pvr_mask && cur_cpu_spec->cpu_name)
-		seq_printf(m, "%s", cur_cpu_spec->cpu_name);
+		seq_puts(m, cur_cpu_spec->cpu_name);
 	else
 		seq_printf(m, "unknown (%08x)", pvr);

 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		seq_printf(m, ", altivec supported");
+		seq_puts(m, ", altivec supported");

-	seq_printf(m, "\n");
+	seq_putc(m, '\n');

 #ifdef CONFIG_TAU
 	if (cpu_has_feature(CPU_FTR_TAU)) {
@@ -332,7 +331,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "bogomips\t: %lu.%02lu\n", loops_per_jiffy / (500000 / HZ),
 			   (loops_per_jiffy / (5000 / HZ)) % 100);

-	seq_printf(m, "\n");
+	seq_putc(m, '\n');

 	/* If this is the last cpu, print the summary */
 	if (cpumask_next(cpu_id, cpu_online_mask) >= nr_cpu_ids)
--
2.22.0
