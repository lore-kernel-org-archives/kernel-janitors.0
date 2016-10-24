From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 12:30:52 +0000
Subject: [PATCH 4/4] MIPS/kernel/proc: Combine four seq_printf() calls into one call in show_cpuinfo()
Message-Id: <61796ee0-b3b8-53a6-d29d-487c89145fc1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
In-Reply-To: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 13:54:58 +0200

Some data were printed into a sequence by four separate function calls.
Print the same data by one function call instead.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/proc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 07480a9..1047a03 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -142,12 +142,15 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "micromips kernel\t: %s\n",
 		      (read_c0_config3() & MIPS_CONF3_ISA_OE) ?  "yes" : "no");
 	}
-	seq_printf(m, "shadow register sets\t: %d\n",
-		      cpu_data[n].srsets);
-	seq_printf(m, "kscratch registers\t: %d\n",
-		      hweight8(cpu_data[n].kscratch_mask));
-	seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
-	seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
+	seq_printf(m,
+		   "shadow register sets\t: %d\n"
+		   "kscratch registers\t: %d\n"
+		   "package\t\t\t: %d\n"
+		   "core\t\t\t: %d\n",
+		   cpu_data[n].srsets,
+		   hweight8(cpu_data[n].kscratch_mask),
+		   cpu_data[n].package,
+		   cpu_data[n].core);
 
 #if defined(CONFIG_MIPS_MT_SMP) || defined(CONFIG_CPU_MIPSR6)
 	if (cpu_has_mipsmt)
-- 
2.10.1

