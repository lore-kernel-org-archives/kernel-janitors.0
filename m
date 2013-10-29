From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:13:16 +0000
Subject: [PATCH 11/14] JANITOR: Remove #include <linux/sys.h> from UNICORE32
Message-Id: <20131029101316.GN14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131029100747.GK14214@nbf-011.seri.co.uk>
In-Reply-To: <20131029100747.GK14214@nbf-011.seri.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 7a42824165655ab39ba7ffe23c0f2dab3325170f Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:25:26 +0200
Subject: [PATCH 11/14] 11/14 JANITOR: Remove <linux/sys.h> from UNICORE32

	Remove #include from files:
		arch/unicore32/kernel/hibernate_asm.S

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/unicore32/kernel/hibernate_asm.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/unicore32/kernel/hibernate_asm.S b/arch/unicore32/kernel/hibernate_asm.S
index cc3c652..e111fab 100644
--- a/arch/unicore32/kernel/hibernate_asm.S
+++ b/arch/unicore32/kernel/hibernate_asm.S
@@ -11,7 +11,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/sys.h>
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <generated/asm-offsets.h>
-- 
1.8.3.2

