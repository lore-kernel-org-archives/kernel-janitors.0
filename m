From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 20:50:33 +0000
Subject: [PATCH 5/5] blackfin-setup: Combine ten seq_printf() calls into three calls in show_cpuinfo()
Message-Id: <f756e72a-a4f7-4457-27e1-e9df39d64abb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
In-Reply-To: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Steven Miao <realmz6@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 22:11:32 +0200

Some data were printed into a sequence by ten separate function calls.
Print the same data by three function calls instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/blackfin/kernel/setup.c | 64 +++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 28 deletions(-)

diff --git a/arch/blackfin/kernel/setup.c b/arch/blackfin/kernel/setup.c
index fdd9168..250e645 100644
--- a/arch/blackfin/kernel/setup.c
+++ b/arch/blackfin/kernel/setup.c
@@ -1360,26 +1360,29 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	if ((cpudata->imemctl & (IMC | ENICPLB)) != (IMC | ENICPLB))
 		icache_size = 0;
 
-	seq_printf(m, "cache size\t: %d KB(L1 icache) "
-		"%d KB(L1 dcache) %d KB(L2 cache)\n",
-		icache_size, dcache_size, 0);
-	seq_printf(m, "%s\n", cache);
-	seq_printf(m, "external memory\t: "
+	seq_printf(m,
+		   "cache size\t: %d KB(L1 icache) %d KB(L1 dcache) %d KB(L2 cache)\n"
+		   "%s\n"
+		   "external memory\t: "
 #if defined(CONFIG_BFIN_EXTMEM_ICACHEABLE)
 		   "cacheable"
 #else
 		   "uncacheable"
 #endif
-		   " in instruction cache\n");
-	seq_printf(m, "external memory\t: "
+		   " in instruction cache\n"
+		   "external memory\t: "
 #if defined(CONFIG_BFIN_EXTMEM_WRITEBACK)
-		      "cacheable (write-back)"
+		   "cacheable (write-back)"
 #elif defined(CONFIG_BFIN_EXTMEM_WRITETHROUGH)
-		      "cacheable (write-through)"
+		   "cacheable (write-through)"
 #else
-		      "uncacheable"
+		   "uncacheable"
 #endif
-		      " in data cache\n");
+		   " in data cache\n",
+		   icache_size,
+		   dcache_size,
+		   0,
+		   cache);
 
 	if (icache_size)
 		seq_printf(m, "icache setup\t: %d Sub-banks/%d Ways, %d Lines/Way\n",
@@ -1403,31 +1406,36 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		return 0;
 
 	if (L2_LENGTH) {
-		seq_printf(m, "L2 SRAM\t\t: %dKB\n", L2_LENGTH/0x400);
-		seq_printf(m, "L2 SRAM\t\t: "
+		seq_printf(m,
+			   "L2 SRAM\t\t: %dKB\n"
+			   "L2 SRAM\t\t: "
 #if defined(CONFIG_BFIN_L2_ICACHEABLE)
-			      "cacheable"
+			   "cacheable"
 #else
-			      "uncacheable"
+			   "uncacheable"
 #endif
-			      " in instruction cache\n");
-		seq_printf(m, "L2 SRAM\t\t: "
+			   " in instruction cache\n"
+			   "L2 SRAM\t\t: "
 #if defined(CONFIG_BFIN_L2_WRITEBACK)
-			      "cacheable (write-back)"
+			   "cacheable (write-back)"
 #elif defined(CONFIG_BFIN_L2_WRITETHROUGH)
-			      "cacheable (write-through)"
+			   "cacheable (write-through)"
 #else
-			      "uncacheable"
+			   "uncacheable"
 #endif
-			      " in data cache\n");
+			   " in data cache\n",
+			   L2_LENGTH / 0x400);
 	}
-	seq_printf(m, "board name\t: %s\n", bfin_board_name);
-	seq_printf(m, "board memory\t: %ld kB (0x%08lx -> 0x%08lx)\n",
-		physical_mem_end >> 10, 0ul, physical_mem_end);
-	seq_printf(m, "kernel memory\t: %d kB (0x%08lx -> 0x%08lx)\n",
-		((int)memory_end - (int)_rambase) >> 10,
-		_rambase, memory_end);
-
+	seq_printf(m,
+		   "board name\t: %s\n"
+		   "board memory\t: %ld kB (0x%08lx -> 0x%08lx)\n"
+		   "kernel memory\t: %d kB (0x%08lx -> 0x%08lx)\n",
+		   bfin_board_name,
+		   physical_mem_end >> 10,
+		   0ul,
+		   physical_mem_end,
+		   ((int)memory_end - (int)_rambase) >> 10,
+		   _rambase, memory_end);
 	return 0;
 }
 
-- 
2.10.1

