From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 02 Feb 2012 14:53:08 +0000
Subject: [PATCH] scripts/coccinelle/misc/cstptr.cocci: semantic patch to check for PTR_ERR after reassignment
Message-Id: <1328194388-32495-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, mmarek@suse.cz

From: Julia Lawall <Julia.Lawall@lip6.fr>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/misc/cstptr.cocci |   41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/scripts/coccinelle/misc/cstptr.cocci b/scripts/coccinelle/misc/cstptr.cocci
new file mode 100644
index 0000000..d425644
--- /dev/null
+++ b/scripts/coccinelle/misc/cstptr.cocci
@@ -0,0 +1,41 @@
+/// PTR_ERR should be applied before its argument is reassigned, typically
+/// to NULL
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
+
+@r exists@
+expression e,e1;
+constant c;
+position p1,p2;
+@@
+
+*e@p1 = c
+... when != e = e1
+    when != &e
+    when != true IS_ERR(e)
+*PTR_ERR@p2(e)
+
+@script:python depends on org@
+p1 << r.p1;
+p2 << r.p2;
+@@
+
+cocci.print_main("PTR_ERR",p2)
+cocci.print_secs("assignment",p1)
+
+@script:python depends on report@
+p1 << r.p1;
+p2 << r.p2;
+@@
+
+msg = "ERROR: PTR_ERR applied after initialization to constant on line %s" % (p1[0].line)
+coccilib.report.print_report(p2[0],msg)

