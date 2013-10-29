From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 10:08:34 +0000
Subject: [PATCH 13/14] JANITOR: Remove #include <linux/sys.h> from NET
Message-Id: <20131029100833.GL14214@nbf-011.seri.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From 4f23652789773e113c866dd76f37d0b3f69f8d12 Mon Sep 17 00:00:00 2001
From: Mika Kukkonen <m.kukkonen@samsung.com>
Date: Tue, 29 Oct 2013 09:31:21 +0200
Subject: [PATCH 13/14] 13/14 JANITOR: Remove <linux/sys.h> from NET

	Remove #include from files:
		net/core/pktgen.c

Signed-off-by: Mika Kukkonen <m.kukkonen@samsung.com>
---
 net/core/pktgen.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index 261357a..5b6d849 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -118,7 +118,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/sys.h>
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-- 
1.8.3.2

