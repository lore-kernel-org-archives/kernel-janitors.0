From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:15:00 +0000
Subject: [PATCH 08/12] arch/sh: Remove duplicate includes.
Message-Id: <472F79C4.5090301@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/sh/boards/renesas/sh7710voipgw/setup.c |    1 -
 arch/sh/boards/se/7206/irq.c                |    1 -
 arch/sh/kernel/irq.c                        |    1 -
 arch/sh64/kernel/process.c                  |    1 -
 arch/sh64/kernel/traps.c                    |    2 --
 5 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/sh/boards/renesas/sh7710voipgw/setup.c b/arch/sh/boards/renesas/sh7710voipgw/setup.c
index 2dce8bd..0d56fd8 100644
--- a/arch/sh/boards/renesas/sh7710voipgw/setup.c
+++ b/arch/sh/boards/renesas/sh7710voipgw/setup.c
@@ -11,7 +11,6 @@
 #include <asm/machvec.h>
 #include <asm/irq.h>
 #include <asm/io.h>
-#include <asm/irq.h>
 
 static struct ipr_data sh7710voipgw_ipr_map[] = {
 	{ TIMER2_IRQ, TIMER2_IPR_ADDR, TIMER2_IPR_POS, TIMER2_PRIORITY },
diff --git a/arch/sh/boards/se/7206/irq.c b/arch/sh/boards/se/7206/irq.c
index 27da884..9d5bfc7 100644
--- a/arch/sh/boards/se/7206/irq.c
+++ b/arch/sh/boards/se/7206/irq.c
@@ -9,7 +9,6 @@
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <asm/se7206.h>
 
diff --git a/arch/sh/kernel/irq.c b/arch/sh/kernel/irq.c
index 348da19..0586bc6 100644
--- a/arch/sh/kernel/irq.c
+++ b/arch/sh/kernel/irq.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/kernel_stat.h>
 #include <linux/seq_file.h>
-#include <linux/irq.h>
 #include <asm/processor.h>
 #include <asm/machvec.h>
 #include <asm/uaccess.h>
diff --git a/arch/sh64/kernel/process.c b/arch/sh64/kernel/process.c
index ceb9458..9f1388c 100644
--- a/arch/sh64/kernel/process.c
+++ b/arch/sh64/kernel/process.c
@@ -656,7 +656,6 @@ unsigned long get_wchan(struct task_struct *p)
    */
 
 #if defined(CONFIG_SH64_PROC_ASIDS)
-#include <linux/init.h>
 #include <linux/proc_fs.h>
 
 static int
diff --git a/arch/sh64/kernel/traps.c b/arch/sh64/kernel/traps.c
index c03101f..9940a89 100644
--- a/arch/sh64/kernel/traps.c
+++ b/arch/sh64/kernel/traps.c
@@ -243,8 +243,6 @@ DO_ERROR(12, SIGILL,  "reserved instruction", reserved_inst, current)
 #endif /* CONFIG_SH64_ID2815_WORKAROUND */
 
 
-#include <asm/system.h>
-
 /* Called with interrupts disabled */
 asmlinkage void do_exception_error(unsigned long ex, struct pt_regs *regs)
 {
-- 



