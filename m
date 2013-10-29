From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:02:10 +0000
Subject: [PATCH 5/14] JANITOR: Remove #include <linux/sys.h> from MICROBLAZE
Message-Id: <20131029100210.GE14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 657248752349218a7b5f31c6f704249258ba035e Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 08:59:54 +0200
Subject: [PATCH 05/14] 05/14 JANITOR: Remove <linux/sys.h> from MICROBLAZE

	Remove #include from files:
		arch/microblaze/kernel/entry.S
		arch/microblaze/kernel/misc.S
		arch/microblaze/kernel/sys_microblaze.c

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/microblaze/kernel/entry.S          | 1 -
 arch/microblaze/kernel/misc.S           | 1 -
 arch/microblaze/kernel/sys_microblaze.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/microblaze/kernel/entry.S b/arch/microblaze/kernel/entry.S
index 0536bc0..ca2ea8b 100644
--- a/arch/microblaze/kernel/entry.S
+++ b/arch/microblaze/kernel/entry.S
@@ -15,7 +15,6 @@
  * Heavily modified by John Williams for Microblaze
  */
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 
 #include <asm/entry.h>
diff --git a/arch/microblaze/kernel/misc.S b/arch/microblaze/kernel/misc.S
index 1dafdde..a8e732e 100644
--- a/arch/microblaze/kernel/misc.S
+++ b/arch/microblaze/kernel/misc.S
@@ -13,7 +13,6 @@
  */
 
 #include <linux/linkage.h>
-#include <linux/sys.h>
 #include <asm/unistd.h>
 #include <linux/errno.h>
 #include <asm/mmu.h>
diff --git a/arch/microblaze/kernel/sys_microblaze.c b/arch/microblaze/kernel/sys_microblaze.c
index f905b3a..9f6f496a 100644
--- a/arch/microblaze/kernel/sys_microblaze.c
+++ b/arch/microblaze/kernel/sys_microblaze.c
@@ -22,7 +22,6 @@
 #include <linux/shm.h>
 #include <linux/stat.h>
 #include <linux/mman.h>
-#include <linux/sys.h>
 #include <linux/ipc.h>
 #include <linux/file.h>
 #include <linux/err.h>
-- 
1.8.3.2

