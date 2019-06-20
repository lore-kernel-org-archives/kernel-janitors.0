From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 20 Jun 2019 17:30:56 +0000
Subject: [PATCH] Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Jun 2019 19:12:53 +0200

The function “devm_ioremap_resource” contains appropriate error reporting.
Thus it can be questionable to present another error message
at other places.

Provide design options for the adjustment of affected source code
by the means of the semantic patch language (Coccinelle software).

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../coccinelle/misc/redundant_dev_err.cocci   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 scripts/coccinelle/misc/redundant_dev_err.cocci

diff --git a/scripts/coccinelle/misc/redundant_dev_err.cocci b/scripts/coccinelle/misc/redundant_dev_err.cocci
new file mode 100644
index 000000000000..aeb228280276
--- /dev/null
+++ b/scripts/coccinelle/misc/redundant_dev_err.cocci
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/// Reconsider a function call for redundant error reporting.
+//
+// Keywords: dev_err redundant device error messages
+// Confidence: Medium
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@display depends on context@
+expression e;
+@@
+ e = devm_ioremap_resource(...);
+ if (IS_ERR(e))
+ {
+*   dev_err(...);
+    return (...);
+ }
+
+@deletion depends on patch@
+expression e;
+@@
+ e = devm_ioremap_resource(...);
+ if (IS_ERR(e))
+-{
+-   dev_err(...);
+    return (...);
+-}
+
+@or depends on org || report@
+expression e;
+position p;
+@@
+ e = devm_ioremap_resource(...);
+ if (IS_ERR(e))
+ {
+    dev_err@p(...);
+    return (...);
+ }
+
+@script:python to_do depends on org@
+p << or.p;
+@@
+coccilib.org.print_todo(p[0],
+                        "WARNING: An error message is probably not needed here because the previously called function contains appropriate error reporting.")
+
+@script:python reporting depends on report@
+p << or.p;
+@@
+coccilib.report.print_report(p[0],
+                             "WARNING: An error message is probably not needed here because the previously called function contains appropriate error reporting.")
--
2.22.0
