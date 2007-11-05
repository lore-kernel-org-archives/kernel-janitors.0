From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:14:19 +0000
Subject: [PATCH 06/12] arch/powerpc: Remove duplicate includes.
Message-Id: <472F799B.5020402@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/powerpc/kernel/signal_32.c         |    3 +--
 arch/powerpc/platforms/powermac/setup.c |    1 -
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 6126bca..829d6c1 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -24,13 +24,12 @@
 #include <linux/signal.h>
 #include <linux/errno.h>
 #include <linux/elf.h>
+#include <linux/ptrace.h>
 #ifdef CONFIG_PPC64
 #include <linux/syscalls.h>
 #include <linux/compat.h>
-#include <linux/ptrace.h>
 #else
 #include <linux/wait.h>
-#include <linux/ptrace.h>
 #include <linux/unistd.h>
 #include <linux/stddef.h>
 #include <linux/tty.h>
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 02c5330..a7ea363 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -94,7 +94,6 @@ extern struct machdep_calls pmac_md;
 #define DEFAULT_ROOT_DEVICE Root_SDA1	/* sda1 - slightly silly choice */
 
 #ifdef CONFIG_PPC64
-#include <asm/udbg.h>
 int sccdbg;
 #endif
 
-- 



