From: Nicolas Palix <npalix@diku.dk>
Date: Tue, 24 Aug 2010 15:39:12 +0000
Subject: [PATCH 18/18] Coccinelle: Add misc/ifcol.cocci
Message-Id: <1282664352-15882-19-git-send-email-npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282664352-15882-1-git-send-email-npalix@diku.dk>
In-Reply-To: <1282664352-15882-1-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix@diku.dk>, Michal Marek <mmarek@suse.cz>
Cc: cocci@diku.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Find confusingly indented code in or after an if.  An if branch should
be indented.  The code following an if should not be indented.
Sometimes, code after an if that is indented is actually intended to be
part of the if branch.

This has a high rate of false positives, because Coccinelle's column
calculation does not distinguish between spaces and tabs, so code that
is not visually aligned may be considered to be in the same column.

Signed-off-by: Nicolas Palix <npalix@diku.dk>
Signed-off-by: Julia Lawall <julia@diku.dk>
---
 scripts/coccinelle/misc/ifcol.cocci |   48 +++++++++++++++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 scripts/coccinelle/misc/ifcol.cocci

diff --git a/scripts/coccinelle/misc/ifcol.cocci b/scripts/coccinelle/misc/ifcol.cocci
new file mode 100644
index 0000000..b7ed91d
--- /dev/null
+++ b/scripts/coccinelle/misc/ifcol.cocci
@@ -0,0 +1,48 @@
+/// Find confusingly indented code in or after an if.  An if branch should
+/// be indented.  The code following an if should not be indented.
+/// Sometimes, code after an if that is indented is actually intended to be
+/// part of the if branch.
+///
+/// This has a high rate of false positives, because Coccinelle's column
+/// calculation does not distinguish between spaces and tabs, so code that
+/// is not visually aligned may be considered to be in the same column.
+///
+// Confidence: Low
+// Copyright: (C) 2010 Nicolas Palix, DIKU.  GPLv2.
+// Copyright: (C) 2010 Julia Lawall, DIKU.  GPLv2.
+// Copyright: (C) 2010 Gilles Muller, INRIA/LiP6.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options: -no_includes -include_headers
+
+virtual org
+virtual report
+
+@r disable braces4@
+position p1,p2;
+statement S1,S2;
+@@
+
+(
+if (...) { ... }
+|
+if (...) S1@p1 S2@p2
+)
+
+@script:python depends on org@
+p1 << r.p1;
+p2 << r.p2;
+@@
+
+if (p1[0].column = p2[0].column):
+  cocci.print_main("branch",p1)
+  cocci.print_secs("after",p2)
+
+@script:python depends on report@
+p1 << r.p1;
+p2 << r.p2;
+@@
+
+if (p1[0].column = p2[0].column):
+  msg = "code aligned with following code on line %s" % (p2[0].line)
+  coccilib.report.print_report(p1[0],msg)
-- 
1.7.0.4

