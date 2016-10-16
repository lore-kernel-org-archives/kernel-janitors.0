From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 20:34:42 +0000
Subject: [PATCH 2/4] AVR32-clock: Combine nine seq_printf() calls into one call in clk_show()
Message-Id: <11804998-2aa2-c24f-08a1-0820a8fa6d82@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
In-Reply-To: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 22:04:10 +0200

Some data were printed into a sequence by nine separate function calls.
Print the same data by a single function call instead.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/avr32/mach-at32ap/clock.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/avr32/mach-at32ap/clock.c b/arch/avr32/mach-at32ap/clock.c
index a912a72..fdf1cae 100644
--- a/arch/avr32/mach-at32ap/clock.c
+++ b/arch/avr32/mach-at32ap/clock.c
@@ -261,15 +261,25 @@ static int clk_show(struct seq_file *s, void *unused)
 	struct clk 	*clk;
 
 	/* show all the power manager registers */
-	seq_printf(s, "MCCTRL  = %8x\n", pm_readl(MCCTRL));
-	seq_printf(s, "CKSEL   = %8x\n", pm_readl(CKSEL));
-	seq_printf(s, "CPUMASK = %8x\n", pm_readl(CPU_MASK));
-	seq_printf(s, "HSBMASK = %8x\n", pm_readl(HSB_MASK));
-	seq_printf(s, "PBAMASK = %8x\n", pm_readl(PBA_MASK));
-	seq_printf(s, "PBBMASK = %8x\n", pm_readl(PBB_MASK));
-	seq_printf(s, "PLL0    = %8x\n", pm_readl(PLL0));
-	seq_printf(s, "PLL1    = %8x\n", pm_readl(PLL1));
-	seq_printf(s, "IMR     = %8x\n", pm_readl(IMR));
+	seq_printf(s,
+		   "MCCTRL  = %8x\n"
+		   "CKSEL   = %8x\n"
+		   "CPUMASK = %8x\n"
+		   "HSBMASK = %8x\n"
+		   "PBAMASK = %8x\n"
+		   "PBBMASK = %8x\n"
+		   "PLL0    = %8x\n"
+		   "PLL1    = %8x\n"
+		   "IMR     = %8x\n",
+		   pm_readl(MCCTRL),
+		   pm_readl(CKSEL),
+		   pm_readl(CPU_MASK),
+		   pm_readl(HSB_MASK),
+		   pm_readl(PBA_MASK),
+		   pm_readl(PBB_MASK),
+		   pm_readl(PLL0),
+		   pm_readl(PLL1),
+		   pm_readl(IMR));
 	for (i = 0; i < 8; i++) {
 		if (i = 5)
 			continue;
-- 
2.10.1

