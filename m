From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:59:43 +0000
Subject: [PATCH 3/14] JANITOR: Remove #include <linux/sys.h> from FRV
Message-Id: <20131029095943.GC14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 927a6c58316d882a450f2cf5b3075b705495de6a Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Mon, 28 Oct 2013 14:56:01 +0200
Subject: [PATCH 03/14] 03/14 JANITOR: Remove <linux/sys.h> from FRV

	Remove #include from files:
		arch/frv/kernel/cmode.S
		arch/frv/kernel/entry-table.S
		arch/frv/kernel/sleep.S
		arch/frv/mm/tlb-flush.S
		arch/frv/mm/tlb-miss.S

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/frv/kernel/cmode.S       | 1 -
 arch/frv/kernel/entry-table.S | 1 -
 arch/frv/kernel/sleep.S       | 1 -
 arch/frv/mm/tlb-flush.S       | 1 -
 arch/frv/mm/tlb-miss.S        | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/frv/kernel/cmode.S b/arch/frv/kernel/cmode.S
index 53deeb5..7998119 100644
--- a/arch/frv/kernel/cmode.S
+++ b/arch/frv/kernel/cmode.S
@@ -10,7 +10,6 @@
  *
  */
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/setup.h>
 #include <asm/segment.h>
diff --git a/arch/frv/kernel/entry-table.S b/arch/frv/kernel/entry-table.S
index 06c5ae1..2c83c1c 100644
--- a/arch/frv/kernel/entry-table.S
+++ b/arch/frv/kernel/entry-table.S
@@ -10,7 +10,6 @@
  *
  */
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/spr-regs.h>
 
diff --git a/arch/frv/kernel/sleep.S b/arch/frv/kernel/sleep.S
index f67bf73..7aa6c82 100644
--- a/arch/frv/kernel/sleep.S
+++ b/arch/frv/kernel/sleep.S
@@ -10,7 +10,6 @@
  *
  */
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/setup.h>
 #include <asm/segment.h>
diff --git a/arch/frv/mm/tlb-flush.S b/arch/frv/mm/tlb-flush.S
index 79b3c70..544b3eb 100644
--- a/arch/frv/mm/tlb-flush.S
+++ b/arch/frv/mm/tlb-flush.S
@@ -9,7 +9,6 @@
  * 2 of the License, or (at your option) any later version.
  */
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
diff --git a/arch/frv/mm/tlb-miss.S b/arch/frv/mm/tlb-miss.S
index f3ac019..ac0c426 100644
--- a/arch/frv/mm/tlb-miss.S
+++ b/arch/frv/mm/tlb-miss.S
@@ -9,7 +9,6 @@
  * 2 of the License, or (at your option) any later version.
  */
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
-- 
1.8.3.2

