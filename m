From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 12:27:55 +0000
Subject: [PATCH 1/4] MIPS/kernel/r2-to-r6-emul: Use seq_puts() in mipsr2_stats_show()
Message-Id: <4126c272-cdf6-677a-fe98-74e8034078d8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
In-Reply-To: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Oct 2016 09:34:51 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts"
so that the data output will be a bit more efficient for the headline.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/mips-r2-to-r6-emul.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/mips-r2-to-r6-emul.c b/arch/mips/kernel/mips-r2-to-r6-emul.c
index 22dedd6..1bdcb65 100644
--- a/arch/mips/kernel/mips-r2-to-r6-emul.c
+++ b/arch/mips/kernel/mips-r2-to-r6-emul.c
@@ -2232,9 +2232,10 @@ int mipsr2_decoder(struct pt_regs *regs, u32 inst, unsigned long *fcr31)
 
 static int mipsr2_stats_show(struct seq_file *s, void *unused)
 {
-
-	seq_printf(s, "Instruction\tTotal\tBDslot\n------------------------------\n");
-	seq_printf(s, "movs\t\t%ld\t%ld\n",
+	seq_puts(s,
+		 "Instruction\tTotal\tBDslot\n------------------------------\n"
+		 "movs\t\t");
+	seq_printf(s, "%ld\t%ld\n",
 		   (unsigned long)__this_cpu_read(mipsr2emustats.movs),
 		   (unsigned long)__this_cpu_read(mipsr2bdemustats.movs));
 	seq_printf(s, "hilo\t\t%ld\t%ld\n",
-- 
2.10.1

