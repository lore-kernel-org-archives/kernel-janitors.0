From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:04:23 +0000
Subject: [PATCH 7/14] JANITOR: Remove #include <linux/sys.h> from MN10300
Message-Id: <20131029100422.GG14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From ba523e58af024937a6df011d71a5a0f6086787d5 Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:05:20 +0200
Subject: [PATCH 07/14] 07/14 JANITOR: Remove <linux/sys.h> from MN10300

	Remove #include from files:
		arch/mn10300/kernel/entry.S
		arch/mn10300/kernel/gdb-io-serial-low.S
		arch/mn10300/kernel/gdb-io-ttysm-low.S
		arch/mn10300/kernel/gdb-low.S
		arch/mn10300/kernel/mn10300-serial-low.S
		arch/mn10300/kernel/mn10300-watchdog-low.S
		arch/mn10300/kernel/profile-low.S
		arch/mn10300/kernel/smp-low.S
		arch/mn10300/kernel/switch_to.S
		arch/mn10300/mm/cache-dbg-flush-by-reg.S
		arch/mn10300/mm/cache-dbg-flush-by-tag.S
		arch/mn10300/mm/cache-dbg-inv-by-reg.S
		arch/mn10300/mm/cache-dbg-inv-by-tag.S
		arch/mn10300/mm/cache-dbg-inv.S
		arch/mn10300/mm/cache-flush-by-reg.S
		arch/mn10300/mm/cache-flush-by-tag.S
		arch/mn10300/mm/cache-inv-by-reg.S
		arch/mn10300/mm/cache-inv-by-tag.S
		arch/mn10300/mm/tlb-mn10300.S

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/mn10300/kernel/entry.S                | 1 -
 arch/mn10300/kernel/gdb-io-serial-low.S    | 1 -
 arch/mn10300/kernel/gdb-io-ttysm-low.S     | 1 -
 arch/mn10300/kernel/gdb-low.S              | 1 -
 arch/mn10300/kernel/mn10300-serial-low.S   | 1 -
 arch/mn10300/kernel/mn10300-watchdog-low.S | 1 -
 arch/mn10300/kernel/profile-low.S          | 1 -
 arch/mn10300/kernel/smp-low.S              | 1 -
 arch/mn10300/kernel/switch_to.S            | 1 -
 arch/mn10300/mm/cache-dbg-flush-by-reg.S   | 1 -
 arch/mn10300/mm/cache-dbg-flush-by-tag.S   | 1 -
 arch/mn10300/mm/cache-dbg-inv-by-reg.S     | 1 -
 arch/mn10300/mm/cache-dbg-inv-by-tag.S     | 1 -
 arch/mn10300/mm/cache-dbg-inv.S            | 1 -
 arch/mn10300/mm/cache-flush-by-reg.S       | 1 -
 arch/mn10300/mm/cache-flush-by-tag.S       | 1 -
 arch/mn10300/mm/cache-inv-by-reg.S         | 1 -
 arch/mn10300/mm/cache-inv-by-tag.S         | 1 -
 arch/mn10300/mm/tlb-mn10300.S              | 1 -
 19 files changed, 19 deletions(-)

