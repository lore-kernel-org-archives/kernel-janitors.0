From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:58:53 +0000
Subject: [PATCH 2/14] JANITOR: Remove #include <linux/sys.h> from CRIS
Message-Id: <20131029095852.GB14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 770c45a680ac068951c4543f69a86ddd250726a2 Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Mon, 28 Oct 2013 14:09:48 +0200
Subject: [PATCH 02/14] 02/14 JANITOR: Remove <linux/sys.h> from CRIS

	Remove #include from files:
		arch/cris/arch-v10/kernel/entry.S
		arch/cris/arch-v32/kernel/entry.S

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/cris/arch-v10/kernel/entry.S | 1 -
 arch/cris/arch-v32/kernel/entry.S | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/cris/arch-v10/kernel/entry.S b/arch/cris/arch-v10/kernel/entry.S
index 897bba6..72481d8 100644
--- a/arch/cris/arch-v10/kernel/entry.S
+++ b/arch/cris/arch-v10/kernel/entry.S
@@ -21,7 +21,6 @@
  */
 
 #include <linux/linkage.h>
-#include <linux/sys.h>
 #include <asm/unistd.h>
 #include <arch/sv_addr_ag.h>
 #include <asm/errno.h>
diff --git a/arch/cris/arch-v32/kernel/entry.S b/arch/cris/arch-v32/kernel/entry.S
index faa6441..979faa2 100644
--- a/arch/cris/arch-v32/kernel/entry.S
+++ b/arch/cris/arch-v32/kernel/entry.S
@@ -18,7 +18,6 @@
  */
 
 #include <linux/linkage.h>
-#include <linux/sys.h>
 #include <asm/unistd.h>
 #include <asm/errno.h>
 #include <asm/thread_info.h>
-- 
1.8.3.2

