From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Jun 2017 13:53:56 +0000
Subject: [PATCH] scripts/coccinelle/api/gpiod_get_index.cocci: use gpiod_get variant when possible
Message-Id: <1497189236-4666-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Coccinelle script to use the shorter gpiod_get function when the third
argument to a gpiod_get_index function is 0.

This rule avoids modifying wrapper functions and cases where there is a
series of gpiod_get_index calls.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/api/gpiod_get_index.cocci |   92 +++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/scripts/coccinelle/api/gpiod_get_index.cocci b/scripts/coccinelle/api/gpiod_get_index.cocci
new file mode 100644
index 0000000..a670a29
--- /dev/null
+++ b/scripts/coccinelle/api/gpiod_get_index.cocci
@@ -0,0 +1,92 @@
+/// Use the shorter gpiod_get function when the third argument to a
+/// gpiod_get_index function is 0.
+//# The change might not be desired when there is a series of calls, for 0, 1,
+//# 2, etc.  This rule checks for another such call subsequently only.
+///
+// Confidence: Moderate
+// Copyright: (C) 2017 Julia Lawall, Inria. GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Options: --no-includes --include-headers
+// Keywords: gpiod_get_index
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@initialize:python@
+@@
+
+def not_wrapper(p):
+  return (p[0].current_element != "devm_gpiod_get_optional" and
+          p[0].current_element != "devm_gpiod_get" and
+          p[0].current_element != "gpiod_get_optional" and
+          p[0].current_element != "gpiod_get");
+
+@r depends on patch && !context && !org && !report@
+expression e1,e2,e3,e4,e5,e6,n != 0;
+position p : script:python() { not_wrapper(p) };
+@@
+
+(
+- devm_gpiod_get_index_optional@p
++ devm_gpiod_get_optional
+|
+- devm_gpiod_get_index@p
++ devm_gpiod_get
+|
+- gpiod_get_index_optional@p
++ gpiod_get_optional
+|
+- gpiod_get_index@p
++ gpiod_get
+)
+   (e1,e2,
+-   0,
+    e3)
+ ... when != devm_gpiod_get_index_optional(e4,e5,n,e6)
+     when != devm_gpiod_get_index(e4,e5,n,e6)
+     when != gpiod_get_index_optional(e4,e5,n,e6)
+     when != gpiod_get_index(e4,e5,n,e6)
+
+// ----------------------------------------------------------------------------
+
+@r_context depends on !patch && (context || org || report) forall@
+expression e1, e2, e3, e4, e5, e6, n != 0;
+position p: script:python () { not_wrapper(p) };
+@@
+
+(
+*  devm_gpiod_get_index_optional@p
+|
+*  devm_gpiod_get_index@p
+|
+*  gpiod_get_index_optional@p
+|
+*  gpiod_get_index@p
+)
+   (e1,e2,
+*    0,
+    e3)
+ ... when != devm_gpiod_get_index_optional(e4,e5,n,e6)
+     when != devm_gpiod_get_index(e4,e5,n,e6)
+     when != gpiod_get_index_optional(e4,e5,n,e6)
+     when != gpiod_get_index(e4,e5,n,e6)
+
+// ----------------------------------------------------------------------------
+
+@script:python r_org depends on org@
+p << r_context.p;
+@@
+
+msg = "Use non _index variant in 0 case."
+coccilib.org.print_todo(p[0], msg)
+
+// ----------------------------------------------------------------------------
+
+@script:python r_report depends on report@
+p << r_context.p;
+@@
+
+msg = "Use non _index variant in 0 case around line %s." % (p[0].line)
+coccilib.report.print_report(p[0], msg)

