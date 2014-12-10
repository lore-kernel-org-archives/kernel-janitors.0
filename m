From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 10 Dec 2014 20:08:43 +0000
Subject: [PATCH] scripts: coccinelle: add uses of memzero_explicit
Message-Id: <1418242123-8610-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Memzero_explicit is a version of memset that is resistent to compiler
optimizations when the set region is about to go out of scope.

This was suggested by Daniel Borkmann

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/api/memzero_explicit.cocci |  289 ++++++++++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/scripts/coccinelle/api/memzero_explicit.cocci b/scripts/coccinelle/api/memzero_explicit.cocci
new file mode 100644
index 0000000..bec0350
--- /dev/null
+++ b/scripts/coccinelle/api/memzero_explicit.cocci
@@ -0,0 +1,289 @@
+/// Replace memset on a variable that is about to go out of scope by
+/// memzero_explicit to prevent removal by compiler optimizations.
+///
+// Confidence: High
+// Copyright: (C) 2014 Julia Lawall, Inria, GPLv2
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@ar1 depends on patch && !context && !org && !report@
+identifier x;
+local idexpression e;
+type T,T1;
+@@
+
+{
+... when any
+T x[...];
+... when any
+    when exists
+(
+e = (T1)x
+|
+e = (T1)&x[0]
+)
+... when any
+    when exists
+- memset
++ memzero_explicit
+  (x,
+-0,
+  ...)
+... when != x
+    when != e
+    when strict
+}
+
+@str1 depends on patch && !context && !org && !report@
+identifier x;
+local idexpression e;
+type T,T1;
+@@
+
+{
+... when any
+T1 x;
+... when any
+    when exists
+e = (T)&x
+... when any
+    when exists
+- memset
++ memzero_explicit
+  (&x,
+-0,
+  ...)
+... when != x
+    when != e
+    when strict
+}
+
+// ------------------------------------------------------------------------
+
+@ar2 depends on patch && !context && !org && !report@
+identifier x;
+type T,T1;
+expression e;
+@@
+
+{
+... when any
+T x[...];
+... when any
+    when exists
+    when != e = (T1)x
+    when != e = (T1)&x[0]
+- memset
++ memzero_explicit
+  (x,
+-0,
+  ...)
+... when != x
+    when strict
+}
+
+@str2 depends on patch && !context && !org && !report@
+identifier x;
+expression e;
+type T,T1;
+@@
+
+{
+... when any
+T1 x;
+... when any
+    when exists
+    when != e = (T)&x
+- memset
++ memzero_explicit
+  (&x,
+-0,
+  ...)
+... when != x
+    when strict
+}
+
+// ----------------------------------------------------------------------------
+
+@ar1_context depends on !patch && (context || org || report)@
+type T, T1;
+identifier x;
+local idexpression e;
+position j0, j1, j2;
+@@
+
+{
+... when any
+T x@j1[...];
+... when any
+    when exists
+(
+e@j2 = (T1)x
+|
+e@j2 = (T1)&x[0]
+)
+... when any
+    when exists
+ memset@j0
+  (x,
+* 0,
+  ...)
+... when != x
+    when != e
+    when strict
+    when forall
+}
+
+@str1_context depends on !patch && (context || org || report)@
+type T, T1;
+identifier x;
+local idexpression e;
+position j0, j1, j2;
+@@
+
+{
+... when any
+T1 x@j1;
+... when any
+    when exists
+e@j2 = (T)&x
+... when any
+    when exists
+ memset@j0
+  (&x,
+* 0,
+  ...)
+... when != x
+    when != e
+    when strict
+    when forall
+}
+
+@ar2_context depends on !patch && (context || org || report)@
+type T, T1;
+identifier x;
+expression e;
+position j0, j1;
+@@
+
+{
+... when any
+T x@j1[...];
+... when any
+    when exists
+    when != e = (T1)x
+    when != e = (T1)&x[0]
+ memset@j0
+  (x,
+* 0,
+  ...)
+... when != x
+    when strict
+    when forall
+}
+
+@str2_context depends on !patch && (context || org || report)@
+type T, T1;
+identifier x;
+expression e;
+position j0, j1;
+@@
+
+{
+... when any
+T1 x@j1;
+... when any
+    when exists
+    when != e = (T)&x
+ memset@j0
+  (&x,
+* 0,
+  ...)
+... when != x
+    when strict
+    when forall
+}
+
+// ----------------------------------------------------------------------------
+
+@script:python ar1_org depends on org@
+j0 << ar1_context.j0;
+j1 << ar1_context.j1;
+j2 << ar1_context.j2;
+@@
+
+msg = "Memset call."
+coccilib.org.print_todo(j0[0], msg)
+coccilib.org.print_link(j1[0], "declaration")
+coccilib.org.print_link(j2[0], "alias")
+
+@script:python str1_org depends on org@
+j0 << str1_context.j0;
+j1 << str1_context.j1;
+j2 << str1_context.j2;
+@@
+
+msg = "Memset call."
+coccilib.org.print_todo(j0[0], msg)
+coccilib.org.print_link(j1[0], "declaration")
+coccilib.org.print_link(j2[0], "alias")
+
+@script:python ar2_org depends on org@
+j0 << ar2_context.j0;
+j1 << ar2_context.j1;
+@@
+
+msg = "Memset call."
+coccilib.org.print_todo(j0[0], msg)
+coccilib.org.print_link(j1[0], "declaration")
+
+@script:python str2_org depends on org@
+j0 << str2_context.j0;
+j1 << str2_context.j1;
+@@
+
+msg = "Memset call."
+coccilib.org.print_todo(j0[0], msg)
+coccilib.org.print_link(j1[0], "declaration")
+
+// ----------------------------------------------------------------------------
+
+@script:python ar1_report depends on report@
+j0 << ar1_context.j0;
+j1 << ar1_context.j1;
+j2 << ar1_context.j2;
+@@
+
+msg = "Memset call, declaration on line %s, alias on line %s." % \
+           (j1[0].line,j2[0].line)
+coccilib.report.print_report(j0[0], msg)
+
+@script:python str1_report depends on report@
+j0 << str1_context.j0;
+j1 << str1_context.j1;
+j2 << str1_context.j2;
+@@
+
+msg = "Memset call, declaration on line %s, alias on line %s." % \
+           (j1[0].line,j2[0].line)
+coccilib.report.print_report(j0[0], msg)
+
+@script:python ar2_report depends on report@
+j0 << ar2_context.j0;
+j1 << ar2_context.j1;
+@@
+
+msg = "Memset call, declaration on line %s." % (j1[0].line)
+coccilib.report.print_report(j0[0], msg)
+
+@script:python str2_report depends on report@
+j0 << str2_context.j0;
+j1 << str2_context.j1;
+@@
+
+msg = "Memset call declaration on line %s." % (j1[0].line)
+coccilib.report.print_report(j0[0], msg)
+

