From: Lionel Debroux <lionel_debroux@yahoo.fr>
Date: Sat, 26 Apr 2014 15:50:02 +0000
Subject: [PATCH] arm/mach-ux500: remove unused macro.
Message-Id: <123199.42585.bm@smtp144.mail.ir2.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Based on PaX.

---

From 9c443a7dfe581da8db5566d968a19c54f06a7fa3 Mon Sep 17 00:00:00 2001
From: Lionel Debroux <lionel_debroux@yahoo.fr>
Date: Sat, 26 Apr 2014 15:44:22 +0200
Subject: arm/mach-ux500: remove unused macro.

Extracted from the PaX patch.

Signed-off-by: Lionel Debroux <lionel_debroux@yahoo.fr>
Cc: PaX Team <pageexec@freemail.hu>
---
 arch/arm/mach-ux500/setup.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/mach-ux500/setup.h b/arch/arm/mach-ux500/setup.h
index 2dea8b5..6499da2 100644
--- a/arch/arm/mach-ux500/setup.h
+++ b/arch/arm/mach-ux500/setup.h
@@ -33,13 +33,6 @@ extern void ux500_timer_init(void);
 	.type		= MT_DEVICE,		\
 }
 
-#define __MEM_DEV_DESC(x, sz)	{		\
-	.virtual	= IO_ADDRESS(x),	\
-	.pfn		= __phys_to_pfn(x),	\
-	.length		= sz,			\
-	.type		= MT_MEMORY_RWX,		\
-}
-
 extern struct smp_operations ux500_smp_ops;
 extern void ux500_cpu_die(unsigned int cpu);
 
-- 
1.9.1.506.g7bf272c

