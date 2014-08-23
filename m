From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Aug 2014 05:34:45 +0000
Subject: =?y?q?=5BPATCH=20v2=5D=20coccinelle=3A=20misc=3A=20semantic=20patch=20to=20delete=20overly=20complex
Message-Id: <1408772085-28818-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr

From: Julia Lawall <Julia.Lawall@lip6.fr>

This semantic patch simplifies cases where the effect of the processing of
a function call's return code is just to return the result of the function
directly.  It may also delete a local return flag variable, if this is no
longer used.

This was proposed by Uwe Kleine-K=C3=B6nig.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: wrong email address

 scripts/coccinelle/misc/simple_return.cocci |  180 +++++++++++++++++++++++=
+++++
 1 file changed, 180 insertions(+)

diff --git a/scripts/coccinelle/misc/simple_return.cocci b/scripts/coccinel=
le/misc/simple_return.cocci
new file mode 100644
index 0000000..47f7084
--- /dev/null
+++ b/scripts/coccinelle/misc/simple_return.cocci
@@ -0,0 +1,180 @@
+/// Simplify a trivial if-return sequence.  Possibly combine with a
+/// preceding function call.
+//
+// Confidence: High
+// Copyright: (C) 2014 Julia Lawall, INRIA/LIP6.  GPLv2.
+// Copyright: (C) 2014 Gilles Muller, INRIA/LiP6.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options: --no-includes --include-headers
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@r depends on patch@
+local idexpression e;
+identifier i,f,fn;
+@@
+
+fn(...) { <...
+- e@i ++ return
+    f(...);
+-if (i !=3D 0) return i;
+-return 0;
+...> }
+
+@depends on patch@
+identifier r.i;
+type t;
+@@
+
+-t i;
+ ... when !=3D i
+
+@depends on patch@
+expression e;
+@@
+
+-if (e !=3D 0)
+   return e;
+-return 0;
+
+// -----------------------------------------------------------------------
+
+@s1 depends on context || org || report@
+local idexpression e;
+identifier i,f,fn;
+position p,p1,p2;
+@@
+
+fn(...) { <...
+* e@i@p =3D f(...);
+  if (\(i@p1 !=3D 0\|i@p2 < 0\))
+     return i;
+  return 0;
+...> }
+
+@s2 depends on context || org || report forall@
+identifier s1.i;
+type t;
+position q,s1.p;
+expression e,f;
+@@
+
+* t i@q;
+  ... when !=3D i
+  e@p =3D f(...);
+
+@s3 depends on context || org || report@
+expression e;
+position p1!=3Ds1.p1;
+position p2!=3Ds1.p2;
+@@
+
+*if (\(e@p1 !=3D 0\|e@p2 < 0\))
+   return e;
+ return 0;
+
+// -----------------------------------------------------------------------
+
+@script:python depends on org@
+p << s1.p;
+p1 << s1.p1;
+q << s2.q;
+@@
+
+cocci.print_main("decl",q)
+cocci.print_secs("use",p)
+cocci.include_match(False)
+
+@script:python depends on org@
+p << s1.p;
+p2 << s1.p2;
+q << s2.q;
+@@
+
+cocci.print_main("decl",q)
+cocci.print_secs("use with questionable test",p)
+cocci.include_match(False)
+
+@script:python depends on org@
+p << s1.p;
+p1 << s1.p1;
+@@
+
+cocci.print_main("use",p)
+
+@script:python depends on org@
+p << s1.p;
+p2 << s1.p2;
+@@
+
+cocci.print_main("use with questionable test",p)
+
+@script:python depends on org@
+p << s3.p1;
+@@
+
+cocci.print_main("test",p)
+
+@script:python depends on org@
+p << s3.p2;
+@@
+
+cocci.print_main("questionable test",p)
+
+// -----------------------------------------------------------------------
+
+@script:python depends on report@
+p << s1.p;
+p1 << s1.p1;
+q << s2.q;
+@@
+
+msg =3D "WARNING: end returns can be simpified and declaration on line %s =
can be dropped" % (q[0].line)
+coccilib.report.print_report(p[0],msg)
+cocci.include_match(False)
+
+@script:python depends on report@
+p << s1.p;
+p1 << s1.p1;
+q << s2.q
+;
+@@
+
+msg =3D "WARNING: end returns may be simpified if negative or 0 value and =
declaration on line %s can be dropped" % (q[0].line)
+coccilib.report.print_report(p[0],msg)
+cocci.include_match(False)
+
+@script:python depends on report@
+p << s1.p;
+p1 << s1.p1;
+@@
+
+msg =3D "WARNING: end returns can be simpified"
+coccilib.report.print_report(p[0],msg)
+
+@script:python depends on report@
+p << s1.p;
+p2 << s1.p2;
+@@
+
+msg =3D "WARNING: end returns can be simpified if negative or 0 value"
+coccilib.report.print_report(p[0],msg)
+
+@script:python depends on report@
+p << s3.p1;
+@@
+
+msg =3D "WARNING: end returns can be simpified"
+coccilib.report.print_report(p[0],msg)
+
+@script:python depends on report@
+p << s3.p2;
+@@
+
+msg =3D "WARNING: end returns can be simpified if tested value is negative=
 or 0"
+coccilib.report.print_report(p[0],msg)

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
