From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 23 Jan 2013 22:06:30 +0000
Subject: [PATCH V2] scripts/coccinelle/misc/memcpy-assign.cocci: Replace memcpy with struct assignment
Message-Id: <1358978790-2990-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

There are error-prone memcpy() that can be replaced by struct
assignment that are type-safe and much easier to read. This semantic
patch looks for memcpy() that can be replaced by struct assignment.

Inspired by patches sent by Ezequiel Garcia <elezegarcia@gmail.com>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
Changes from V1:
 Updated commit message
 Changed Confidence comment to High on the semantic patch

 scripts/coccinelle/misc/memcpy-assign.cocci | 103 ++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 scripts/coccinelle/misc/memcpy-assign.cocci

diff --git a/scripts/coccinelle/misc/memcpy-assign.cocci b/scripts/coccinelle/misc/memcpy-assign.cocci
new file mode 100644
index 0000000..afd058b
--- /dev/null
+++ b/scripts/coccinelle/misc/memcpy-assign.cocci
@@ -0,0 +1,103 @@
+//
+// Replace memcpy with struct assignment.
+//
+// Confidence: High
+// Copyright: (C) 2012 Peter Senna Tschudin, INRIA/LIP6.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options: --no-includes --include-headers
+
+virtual patch
+virtual report
+virtual context
+virtual org
+
+@r1 depends on !patch@
+identifier struct_name;
+struct struct_name to;
+struct struct_name from;
+struct struct_name *top;
+struct struct_name *fromp;
+position p;
+@@
+memcpy@p(\(&(to)\|top\), \(&(from)\|fromp\), \(sizeof(to)\|sizeof(from)\|sizeof(struct struct_name)\|sizeof(*top)\|sizeof(*fromp)\))
+
+@script:python depends on report@
+p << r1.p;
+@@
+coccilib.report.print_report(p[0],"Replace memcpy with struct assignment")
+
+@depends on context@
+position r1.p;
+@@
+*memcpy@p(...);
+
+@script:python depends on org@
+p << r1.p;
+@@
+cocci.print_main("Replace memcpy with struct assignment",p)
+
+@depends on patch@
+identifier struct_name;
+struct struct_name to;
+struct struct_name from;
+@@
+(
+-memcpy(&(to), &(from), sizeof(to));
++to = from;
+|
+-memcpy(&(to), &(from), sizeof(from));
++to = from;
+|
+-memcpy(&(to), &(from), sizeof(struct struct_name));
++to = from;
+)
+
+@depends on patch@
+identifier struct_name;
+struct struct_name to;
+struct struct_name *from;
+@@
+(
+-memcpy(&(to), from, sizeof(to));
++to = *from;
+|
+-memcpy(&(to), from, sizeof(*from));
++to = *from;
+|
+-memcpy(&(to), from, sizeof(struct struct_name));
++to = *from;
+)
+
+@depends on patch@
+identifier struct_name;
+struct struct_name *to;
+struct struct_name from;
+@@
+(
+-memcpy(to, &(from), sizeof(*to));
++ *to = from;
+|
+-memcpy(to, &(from), sizeof(from));
++ *to = from;
+|
+-memcpy(to, &(from), sizeof(struct struct_name));
++ *to = from;
+)
+
+@depends on patch@
+identifier struct_name;
+struct struct_name *to;
+struct struct_name *from;
+@@
+(
+-memcpy(to, from, sizeof(*to));
++ *to = *from;
+|
+-memcpy(to, from, sizeof(*from));
++ *to = *from;
+|
+-memcpy(to, from, sizeof(struct struct_name));
++ *to = *from;
+)
+
-- 
1.7.11.7

