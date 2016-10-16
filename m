From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 20:33:47 +0000
Subject: [PATCH 1/4] AVR32-clock: Use seq_putc() in two functions
Message-Id: <1c7e4d7e-bf3a-1cbb-3af7-6b384ac568ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
In-Reply-To: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Oct 2016 21:51:09 +0200

A single character (line break) should be put into two sequences.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/avr32/mach-at32ap/clock.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/avr32/mach-at32ap/clock.c b/arch/avr32/mach-at32ap/clock.c
index 52c179b..a912a72 100644
--- a/arch/avr32/mach-at32ap/clock.c
+++ b/arch/avr32/mach-at32ap/clock.c
@@ -242,7 +242,7 @@ dump_clock(struct clk *parent, struct clkinf *r)
 		clk_get_rate(parent));
 	if (parent->dev)
 		seq_printf(r->s, ", for %s", dev_name(parent->dev));
-	seq_printf(r->s, "\n");
+	seq_putc(r->s, '\n');
 
 	/* cost of this scan is small, but not linear... */
 	r->nest = nest + NEST_DELTA;
@@ -276,8 +276,7 @@ static int clk_show(struct seq_file *s, void *unused)
 		seq_printf(s, "GCCTRL%d = %8x\n", i, pm_readl(GCCTRL(i)));
 	}
 
-	seq_printf(s, "\n");
-
+	seq_putc(s, '\n');
 	r.s = s;
 	r.nest = 0;
 	/* protected from changes on the list while dumping */
-- 
2.10.1

