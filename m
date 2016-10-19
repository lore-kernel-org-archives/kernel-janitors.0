From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 20:48:54 +0000
Subject: [PATCH 3/5] blackfin-setup: Use seq_putc() in show_cpuinfo()
Message-Id: <bb678250-de03-f1cf-17c6-64b500a4f5e5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
In-Reply-To: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Steven Miao <realmz6@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 21:31:04 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/blackfin/kernel/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/blackfin/kernel/setup.c b/arch/blackfin/kernel/setup.c
index ad82468..a159008 100644
--- a/arch/blackfin/kernel/setup.c
+++ b/arch/blackfin/kernel/setup.c
@@ -1397,8 +1397,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 #ifdef __ARCH_SYNC_CORE_ICACHE
 	seq_printf(m, "icache flushes\t: %lu\n", icache_invld_count[cpu_num]);
 #endif
-
-	seq_printf(m, "\n");
+	seq_putc(m, '\n');
 
 	if (cpu_num != num_possible_cpus() - 1)
 		return 0;
-- 
2.10.1

