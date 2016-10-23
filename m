From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Oct 2016 20:23:25 +0000
Subject: [PATCH 1/2] M32R-setup: Use seq_putc() in show_cpuinfo()
Message-Id: <45a00094-35dc-6f06-6a0a-bf20df5cb5a8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fef662e1-b5b4-127e-9427-a98ffb512a82@users.sourceforge.net>
In-Reply-To: <fef662e1-b5b4-127e-9427-a98ffb512a82@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Toshi Kani <toshi.kani@hpe.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Oct 2016 21:50:22 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/m32r/kernel/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/m32r/kernel/setup.c b/arch/m32r/kernel/setup.c
index 136c69f..92cbe92 100644
--- a/arch/m32r/kernel/setup.c
+++ b/arch/m32r/kernel/setup.c
@@ -351,9 +351,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 	PRINT_CLOCK("CPU", (int)c->cpu_clock);
 	PRINT_CLOCK("Bus", (int)c->bus_clock);
-
-	seq_printf(m, "\n");
-
+	seq_putc(m, '\n');
 	return 0;
 }
 
-- 
2.10.1