diff --git a/arch/mn10300/kernel/entry.S b/arch/mn10300/kernel/entry.S
index 177d61d..083d659 100644
--- a/arch/mn10300/kernel/entry.S
+++ b/arch/mn10300/kernel/entry.S
@@ -12,7 +12,6 @@
 # 2 of the Licence, or (at your option) any later version.
 #
 ###############################################################################
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/irqflags.h>
diff --git a/arch/mn10300/kernel/gdb-io-serial-low.S b/arch/mn10300/kernel/gdb-io-serial-low.S
index b1d0152..4f518fa 100644
--- a/arch/mn10300/kernel/gdb-io-serial-low.S
+++ b/arch/mn10300/kernel/gdb-io-serial-low.S
@@ -11,7 +11,6 @@
 # 2 of the Licence, or (at your option) any later version.
 #
 ###############################################################################
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/cpu-regs.h>
diff --git a/arch/mn10300/kernel/gdb-io-ttysm-low.S b/arch/mn10300/kernel/gdb-io-ttysm-low.S
index 060b7cc..8680453 100644
--- a/arch/mn10300/kernel/gdb-io-ttysm-low.S
+++ b/arch/mn10300/kernel/gdb-io-ttysm-low.S
@@ -11,7 +11,6 @@
 # 2 of the Licence, or (at your option) any later version.
 #
 ###############################################################################
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/thread_info.h>
diff --git a/arch/mn10300/kernel/gdb-low.S b/arch/mn10300/kernel/gdb-low.S
index e2725552..5a7e419 100644
--- a/arch/mn10300/kernel/gdb-low.S
+++ b/arch/mn10300/kernel/gdb-low.S
@@ -11,7 +11,6 @@
 # 2 of the Licence, or (at your option) any later version.
 #
 ###############################################################################
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/cache.h>
diff --git a/arch/mn10300/kernel/mn10300-serial-low.S b/arch/mn10300/kernel/mn10300-serial-low.S
index b95e76c..59fafce 100644
--- a/arch/mn10300/kernel/mn10300-serial-low.S
+++ b/arch/mn10300/kernel/mn10300-serial-low.S
@@ -11,7 +11,6 @@
 # 2 of the Licence, or (at your option) any later version.
 #
 ###############################################################################
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/page.h>
 #include <asm/smp.h>
diff --git a/arch/mn10300/kernel/mn10300-watchdog-low.S b/arch/mn10300/kernel/mn10300-watchdog-low.S
index f2f5c9c..85ea655 100644
--- a/arch/mn10300/kernel/mn10300-watchdog-low.S
+++ b/arch/mn10300/kernel/mn10300-watchdog-low.S
@@ -11,7 +11,6 @@
 # 2 of the Licence, or (at your option) any later version.
 #
 ###############################################################################
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/intctl-regs.h>
 #include <asm/timer-regs.h>
diff --git a/arch/mn10300/kernel/profile-low.S b/arch/mn10300/kernel/profile-low.S
index 94ffac1..4ae4f7c 100644
--- a/arch/mn10300/kernel/profile-low.S
+++ b/arch/mn10300/kernel/profile-low.S
@@ -11,7 +11,6 @@
 # 2 of the Licence, or (at your option) any later version.
 #
 ###############################################################################
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/segment.h>
 #include <asm/smp.h>
diff --git a/arch/mn10300/kernel/smp-low.S b/arch/mn10300/kernel/smp-low.S
index 71f1b2f..bbd2287 100644
--- a/arch/mn10300/kernel/smp-low.S
+++ b/arch/mn10300/kernel/smp-low.S
@@ -10,7 +10,6 @@
  *
  */
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/thread_info.h>
diff --git a/arch/mn10300/kernel/switch_to.S b/arch/mn10300/kernel/switch_to.S
index de3e74f..da1bd28 100644
--- a/arch/mn10300/kernel/switch_to.S
+++ b/arch/mn10300/kernel/switch_to.S
@@ -11,7 +11,6 @@
 # 2 of the Licence, or (at your option) any later version.
 #
 ###############################################################################
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/thread_info.h>
 #include <asm/cpu-regs.h>
diff --git a/arch/mn10300/mm/cache-dbg-flush-by-reg.S b/arch/mn10300/mm/cache-dbg-flush-by-reg.S
index a775ea5..b01a033 100644
--- a/arch/mn10300/mm/cache-dbg-flush-by-reg.S
+++ b/arch/mn10300/mm/cache-dbg-flush-by-reg.S
@@ -8,7 +8,6 @@
  * as published by the Free Software Foundation; either version
  * 2 of the Licence, or (at your option) any later version.
  */
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/page.h>
diff --git a/arch/mn10300/mm/cache-dbg-flush-by-tag.S b/arch/mn10300/mm/cache-dbg-flush-by-tag.S
index bf56930..5176dc4 100644
--- a/arch/mn10300/mm/cache-dbg-flush-by-tag.S
+++ b/arch/mn10300/mm/cache-dbg-flush-by-tag.S
@@ -8,7 +8,6 @@
  * as published by the Free Software Foundation; either version
  * 2 of the Licence, or (at your option) any later version.
  */
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/page.h>
diff --git a/arch/mn10300/mm/cache-dbg-inv-by-reg.S b/arch/mn10300/mm/cache-dbg-inv-by-reg.S
index c4e6252..4bbd9b2 100644
--- a/arch/mn10300/mm/cache-dbg-inv-by-reg.S
+++ b/arch/mn10300/mm/cache-dbg-inv-by-reg.S
@@ -8,7 +8,6 @@
  * as published by the Free Software Foundation; either version
  * 2 of the Licence, or (at your option) any later version.
  */
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/cache.h>
 #include <asm/irqflags.h>
