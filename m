From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 25 Aug 2012 20:42:45 +0000
Subject: [PATCH] scripts/coccinelle/tests/odd_ptr_err.cocci: semantic patch for IS_ERR/PTR_ERR inconsistency
Message-Id: <1345927365-26814-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/tests/odd_ptr_err.cocci |   65 ++++++++++++++++++++++++=
+++++
 1 file changed, 65 insertions(+)

diff --git a/scripts/coccinelle/tests/odd_ptr_err.cocci b/scripts/coccinell=
e/tests/odd_ptr_err.cocci
new file mode 100644
index 0000000..d114662
--- /dev/null
+++ b/scripts/coccinelle/tests/odd_ptr_err.cocci
@@ -0,0 +1,65 @@
+/// PTR_ERR should access the value just tested by IS_ERR
+//# There can be false positives in the patch case, where it is the call
+//# IS_ERR that is wrong.
+///
+// Confidence: High
+// Copyright: (C) 2012 Julia Lawall, INRIA.  GPLv2.
+// Copyright: (C) 2012 Gilles Muller, INRIA.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options: -no_includes -include_headers
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@depends on patch@
+expression e,e1;
+@@
+
+(
+if (IS_ERR(e)) { ... PTR_ERR(e) ... }
+|
+if (IS_ERR(e=E1)) { ... PTR_ERR(e) ... }
+|
+if (IS_ERR(e))
+ { ...
+  PTR_ERR(
+-   e1
++   e
+  )
+   ... }
+)
+
+@r depends on !patch@
+expression e,e1;
+position p1,p2;
+@@
+
+(
+if (IS_ERR(e)) { ... PTR_ERR(e) ... }
+|
+if (IS_ERR(e=E1)) { ... PTR_ERR(e) ... }
+|
+*if (IS_ERR@p1(e))
+ { ...
+*  PTR_ERR@p2(e1)
+   ... }
+)
+
+@script:python depends on org@
+p1 << r.p1;
+p2 << r.p2;
+@@
+
+cocci.print_main("inconsistent IS_ERR and PTR_ERR",p1)
+cocci.print_secs("PTR_ERR",p2)
+
+@script:python depends on report@
+p1 << r.p1;
+p2 << r.p2;
+@@
+
+msg =3D "inconsistent IS_ERR and PTR_ERR, PTR_ERR on line %s" % (p2[0].lin=
e)
+coccilib.report.print_report(p1[0],msg)

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
