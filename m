From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Oct 2016 20:24:52 +0000
Subject: [PATCH 2/2] M32R-setup: Replace 16 seq_printf() calls by seq_puts() in show_cpuinfo()
Message-Id: <85f08303-4584-ea4c-4977-2cb5f3e08d13@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fef662e1-b5b4-127e-9427-a98ffb512a82@users.sourceforge.net>
In-Reply-To: <fef662e1-b5b4-127e-9427-a98ffb512a82@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Toshi Kani <toshi.kani@hpe.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Oct 2016 22:04:34 +0200

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/m32r/kernel/setup.c | 50 +++++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/m32r/kernel/setup.c b/arch/m32r/kernel/setup.c
index 92cbe92..2eac3b2 100644
--- a/arch/m32r/kernel/setup.c
+++ b/arch/m32r/kernel/setup.c
@@ -302,47 +302,53 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %ld\n", cpu);
 
 #if defined(CONFIG_CHIP_VDEC2)
-	seq_printf(m, "cpu family\t: VDEC2\n"
-		"cache size\t: Unknown\n");
+	seq_puts(m,
+		 "cpu family\t: VDEC2\n"
+		 "cache size\t: Unknown\n");
 #elif defined(CONFIG_CHIP_M32700)
-	seq_printf(m,"cpu family\t: M32700\n"
-		"cache size\t: I-8KB/D-8KB\n");
+	seq_puts(m,
+		 "cpu family\t: M32700\n"
+		 "cache size\t: I-8KB/D-8KB\n");
 #elif defined(CONFIG_CHIP_M32102)
-	seq_printf(m,"cpu family\t: M32102\n"
-		"cache size\t: I-8KB\n");
+	seq_puts(m,
+		 "cpu family\t: M32102\n"
+		 "cache size\t: I-8KB\n");
 #elif defined(CONFIG_CHIP_OPSP)
-	seq_printf(m,"cpu family\t: OPSP\n"
-		"cache size\t: I-8KB/D-8KB\n");
+	seq_puts(m,
+		 "cpu family\t: OPSP\n"
+		 "cache size\t: I-8KB/D-8KB\n");
 #elif defined(CONFIG_CHIP_MP)
-	seq_printf(m, "cpu family\t: M32R-MP\n"
-		"cache size\t: I-xxKB/D-xxKB\n");
+	seq_puts(m,
+		 "cpu family\t: M32R-MP\n"
+		 "cache size\t: I-xxKB/D-xxKB\n");
 #elif  defined(CONFIG_CHIP_M32104)
-	seq_printf(m,"cpu family\t: M32104\n"
-		"cache size\t: I-8KB/D-8KB\n");
+	seq_puts(m,
+		 "cpu family\t: M32104\n"
+		 "cache size\t: I-8KB/D-8KB\n");
 #else
-	seq_printf(m, "cpu family\t: Unknown\n");
+	seq_puts(m, "cpu family\t: Unknown\n");
 #endif
 	seq_printf(m, "bogomips\t: %lu.%02lu\n",
 		c->loops_per_jiffy/(500000/HZ),
 		(c->loops_per_jiffy/(5000/HZ)) % 100);
 #if defined(CONFIG_PLAT_MAPPI)
-	seq_printf(m, "Machine\t\t: Mappi Evaluation board\n");
+	seq_puts(m, "Machine\t\t: Mappi Evaluation board\n");
 #elif defined(CONFIG_PLAT_MAPPI2)
-	seq_printf(m, "Machine\t\t: Mappi-II Evaluation board\n");
+	seq_puts(m, "Machine\t\t: Mappi-II Evaluation board\n");
 #elif defined(CONFIG_PLAT_MAPPI3)
-	seq_printf(m, "Machine\t\t: Mappi-III Evaluation board\n");
+	seq_puts(m, "Machine\t\t: Mappi-III Evaluation board\n");
 #elif defined(CONFIG_PLAT_M32700UT)
-	seq_printf(m, "Machine\t\t: M32700UT Evaluation board\n");
+	seq_puts(m, "Machine\t\t: M32700UT Evaluation board\n");
 #elif defined(CONFIG_PLAT_OPSPUT)
-	seq_printf(m, "Machine\t\t: OPSPUT Evaluation board\n");
+	seq_puts(m, "Machine\t\t: OPSPUT Evaluation board\n");
 #elif defined(CONFIG_PLAT_USRV)
-	seq_printf(m, "Machine\t\t: uServer\n");
+	seq_puts(m, "Machine\t\t: uServer\n");
 #elif defined(CONFIG_PLAT_OAKS32R)
-	seq_printf(m, "Machine\t\t: OAKS32R\n");
+	seq_puts(m, "Machine\t\t: OAKS32R\n");
 #elif  defined(CONFIG_PLAT_M32104UT)
-	seq_printf(m, "Machine\t\t: M3T-M32104UT uT Engine board\n");
+	seq_puts(m, "Machine\t\t: M3T-M32104UT uT Engine board\n");
 #else
-	seq_printf(m, "Machine\t\t: Unknown\n");
+	seq_puts(m, "Machine\t\t: Unknown\n");
 #endif
 
 #define PRINT_CLOCK(name, value)				\
-- 
2.10.1

