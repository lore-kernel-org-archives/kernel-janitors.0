From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Oct 2016 05:05:45 +0000
Subject: [PATCH 1/6] FRV-setup: Use seq_puts() in show_cpuinfo()
Message-Id: <79b01048-028e-9375-373b-d5daed242586@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
In-Reply-To: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Oct 2016 21:36:43 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/frv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/frv/kernel/setup.c b/arch/frv/kernel/setup.c
index 9f4a9a6..de9311f 100644
--- a/arch/frv/kernel/setup.c
+++ b/arch/frv/kernel/setup.c
@@ -1053,7 +1053,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "\n");
 
 #ifdef CONFIG_PM
-	seq_printf(m, "PM-Controls:");
+	seq_puts(m, "PM-Controls:");
 	sep = "\t";
 
 	if (clock_bits_settable & CLOCK_BIT_CMODE) {
-- 
2.10.1

