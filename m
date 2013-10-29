From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:03:05 +0000
Subject: [PATCH 6/14] JANITOR: Remove #include <linux/sys.h> from MIPS
Message-Id: <20131029100304.GF14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 4c8a9c15d549cc24df5ff2323c13bb25d56a63fb Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:01:52 +0200
Subject: [PATCH 06/14] 06/14 JANITOR: Remove <linux/sys.h> from MIPS

	Remove #include from files:
		arch/mips/kernel/process.c

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 arch/mips/kernel/process.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index ddc7610..334cf69 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -20,7 +20,6 @@
 #include <linux/ptrace.h>
 #include <linux/mman.h>
 #include <linux/personality.h>
-#include <linux/sys.h>
 #include <linux/user.h>
 #include <linux/init.h>
 #include <linux/completion.h>
-- 
1.8.3.2

