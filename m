From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:07:02 +0000
Subject: [PATCH 10/14] JANITOR: Remove #include <linux/sys.h> from SH
Message-Id: <20131029100702.GJ14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 5d8011a97d10ba46d5a9154fc6497d3c17dc2b7e Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:22:38 +0200
Subject: [PATCH 10/14] 10/14 JANITOR: Remove <linux/sys.h> from SH

	Remove #include from files:
		arch/sh/boards/mach-ap325rxa/sdram.S
		arch/sh/boards/mach-ecovec24/sdram.S
		arch/sh/boards/mach-kfr2r09/sdram.S
		arch/sh/boards/mach-migor/sdram.S
		arch/sh/boards/mach-se/7724/sdram.S
		arch/sh/kernel/cpu/sh3/entry.S
		arch/sh/kernel/cpu/sh3/swsusp.S
		arch/sh/kernel/cpu/sh5/entry.S
		arch/sh/kernel/cpu/shmobile/sleep.S
		arch/sh/kernel/debugtraps.S
		arch/sh/kernel/syscalls_32.S
		arch/sh/kernel/syscalls_64.S

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/sh/boards/mach-ap325rxa/sdram.S | 1 -
 arch/sh/boards/mach-ecovec24/sdram.S | 1 -
 arch/sh/boards/mach-kfr2r09/sdram.S  | 1 -
 arch/sh/boards/mach-migor/sdram.S    | 1 -
 arch/sh/boards/mach-se/7724/sdram.S  | 1 -
 arch/sh/kernel/cpu/sh3/entry.S       | 1 -
 arch/sh/kernel/cpu/sh3/swsusp.S      | 1 -
 arch/sh/kernel/cpu/sh5/entry.S       | 1 -
 arch/sh/kernel/cpu/shmobile/sleep.S  | 1 -
 arch/sh/kernel/debugtraps.S          | 1 -
 arch/sh/kernel/syscalls_32.S         | 1 -
 arch/sh/kernel/syscalls_64.S         | 2 --
 12 files changed, 13 deletions(-)

diff --git a/arch/sh/boards/mach-ap325rxa/sdram.S b/arch/sh/boards/mach-ap325rxa/sdram.S
index db24fbe..c159a3c 100644
--- a/arch/sh/boards/mach-ap325rxa/sdram.S
+++ b/arch/sh/boards/mach-ap325rxa/sdram.S
@@ -8,7 +8,6 @@
  * for more details.
  */
 
-#include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/sh/boards/mach-ecovec24/sdram.S b/arch/sh/boards/mach-ecovec24/sdram.S
index 3963c6f..67814ce 100644
--- a/arch/sh/boards/mach-ecovec24/sdram.S
+++ b/arch/sh/boards/mach-ecovec24/sdram.S
@@ -8,7 +8,6 @@
  * for more details.
  */
 
-#include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/sh/boards/mach-kfr2r09/sdram.S b/arch/sh/boards/mach-kfr2r09/sdram.S
index 0c9f55b..822a090 100644
--- a/arch/sh/boards/mach-kfr2r09/sdram.S
+++ b/arch/sh/boards/mach-kfr2r09/sdram.S
@@ -8,7 +8,6 @@
  * for more details.
  */
 
-#include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/sh/boards/mach-migor/sdram.S b/arch/sh/boards/mach-migor/sdram.S
index 614aa3a..f6bd288 100644
--- a/arch/sh/boards/mach-migor/sdram.S
+++ b/arch/sh/boards/mach-migor/sdram.S
@@ -8,7 +8,6 @@
  * for more details.
  */
 
-#include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/sh/boards/mach-se/7724/sdram.S b/arch/sh/boards/mach-se/7724/sdram.S
index 6fa4734..2b6990b 100644
--- a/arch/sh/boards/mach-se/7724/sdram.S
+++ b/arch/sh/boards/mach-se/7724/sdram.S
@@ -8,7 +8,6 @@
  * for more details.
  */
 
-#include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/sh/kernel/cpu/sh3/entry.S b/arch/sh/kernel/cpu/sh3/entry.S
index 262db6e..a4eb41b 100644
--- a/arch/sh/kernel/cpu/sh3/entry.S
+++ b/arch/sh/kernel/cpu/sh3/entry.S
@@ -8,7 +8,6 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  */
-#include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/sh/kernel/cpu/sh3/swsusp.S b/arch/sh/kernel/cpu/sh3/swsusp.S
index 0114542..6d08020 100644
--- a/arch/sh/kernel/cpu/sh3/swsusp.S
+++ b/arch/sh/kernel/cpu/sh3/swsusp.S
@@ -7,7 +7,6 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  */
-#include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/sh/kernel/cpu/sh5/entry.S b/arch/sh/kernel/cpu/sh5/entry.S
index 0c8d037..bce91bd 100644
--- a/arch/sh/kernel/cpu/sh5/entry.S
+++ b/arch/sh/kernel/cpu/sh5/entry.S
@@ -11,7 +11,6 @@
  */
 #include <linux/errno.h>
 #include <linux/init.h>
-#include <linux/sys.h>
 #include <cpu/registers.h>
 #include <asm/processor.h>
 #include <asm/unistd.h>
diff --git a/arch/sh/kernel/cpu/shmobile/sleep.S b/arch/sh/kernel/cpu/shmobile/sleep.S
index e6aac65..784fbee 100644
--- a/arch/sh/kernel/cpu/shmobile/sleep.S
+++ b/arch/sh/kernel/cpu/shmobile/sleep.S
@@ -10,7 +10,6 @@
  * for more details.
  */
 
-#include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
diff --git a/arch/sh/kernel/debugtraps.S b/arch/sh/kernel/debugtraps.S
index 7a1b46f..eb7c42f 100644
--- a/arch/sh/kernel/debugtraps.S
+++ b/arch/sh/kernel/debugtraps.S
@@ -9,7 +9,6 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  */
-#include <linux/sys.h>
 #include <linux/linkage.h>
 
 #if !defined(CONFIG_KGDB)
diff --git a/arch/sh/kernel/syscalls_32.S b/arch/sh/kernel/syscalls_32.S
index 734234b..6c79811 100644
--- a/arch/sh/kernel/syscalls_32.S
+++ b/arch/sh/kernel/syscalls_32.S
@@ -11,7 +11,6 @@
  * for more details.
  *
  */
-#include <linux/sys.h>
 #include <linux/linkage.h>
 
 	.data
diff --git a/arch/sh/kernel/syscalls_64.S b/arch/sh/kernel/syscalls_64.S
index 579fcb9..1161e77 100644
--- a/arch/sh/kernel/syscalls_64.S
+++ b/arch/sh/kernel/syscalls_64.S
@@ -10,8 +10,6 @@
  * for more details.
  */
 
-#include <linux/sys.h>
-
 	.section .data, "aw"
 	.balign 32
 
-- 
1.8.3.2

