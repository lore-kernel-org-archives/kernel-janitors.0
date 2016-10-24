From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 12:29:57 +0000
Subject: [PATCH 3/4] MIPS/kernel/proc: Replace 28 seq_printf() calls by seq_puts() in show_cpuinfo()
Message-Id: <33b51bd8-7225-55a5-4be8-d062390e6f67@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
In-Reply-To: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 13:45:04 +0200

Strings which did not contain data format specifications should be put
into a sequence.

* Thus use the corresponding function "seq_puts" so that the data output
  will be a bit more efficient.

* Omit the format string "%s" which became unnecessary with this refactoring.


This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/proc.c | 74 +++++++++++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 765489b..07480a9 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -79,49 +79,63 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		for (i = 0; i < cpu_data[n].watch_reg_count; i++)
 			seq_printf(m, "%s0x%04x", i ? ", " : "" ,
 				cpu_data[n].watch_reg_masks[i]);
-		seq_printf(m, "]\n");
+		seq_puts(m, "]\n");
 	}
 
-	seq_printf(m, "isa\t\t\t:"); 
+	seq_puts(m, "isa\t\t\t:");
 	if (cpu_has_mips_r1)
-		seq_printf(m, " mips1");
+		seq_puts(m, " mips1");
 	if (cpu_has_mips_2)
-		seq_printf(m, "%s", " mips2");
+		seq_puts(m, " mips2");
 	if (cpu_has_mips_3)
-		seq_printf(m, "%s", " mips3");
+		seq_puts(m, " mips3");
 	if (cpu_has_mips_4)
-		seq_printf(m, "%s", " mips4");
+		seq_puts(m, " mips4");
 	if (cpu_has_mips_5)
-		seq_printf(m, "%s", " mips5");
+		seq_puts(m, " mips5");
 	if (cpu_has_mips32r1)
-		seq_printf(m, "%s", " mips32r1");
+		seq_puts(m, " mips32r1");
 	if (cpu_has_mips32r2)
-		seq_printf(m, "%s", " mips32r2");
+		seq_puts(m, " mips32r2");
 	if (cpu_has_mips32r6)
-		seq_printf(m, "%s", " mips32r6");
+		seq_puts(m, " mips32r6");
 	if (cpu_has_mips64r1)
-		seq_printf(m, "%s", " mips64r1");
+		seq_puts(m, " mips64r1");
 	if (cpu_has_mips64r2)
-		seq_printf(m, "%s", " mips64r2");
+		seq_puts(m, " mips64r2");
 	if (cpu_has_mips64r6)
-		seq_printf(m, "%s", " mips64r6");
-	seq_printf(m, "\n");
-
-	seq_printf(m, "ASEs implemented\t:");
-	if (cpu_has_mips16)	seq_printf(m, "%s", " mips16");
-	if (cpu_has_mdmx)	seq_printf(m, "%s", " mdmx");
-	if (cpu_has_mips3d)	seq_printf(m, "%s", " mips3d");
-	if (cpu_has_smartmips)	seq_printf(m, "%s", " smartmips");
-	if (cpu_has_dsp)	seq_printf(m, "%s", " dsp");
-	if (cpu_has_dsp2)	seq_printf(m, "%s", " dsp2");
-	if (cpu_has_dsp3)	seq_printf(m, "%s", " dsp3");
-	if (cpu_has_mipsmt)	seq_printf(m, "%s", " mt");
-	if (cpu_has_mmips)	seq_printf(m, "%s", " micromips");
-	if (cpu_has_vz)		seq_printf(m, "%s", " vz");
-	if (cpu_has_msa)	seq_printf(m, "%s", " msa");
-	if (cpu_has_eva)	seq_printf(m, "%s", " eva");
-	if (cpu_has_htw)	seq_printf(m, "%s", " htw");
-	if (cpu_has_xpa)	seq_printf(m, "%s", " xpa");
+		seq_puts(m, " mips64r6");
+	seq_puts(m,
+		 "\n"
+		 "ASEs implemented\t:");
+	if (cpu_has_mips16)
+		seq_puts(m, " mips16");
+	if (cpu_has_mdmx)
+		seq_puts(m, " mdmx");
+	if (cpu_has_mips3d)
+		seq_puts(m, " mips3d");
+	if (cpu_has_smartmips)
+		seq_puts(m, " smartmips");
+	if (cpu_has_dsp)
+		seq_puts(m, " dsp");
+	if (cpu_has_dsp2)
+		seq_puts(m, " dsp2");
+	if (cpu_has_dsp3)
+		seq_puts(m, " dsp3");
+	if (cpu_has_mipsmt)
+		seq_puts(m, " mt");
+	if (cpu_has_mmips)
+		seq_puts(m, " micromips");
+	if (cpu_has_vz)
+		seq_puts(m, " vz");
+	if (cpu_has_msa)
+		seq_puts(m, " msa");
+	if (cpu_has_eva)
+		seq_puts(m, " eva");
+	if (cpu_has_htw)
+		seq_puts(m, " htw");
+	if (cpu_has_xpa)
+		seq_puts(m, " xpa");
 	seq_putc(m, '\n');
 
 	if (cpu_has_mmips) {
-- 
2.10.1

