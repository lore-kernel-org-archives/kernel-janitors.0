From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Oct 2016 05:07:17 +0000
Subject: [PATCH 2/6] FRV-setup: Use seq_putc() in show_cpuinfo()
Message-Id: <7bee4dff-08a8-b627-12dc-8a38fa0757c6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
In-Reply-To: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Oct 2016 21:39:00 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/frv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/frv/kernel/setup.c b/arch/frv/kernel/setup.c
index de9311f..7570ff0 100644
--- a/arch/frv/kernel/setup.c
+++ b/arch/frv/kernel/setup.c
@@ -1050,7 +1050,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	if (cpu_board2)
 		seq_printf(m, ", %s", cpu_board2);
 
-	seq_printf(m, "\n");
+	seq_putc(m, '\n');
 
 #ifdef CONFIG_PM
 	seq_puts(m, "PM-Controls:");
-- 
2.10.1

