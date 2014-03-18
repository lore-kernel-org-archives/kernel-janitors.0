From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 18 Mar 2014 21:11:32 +0000
Subject: [PATCH] Coccicheck: Remove memcpy to struct assignment test
Message-Id: <1395177092-3023-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

The Coccinelle script scripts/coccinelle/misc/memcpy-assign.cocci look
for opportunities to replace a call to memcpy by a struct assignment.
This patch removes memcpy-assign.cocci as it is not clear that this
convention has an impact on the generated code.

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 scripts/coccinelle/misc/memcpy-assign.cocci | 103 ----------------------------
 1 file changed, 103 deletions(-)
 delete mode 100644 scripts/coccinelle/misc/memcpy-assign.cocci

diff --git a/scripts/coccinelle/misc/memcpy-assign.cocci b/scripts/coccinelle/misc/memcpy-assign.cocci
deleted file mode 100644
index afd058b..0000000
--- a/scripts/coccinelle/misc/memcpy-assign.cocci
+++ /dev/null
@@ -1,103 +0,0 @@
-//
-// Replace memcpy with struct assignment.
-//
-// Confidence: High
-// Copyright: (C) 2012 Peter Senna Tschudin, INRIA/LIP6.  GPLv2.
-// URL: http://coccinelle.lip6.fr/
-// Comments:
-// Options: --no-includes --include-headers
-
-virtual patch
-virtual report
-virtual context
-virtual org
-
-@r1 depends on !patch@
-identifier struct_name;
-struct struct_name to;
-struct struct_name from;
-struct struct_name *top;
-struct struct_name *fromp;
-position p;
-@@
-memcpy@p(\(&(to)\|top\), \(&(from)\|fromp\), \(sizeof(to)\|sizeof(from)\|sizeof(struct struct_name)\|sizeof(*top)\|sizeof(*fromp)\))
-
-@script:python depends on report@
-p << r1.p;
-@@
-coccilib.report.print_report(p[0],"Replace memcpy with struct assignment")
-
-@depends on context@
-position r1.p;
-@@
-*memcpy@p(...);
-
-@script:python depends on org@
-p << r1.p;
-@@
-cocci.print_main("Replace memcpy with struct assignment",p)
-
-@depends on patch@
-identifier struct_name;
-struct struct_name to;
-struct struct_name from;
-@@
-(
--memcpy(&(to), &(from), sizeof(to));
-+to = from;
-|
--memcpy(&(to), &(from), sizeof(from));
-+to = from;
-|
--memcpy(&(to), &(from), sizeof(struct struct_name));
-+to = from;
-)
-
-@depends on patch@
-identifier struct_name;
-struct struct_name to;
-struct struct_name *from;
-@@
-(
--memcpy(&(to), from, sizeof(to));
-+to = *from;
-|
--memcpy(&(to), from, sizeof(*from));
-+to = *from;
-|
--memcpy(&(to), from, sizeof(struct struct_name));
-+to = *from;
-)
-
-@depends on patch@
-identifier struct_name;
-struct struct_name *to;
-struct struct_name from;
-@@
-(
--memcpy(to, &(from), sizeof(*to));
-+ *to = from;
-|
--memcpy(to, &(from), sizeof(from));
-+ *to = from;
-|
--memcpy(to, &(from), sizeof(struct struct_name));
-+ *to = from;
-)
-
-@depends on patch@
-identifier struct_name;
-struct struct_name *to;
-struct struct_name *from;
-@@
-(
--memcpy(to, from, sizeof(*to));
-+ *to = *from;
-|
--memcpy(to, from, sizeof(*from));
-+ *to = *from;
-|
--memcpy(to, from, sizeof(struct struct_name));
-+ *to = *from;
-)
-
-- 
1.8.3.1

