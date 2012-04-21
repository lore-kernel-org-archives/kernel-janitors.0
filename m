From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 21 Apr 2012 18:14:57 +0000
Subject: [PATCH] scripts/coccinelle: address test is always true
Message-Id: <1335032098-4966-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@diku.dk, mmarek@suse.cz, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/misc/noderef.cocci |   65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/scripts/coccinelle/misc/noderef.cocci b/scripts/coccinelle/misc/noderef.cocci
new file mode 100644
index 0000000..c170721
--- /dev/null
+++ b/scripts/coccinelle/misc/noderef.cocci
@@ -0,0 +1,65 @@
+/// sizeof when applied to a pointer typed expression gives the size of
+/// the pointer
+///
+// Confidence: High
+// Copyright: (C) 2012 Julia Lawall, INRIA/LIP6.  GPLv2.
+// Copyright: (C) 2012 Gilles Muller, INRIA/LiP6.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options: -no_includes -include_headers
+
+virtual org
+virtual report
+virtual context
+virtual patch
+
+@depends on patch@
+expression *x;
+expression f;
+type T;
+@@
+
+(
+x = <+... sizeof(
+- x
++ *x
+   ) ...+>
+|
+f(...,(T)(x),...,sizeof(
+- x
++ *x
+   ),...)
+|
+f(...,sizeof(x),...,(T)(
+- x
++ *x
+   ),...)
+)
+
+@r depends on !patch@
+expression *x;
+expression f;
+position p;
+type T;
+@@
+
+(
+*x = <+... sizeof@p(x) ...+>
+|
+*f(...,(T)(x),...,sizeof@p(x),...)
+|
+*f(...,sizeof@p(x),...,(T)(x),...)
+)
+
+@script:python depends on org@
+p << r.p;
+@@
+
+cocci.print_main("application of sizeof to pointer",p)
+
+@script:python depends on report@
+p << r.p;
+@@
+
+msg = "ERROR: application of sizeof to pointer"
+coccilib.report.print_report(p[0],msg)

