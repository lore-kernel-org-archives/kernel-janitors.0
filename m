From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 15:48:20 +0000
Subject: [PATCH] score-setup: Combine two seq_printf() calls into one call in show_cpuinfo()
Message-Id: <ddcfff3a-9502-6ce0-b08a-365eb55ce958@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Chen Liqin <liqin.linux@gmail.com>, Lennox Wu <lennox.wu@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 16:36:35 +0100

Some data were printed into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/score/kernel/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/score/kernel/setup.c b/arch/score/kernel/setup.c
index f3a0649ab521..627416bbd0b1 100644
--- a/arch/score/kernel/setup.c
+++ b/arch/score/kernel/setup.c
@@ -124,9 +124,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	unsigned long n = (unsigned long) v - 1;
 
-	seq_printf(m, "processor\t\t: %ld\n", n);
-	seq_printf(m, "\n");
-
+	seq_printf(m, "processor\t\t: %ld\n\n", n);
 	return 0;
 }
 
-- 
2.15.1

