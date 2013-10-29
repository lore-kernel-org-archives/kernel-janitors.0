From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:06:19 +0000
Subject: [PATCH 9/14] JANITOR: Remove #include <linux/sys.h> from POWERPC
Message-Id: <20131029100619.GI14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 69f06d5db247f15537ed68f06d3997daddf633e4 Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:18:29 +0200
Subject: [PATCH 09/14] 09/14 JANITOR: Remove <linux/sys.h> from POWERPC

	Remove #include from files:
		arch/powerpc/kernel/entry_32.S
		arch/powerpc/kernel/misc_32.S
		arch/powerpc/kernel/misc_64.S
		arch/powerpc/kernel/syscalls.c
		arch/powerpc/lib/checksum_32.S
		arch/powerpc/lib/checksum_64.S

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/powerpc/kernel/entry_32.S | 1 -
 arch/powerpc/kernel/misc_32.S  | 1 -
 arch/powerpc/kernel/misc_64.S  | 1 -
 arch/powerpc/kernel/syscalls.c | 1 -
 arch/powerpc/lib/checksum_32.S | 1 -
 arch/powerpc/lib/checksum_64.S | 1 -
 6 files changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 22b45a4..d218e1a 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -20,7 +20,6 @@
  */
 
 #include <linux/errno.h>
-#include <linux/sys.h>
 #include <linux/threads.h>
 #include <asm/reg.h>
 #include <asm/page.h>
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 2b0ad98..d72a45d 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -18,7 +18,6 @@
  *
  */
 
-#include <linux/sys.h>
 #include <asm/unistd.h>
 #include <asm/errno.h>
 #include <asm/reg.h>
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index e59caf8..4834d58 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -14,7 +14,6 @@
  *
  */
 
-#include <linux/sys.h>
 #include <asm/unistd.h>
 #include <asm/errno.h>
 #include <asm/processor.h>
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 4e3cc47..d9abea0 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -30,7 +30,6 @@
 #include <linux/shm.h>
 #include <linux/stat.h>
 #include <linux/mman.h>
-#include <linux/sys.h>
 #include <linux/ipc.h>
 #include <linux/utsname.h>
 #include <linux/file.h>
diff --git a/arch/powerpc/lib/checksum_32.S b/arch/powerpc/lib/checksum_32.S
index 7874e8a..6e9ba71 100644
--- a/arch/powerpc/lib/checksum_32.S
+++ b/arch/powerpc/lib/checksum_32.S
@@ -12,7 +12,6 @@
  * Severely hacked about by Paul Mackerras (paulus@cs.anu.edu.au).
  */
 
-#include <linux/sys.h>
 #include <asm/processor.h>
 #include <asm/errno.h>
 #include <asm/ppc_asm.h>
diff --git a/arch/powerpc/lib/checksum_64.S b/arch/powerpc/lib/checksum_64.S
index 57a0720..d9c11c2 100644
--- a/arch/powerpc/lib/checksum_64.S
+++ b/arch/powerpc/lib/checksum_64.S
@@ -12,7 +12,6 @@
  * Severely hacked about by Paul Mackerras (paulus@cs.anu.edu.au).
  */
 
-#include <linux/sys.h>
 #include <asm/processor.h>
 #include <asm/errno.h>
 #include <asm/ppc_asm.h>
-- 
1.8.3.2

