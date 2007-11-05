From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:14:40 +0000
Subject: [PATCH 07/12] arch/ppc: Remove duplicate includes.
Message-Id: <472F79B0.8090805@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linuxppc-dev@ozlabs.org, Andrew Morton <akpm@linux-foundation.org>


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/ppc/kernel/setup.c           |    1 -
 arch/ppc/platforms/85xx/stx_gp3.c |    1 -
 arch/ppc/syslib/gt64260_pic.c     |    1 -
 arch/ppc/syslib/mpc52xx_pic.c     |    1 -
 arch/ppc/syslib/mv64360_pic.c     |    1 -
 arch/ppc/syslib/ppc83xx_setup.c   |    1 -
 arch/ppc/xmon/start.c             |    1 -
 7 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/arch/ppc/kernel/setup.c b/arch/ppc/kernel/setup.c
index aac88c2..79a03d0 100644
--- a/arch/ppc/kernel/setup.c
+++ b/arch/ppc/kernel/setup.c
@@ -37,7 +37,6 @@
 #include <asm/nvram.h>
 #include <asm/xmon.h>
 #include <asm/ocp.h>
-#include <asm/prom.h>
 
 #define USES_PPC_SYS (defined(CONFIG_85xx) || defined(CONFIG_83xx) || \
 		      defined(CONFIG_MPC10X_BRIDGE) || defined(CONFIG_8260) || \
diff --git a/arch/ppc/platforms/85xx/stx_gp3.c b/arch/ppc/platforms/85xx/stx_gp3.c
index b1f5b73..731b40e 100644
--- a/arch/ppc/platforms/85xx/stx_gp3.c
+++ b/arch/ppc/platforms/85xx/stx_gp3.c
@@ -50,7 +50,6 @@
 #include <asm/irq.h>
 #include <asm/immap_85xx.h>
 #include <asm/cpm2.h>
-#include <asm/mpc85xx.h>
 #include <asm/ppc_sys.h>
 
 #include <syslib/cpm2_pic.h>
diff --git a/arch/ppc/syslib/gt64260_pic.c b/arch/ppc/syslib/gt64260_pic.c
index e84d432..3b4fcca 100644
--- a/arch/ppc/syslib/gt64260_pic.c
+++ b/arch/ppc/syslib/gt64260_pic.c
@@ -35,7 +35,6 @@
 #include <linux/interrupt.h>
 #include <linux/sched.h>
 #include <linux/signal.h>
-#include <linux/stddef.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
 
diff --git a/arch/ppc/syslib/mpc52xx_pic.c b/arch/ppc/syslib/mpc52xx_pic.c
index af35a31..f58149c 100644
--- a/arch/ppc/syslib/mpc52xx_pic.c
+++ b/arch/ppc/syslib/mpc52xx_pic.c
@@ -20,7 +20,6 @@
 #include <linux/init.h>
 #include <linux/sched.h>
 #include <linux/signal.h>
-#include <linux/stddef.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
 
diff --git a/arch/ppc/syslib/mv64360_pic.c b/arch/ppc/syslib/mv64360_pic.c
index 4b7a333..2dd2dc5 100644
--- a/arch/ppc/syslib/mv64360_pic.c
+++ b/arch/ppc/syslib/mv64360_pic.c
@@ -36,7 +36,6 @@
 #include <linux/init.h>
 #include <linux/sched.h>
 #include <linux/signal.h>
-#include <linux/stddef.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
diff --git a/arch/ppc/syslib/ppc83xx_setup.c b/arch/ppc/syslib/ppc83xx_setup.c
index ec466db..ea37291 100644
--- a/arch/ppc/syslib/ppc83xx_setup.c
+++ b/arch/ppc/syslib/ppc83xx_setup.c
@@ -41,7 +41,6 @@
 
 #include <syslib/ppc83xx_setup.h>
 #if defined(CONFIG_PCI)
-#include <asm/delay.h>
 #include <syslib/ppc83xx_pci.h>
 #endif
 
diff --git a/arch/ppc/xmon/start.c b/arch/ppc/xmon/start.c
index 8f0b953..9056fe5 100644
--- a/arch/ppc/xmon/start.c
+++ b/arch/ppc/xmon/start.c
@@ -10,7 +10,6 @@
 #include <linux/sysrq.h>
 #include <linux/bitops.h>
 #include <asm/xmon.h>
-#include <asm/machdep.h>
 #include <asm/errno.h>
 #include <asm/processor.h>
 #include <asm/delay.h>
-- 



