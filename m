From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 08 Jul 2020 17:30:38 +0000
Subject: [PATCH] Coccinelle: Add a SmPL script for the reconsideration of function calls before return statem
Message-Id: <de887f9e-8db2-7839-5665-8d38e75aaddc@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4b3bb651-5db0-021c-cbea-347eda0e95e0@web.de>
In-Reply-To: <4b3bb651-5db0-021c-cbea-347eda0e95e0@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Jul 2020 19:09:59 +0200

It can happen that function implementations with the return type “void”
call a special function at the end of if branches.
Such calls are occasionally followed by an immediate return.
The same function can be called at the end of the function implementation.
Thus it can be helpful to replace previous function calls
by goto statements.

Provide design options for the adjustment of affected source code
by the means of the semantic patch language (Coccinelle software).

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../misc/goto_last_function_call.cocci        | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 scripts/coccinelle/misc/goto_last_function_call.cocci

diff --git a/scripts/coccinelle/misc/goto_last_function_call.cocci b/scripts/coccinelle/misc/goto_last_function_call.cocci
new file mode 100644
index 000000000000..92dcf3626c48
--- /dev/null
+++ b/scripts/coccinelle/misc/goto_last_function_call.cocci
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/// Reconsider function calls before a return statement in if branches.
+//
+// Keywords: duplicate function calls common exception handling
+// Confidence: Low
+// See also:
+// Clarification request “Adding labels without indentation before specific statements?”
+// https://lore.kernel.org/cocci/4b3bb651-5db0-021c-cbea-347eda0e95e0@web.de/
+
+virtual context, patch, report, org
+
+@display depends on context@
+expression action;
+expression list el;
+identifier work;
+@@
+ void work(...)
+ {
+ <+...
+ if (...)
+ {
+    ...
+*   action(el);
+*   return;
+ }
+ ...+>
+*action(el);
+ }
+
+@replacement depends on patch@
+expression action, condition;
+expression list el;
+identifier work;
+@@
+ void work(...)
+ {
+ <+...
+(
+-if (condition)
+-{
+-   action(el);
+-   return;
+-}
++if (condition)
++   goto last_action;
+|
+ if (...)
+ {
+    ...
+-   action(el);
+-   return;
++   goto last_action;
+ }
+)
+ ...+>
++last_action:
+ action(el);
+ }
+
+@or depends on org || report@
+expression action;
+expression list el;
+identifier work;
+position p;
+@@
+ void work(...)
+ {
+ <+...
+ if (...)
+ {
+    ...
+    action(el);
+    return;
+ }
+ ...+>
+ action@p(el);
+ }
+
+@script:python to_do depends on org@
+p << or.p;
+@@
+coccilib.org.print_todo(p[0],
+                        "WARNING: The same function was called at the end of an if branch before. Would you like to avoid duplicate function calls?")
+
+@script:python reporting depends on report@
+p << or.p;
+@@
+coccilib.report.print_report(p[0],
+                             "WARNING: The same function was called at the end of an if branch before. Would you like to avoid duplicate function calls?")
--
2.27.0
