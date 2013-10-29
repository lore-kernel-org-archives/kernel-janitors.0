From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:01:20 +0000
Subject: [PATCH 4/14] JANITOR: Remove #include <linux/sys.h> from H8300
Message-Id: <20131029100120.GD14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 20aad2f2857c28f4436d004a606b43b8218d6998 Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 08:57:25 +0200
Subject: [PATCH 04/14] 04/14 JANITOR: Remove <linux/sys.h> from H8300

	Remove #include from files:
		arch/h8300/kernel/entry.S
		arch/h8300/kernel/syscalls.S

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/h8300/kernel/entry.S    | 1 -
 arch/h8300/kernel/syscalls.S | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/h8300/kernel/entry.S b/arch/h8300/kernel/entry.S
index 94bd30f..392743f 100644
--- a/arch/h8300/kernel/entry.S
+++ b/arch/h8300/kernel/entry.S
@@ -13,7 +13,6 @@
  *          system call entry
  */
 
-#include <linux/sys.h>
 #include <asm/unistd.h>
 #include <asm/setup.h>
 #include <asm/segment.h>
diff --git a/arch/h8300/kernel/syscalls.S b/arch/h8300/kernel/syscalls.S
index c55e0ed..45f2531 100644
--- a/arch/h8300/kernel/syscalls.S
+++ b/arch/h8300/kernel/syscalls.S
@@ -1,5 +1,4 @@
 /* Systemcall Entry Table */
-#include <linux/sys.h>
 #include <asm/linkage.h>
 #include <asm/unistd.h>
 
-- 
1.8.3.2

