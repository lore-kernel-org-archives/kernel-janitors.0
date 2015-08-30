From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Aug 2015 20:18:14 +0000
Subject: [PATCH] coccinelle: tests: improve odd_ptr_err.cocci
Message-Id: <1440965894-12356-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr

The original version only considered the case where the then branch
contains only one call to PTR_ERR.  Reimplement the whole thing to allow
multiple calls, with potentially different arguments.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/tests/odd_ptr_err.cocci |  120 ++++++++++++++++++++----=
-----
 1 file changed, 86 insertions(+), 34 deletions(-)

diff --git a/scripts/coccinelle/tests/odd_ptr_err.cocci b/scripts/coccinell=
e/tests/odd_ptr_err.cocci
index cfe0a35..dfc6b40 100644
--- a/scripts/coccinelle/tests/odd_ptr_err.cocci
+++ b/scripts/coccinelle/tests/odd_ptr_err.cocci
@@ -1,12 +1,11 @@
 /// PTR_ERR should access the value just tested by IS_ERR
-//# There can be false positives in the patch case, where it is the call
+//# There can be false positives in the patch case, where it is the call to
 //# IS_ERR that is wrong.
 ///
 // Confidence: High
-// Copyright: (C) 2012 Julia Lawall, INRIA.  GPLv2.
-// Copyright: (C) 2012 Gilles Muller, INRIA.  GPLv2.
+// Copyright: (C) 2012, 2015 Julia Lawall, INRIA.  GPLv2.
+// Copyright: (C) 2012, 2015 Gilles Muller, INRIA.  GPLv2.
 // URL: http://coccinelle.lip6.fr/
-// Comments:
 // Options: --no-includes --include-headers
=20
 virtual patch
@@ -14,52 +13,105 @@ virtual context
 virtual org
 virtual report
=20
-@depends on patch@
-expression e,e1;
+@ok1 exists@
+expression x,e;
+position p;
 @@
=20
+if (IS_ERR(x=3De) || ...) {
+  <...
+   PTR_ERR@p(x)
+  ...>
+}
+
+@ok2 exists@
+expression x,e1,e2;
+position p;
+@@
+
+if (IS_ERR(x) || ...) {
+  <...
 (
-if (IS_ERR(e)) { ... PTR_ERR(e) ... }
+   PTR_ERR@p(\(e1 ? e2 : x\|e1 ? x : e2\))
 |
-if (IS_ERR(e=E1)) { ... PTR_ERR(e) ... }
+   PTR_ERR@p(x)
+)
+  ...>
+}
+
+@r1 depends on patch && !context && !org && !report exists@
+expression x,y;
+position p !=3D {ok1.p,ok2.p};
+@@
+
+if (IS_ERR(x) || ...) {
+  ... when any
+      when !=3D IS_ERR(...)
+(
+  PTR_ERR(x)
 |
-if (IS_ERR(e))
- { ...
-  PTR_ERR(
--   e1
-+   e
+  PTR_ERR@p(
+-     y
++     x
   )
-   ... }
 )
+  ... when any
+}
+
+// -----------------------------------------------------------------------=
-----
=20
-@r depends on !patch@
-expression e,e1;
-position p1,p2;
+@r1_context depends on !patch && (context || org || report) exists@
+position p !=3D {ok1.p,ok2.p};
+expression x, y;
+position j0, j1;
 @@
=20
+if (IS_ERR@j0(x) || ...) {
+  ... when any
+      when !=3D IS_ERR(...)
 (
-if (IS_ERR(e)) { ... PTR_ERR(e) ... }
+  PTR_ERR(x)
 |
-if (IS_ERR(e=E1)) { ... PTR_ERR(e) ... }
-|
-*if (IS_ERR@p1(e))
- { ...
-*  PTR_ERR@p2(e1)
-   ... }
+  PTR_ERR@j1@p(
+     y
+  )
 )
+  ... when any
+}
=20
-@script:python depends on org@
-p1 << r.p1;
-p2 << r.p2;
+@r1_disj depends on !patch && (context || org || report) exists@
+position p !=3D {ok1.p,ok2.p};
+expression x, y;
+position r1_context.j0, r1_context.j1;
 @@
=20
-cocci.print_main("inconsistent IS_ERR and PTR_ERR",p1)
-cocci.print_secs("PTR_ERR",p2)
+* if (IS_ERR@j0(x) || ...) {
+  ... when any
+      when !=3D IS_ERR(...)
+*   PTR_ERR@j1@p(
+     y
+  )
+  ... when any
+}
=20
-@script:python depends on report@
-p1 << r.p1;
-p2 << r.p2;
+// -----------------------------------------------------------------------=
-----
+
+@script:python r1_org depends on org@
+j0 << r1_context.j0;
+j1 << r1_context.j1;
 @@
=20
-msg =3D "inconsistent IS_ERR and PTR_ERR, PTR_ERR on line %s" % (p2[0].lin=
e)
-coccilib.report.print_report(p1[0],msg)
+msg =3D "inconsistent IS_ERR and PTR_ERR"
+coccilib.org.print_todo(j0[0], msg)
+coccilib.org.print_link(j1[0], "")
+
+// -----------------------------------------------------------------------=
-----
+
+@script:python r1_report depends on report@
+j0 << r1_context.j0;
+j1 << r1_context.j1;
+@@
+
+msg =3D "inconsistent IS_ERR and PTR_ERR on line %s." % (j1[0].line)
+coccilib.report.print_report(j0[0], msg)
+

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
