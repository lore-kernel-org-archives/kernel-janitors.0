From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 27 Jan 2012 20:41:26 +0000
Subject: [PATCH] scripts/coccinelle: semantic patch for missing clk_put
Message-Id: <1327696888-8186-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, mmarek@suse.cz

From: Julia Lawall <Julia.Lawall@lip6.fr>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

diff --git a/scripts/coccinelle/free/clk_put.cocci b/scripts/coccinelle/free/clk_put.cocci
new file mode 100644
index 0000000..46747ad
--- /dev/null
+++ b/scripts/coccinelle/free/clk_put.cocci
@@ -0,0 +1,67 @@
+/// Find missing clk_puts.
+///
+//# This only signals a missing clk_put when there is a clk_put later
+//# in the same function.
+//# False positives can be due to loops.
+//
+// Confidence: Moderate
+// Copyright: (C) 2012 Julia Lawall, INRIA/LIP6.  GPLv2.
+// Copyright: (C) 2012 Gilles Muller, INRIA/LiP6.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options:
+
+virtual context
+virtual org
+virtual report
+
+@clk@
+expression e;
+statement S,S1;
+int ret;
+position p1,p2,p3;
+@@
+
+e = clk_get@p1(...)
+... when != clk_put(e)
+if (<+...e...+>) S
+... when any
+    when != clk_put(e)
+    when != if (...) { ... clk_put(e); ... }
+(
+ if (ret = 0) S1
+|
+if (...)
+   { ...
+     return 0; }
+|
+if (...)
+   { ...
+     return <+...e...+>; }
+|
+*if@p2 (...)
+   { ... when != clk_put(e)
+         when forall
+     return@p3 ...; }
+)
+... when any
+clk_put(e);
+
+@script:python depends on org@
+p1 << clk.p1;
+p2 << clk.p2;
+p3 << clk.p3;
+@@
+
+cocci.print_main("clk_get",p1)
+cocci.print_secs("if",p2)
+cocci.print_secs("needed clk_put",p3)
+
+@script:python depends on report@
+p1 << clk.p1;
+p2 << clk.p2;
+p3 << clk.p3;
+@@
+
+msg = "ERROR: missing clk_put; clk_get on line %s and execution via conditional on line %s" % (p1[0].line,p2[0].line)
+coccilib.report.print_report(p3[0],msg)
