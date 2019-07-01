From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jul 2019 08:10:52 +0000
Subject: [PATCH v2] Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <2744a3fc-9e67-8113-1dd9-43669e06386a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
In-Reply-To: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jul 2019 10:00:39 +0200

The function “devm_ioremap_resource” contains appropriate error reporting.
Thus it can be questionable to present another error message
at other places.

Provide design options for the adjustment of affected source code
by the means of the semantic patch language (Coccinelle software).

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Suggestions from Julia Lawall were integrated.

* Application of the SmPL construct “<+... … ...+>”
* Replacement of a return specification by a statement metavariable.
* Different coding style for a branch of a SmPL disjunction.
* Usage of a specific function name in two messages.

 .../coccinelle/misc/redundant_dev_err.cocci   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 scripts/coccinelle/misc/redundant_dev_err.cocci

diff --git a/scripts/coccinelle/misc/redundant_dev_err.cocci b/scripts/coccinelle/misc/redundant_dev_err.cocci
new file mode 100644
index 000000000000..7998defb04f3
--- /dev/null
+++ b/scripts/coccinelle/misc/redundant_dev_err.cocci
@@ -0,0 +1,62 @@
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
+ <+...
+*   dev_err(...);
+ ...+>
+ }
+
+@deletion depends on patch@
+expression e;
+statement s;
+@@
+ e = devm_ioremap_resource(...);
+ if (IS_ERR(e))
+(
+-{
+-   dev_err(...);
+    s
+-}
+|
+ {
+ <+...
+-   dev_err(...);
+ ...+>
+ }
+)
+
+@or depends on org || report@
+expression e;
+position p;
+@@
+ e = devm_ioremap_resource(...);
+ if (IS_ERR(e))
+ {
+ <+... dev_err@p(...); ...+>
+ }
+
+@script:python to_do depends on org@
+p << or.p;
+@@
+coccilib.org.print_todo(p[0],
+                        "WARNING: An error message is probably not needed here because the devm_ioremap_resource() function contains appropriate error reporting.")
+
+@script:python reporting depends on report@
+p << or.p;
+@@
+coccilib.report.print_report(p[0],
+                             "WARNING: An error message is probably not needed here because the devm_ioremap_resource() function contains appropriate error reporting.")
--
2.22.0
