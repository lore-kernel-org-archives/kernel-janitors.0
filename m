From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:05:28 +0000
Subject: [PATCH 8/14] JANITOR: Remove #include <linux/sys.h> from PARISC
Message-Id: <20131029100528.GH14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 0d85e66b451645f05a07868f717753c56cdc0cb0 Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:16:25 +0200
Subject: [PATCH 08/14] 08/14 JANITOR: Remove <linux/sys.h> from PARISC

	Remove #include from files:
		arch/parisc/hpux/entry_hpux.S

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/parisc/hpux/entry_hpux.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/parisc/hpux/entry_hpux.S b/arch/parisc/hpux/entry_hpux.S
index d15a413..57b2246 100644
--- a/arch/parisc/hpux/entry_hpux.S
+++ b/arch/parisc/hpux/entry_hpux.S
@@ -20,7 +20,6 @@
 
 #include <asm/unistd.h>
 #include <asm/assembly.h>
-#include <linux/sys.h>
 #include <linux/linkage.h>
 
 #define ENTRY_NAME(_name_) ASM_ULONG_INSN _name_
-- 
1.8.3.2

