From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:57:31 +0000
Subject: [PATCH 1/14] JANITOR: Remove #include <linux/sys.h> from C6X
Message-Id: <20131029095731.GA14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 1aad77658c27017998c5f49b446c4cd47f3f8235 Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Mon, 28 Oct 2013 14:06:06 +0200
Subject: [PATCH 01/14] 01/14 JANITOR: Remove <linux/sys.h> from C6X

	Remove #include from:
		arch/c6x/kernel/entry.S

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/c6x/kernel/entry.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/c6x/kernel/entry.S b/arch/c6x/kernel/entry.S
index 2721c90..383a253 100644
--- a/arch/c6x/kernel/entry.S
+++ b/arch/c6x/kernel/entry.S
@@ -10,7 +10,6 @@
 ;  published by the Free Software Foundation.
 ;
 
-#include <linux/sys.h>
 #include <linux/linkage.h>
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
-- 
1.8.3.2