diff --git a/arch/mn10300/mm/cache-dbg-inv-by-tag.S b/arch/mn10300/mm/cache-dbg-inv-by-tag.S
index d8ec821..77b492b 100644
--- a/arch/mn10300/mm/cache-dbg-inv-by-tag.S
+++ b/arch/mn10300/mm/cache-dbg-inv-by-tag.S
@@ -8,7 +8,6 @@
  * as published by the Free Software Foundation; either version
  * 2 of the Licence, or (at your option) any later version.
  */
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/page.h>
diff --git a/arch/mn10300/mm/cache-dbg-inv.S b/arch/mn10300/mm/cache-dbg-inv.S
index eba2d6d..3b07d87 100644
--- a/arch/mn10300/mm/cache-dbg-inv.S
+++ b/arch/mn10300/mm/cache-dbg-inv.S
@@ -8,7 +8,6 @@
  * as published by the Free Software Foundation; either version
  * 2 of the Licence, or (at your option) any later version.
  */
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/page.h>
diff --git a/arch/mn10300/mm/cache-flush-by-reg.S b/arch/mn10300/mm/cache-flush-by-reg.S
index 1dcae02..1183790 100644
--- a/arch/mn10300/mm/cache-flush-by-reg.S
+++ b/arch/mn10300/mm/cache-flush-by-reg.S
@@ -9,7 +9,6 @@
  * 2 of the Licence, or (at your option) any later version.
  */
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/page.h>
diff --git a/arch/mn10300/mm/cache-flush-by-tag.S b/arch/mn10300/mm/cache-flush-by-tag.S
index 1ddc068..eb9ffa2 100644
--- a/arch/mn10300/mm/cache-flush-by-tag.S
+++ b/arch/mn10300/mm/cache-flush-by-tag.S
@@ -9,7 +9,6 @@
  * 2 of the Licence, or (at your option) any later version.
  */
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/page.h>
diff --git a/arch/mn10300/mm/cache-inv-by-reg.S b/arch/mn10300/mm/cache-inv-by-reg.S
index a60825b..980841f 100644
--- a/arch/mn10300/mm/cache-inv-by-reg.S
+++ b/arch/mn10300/mm/cache-inv-by-reg.S
@@ -8,7 +8,6 @@
  * as published by the Free Software Foundation; either version
  * 2 of the Licence, or (at your option) any later version.
  */
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/page.h>
diff --git a/arch/mn10300/mm/cache-inv-by-tag.S b/arch/mn10300/mm/cache-inv-by-tag.S
index ccedce9..8e70551 100644
--- a/arch/mn10300/mm/cache-inv-by-tag.S
+++ b/arch/mn10300/mm/cache-inv-by-tag.S
@@ -8,7 +8,6 @@
  * as published by the Free Software Foundation; either version
  * 2 of the Licence, or (at your option) any later version.
  */
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/page.h>
diff --git a/arch/mn10300/mm/tlb-mn10300.S b/arch/mn10300/mm/tlb-mn10300.S
index b994017..f399c74 100644
--- a/arch/mn10300/mm/tlb-mn10300.S
+++ b/arch/mn10300/mm/tlb-mn10300.S
@@ -12,7 +12,6 @@
 # 2 of the Licence, or (at your option) any later version.
 #
 ###############################################################################
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/smp.h>
 #include <asm/intctl-regs.h>
-- 
1.8.3.2

