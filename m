From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 20:47:46 +0000
Subject: [PATCH 2/5] blackfin-irqchip: Combine two seq_printf() calls into one call in arch_show_interrupts()
Message-Id: <a2f2180b-5507-92d9-49bc-74e010db6c5f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
In-Reply-To: <4cd6678e-ebf0-d2f4-0b79-ac33060a6752@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Steven Miao <realmz6@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 21:19:50 +0200

Some data were printed into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/blackfin/kernel/irqchip.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/blackfin/kernel/irqchip.c b/arch/blackfin/kernel/irqchip.c
index 052cde5..b59ad4c 100644
--- a/arch/blackfin/kernel/irqchip.c
+++ b/arch/blackfin/kernel/irqchip.c
@@ -41,8 +41,10 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 	seq_printf(p, "%*s: ", prec, "NMI");
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", cpu_pda[j].__nmi_count);
-	seq_printf(p, "  CORE  Non Maskable Interrupt\n");
-	seq_printf(p, "%*s: %10u\n", prec, "ERR", atomic_read(&irq_err_count));
+	seq_printf(p,
+		   "  CORE  Non Maskable Interrupt\n"
+		   "%*s: %10u\n",
+		   prec, "ERR", atomic_read(&irq_err_count));
 	return 0;
 }
 #endif
-- 
2.10.1

