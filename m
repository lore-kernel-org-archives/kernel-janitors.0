From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 18:22:30 +0000
Subject: [PATCH] unicore32/kernel/setup: Use seq_puts() in c_show()
Message-Id: <4299c720-a33e-238d-1b6e-abcfc45a07f7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 20:15:41 +0200

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts" more.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/unicore32/kernel/setup.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/unicore32/kernel/setup.c b/arch/unicore32/kernel/setup.c
index c2bffa5614a4..345464ce35f5 100644
--- a/arch/unicore32/kernel/setup.c
+++ b/arch/unicore32/kernel/setup.c
@@ -316,18 +316,15 @@ static int c_show(struct seq_file *m, void *v)
 	seq_puts(m, "Features\t: CMOV UC-F64");
 
 	seq_printf(m, "\nCPU implementer\t: 0x%02x\n", uc32_cpuid >> 24);
-	seq_printf(m, "CPU architecture: 2\n");
+	seq_puts(m, "CPU architecture: 2\n");
 	seq_printf(m, "CPU revision\t: %d\n", (uc32_cpuid >> 16) & 15);
-
-	seq_printf(m, "Cache type\t: write-back\n"
-			"Cache clean\t: cp0 c5 ops\n"
-			"Cache lockdown\t: not support\n"
-			"Cache format\t: Harvard\n");
-
-	seq_puts(m, "\n");
-
-	seq_printf(m, "Hardware\t: PKUnity v3\n");
-
+	seq_puts(m,
+		 "Cache type\t: write-back\n"
+		 "Cache clean\t: cp0 c5 ops\n"
+		 "Cache lockdown\t: not support\n"
+		 "Cache format\t: Harvard\n"
+		 "\n"
+		 "Hardware\t: PKUnity v3\n");
 	return 0;
 }
 
-- 
2.12.2

