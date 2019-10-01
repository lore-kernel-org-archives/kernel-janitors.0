From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 01 Oct 2019 14:30:53 +0000
Subject: [PATCH v2] Coccinelle: Add a SmPL script for the reconsideration of specific combinations of assignm
Message-Id: <c45c4435-581b-d137-255c-c21db7ccef78@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e07ce253-8a13-0f90-3ee0-79c1a0e78b38@web.de>
 <alpine.DEB.2.21.1909231058380.2283@hadrien>
 <4977fb04-cc29-3861-0aaf-cd93a0b0b1c7@web.de>
In-Reply-To: <4977fb04-cc29-3861-0aaf-cd93a0b0b1c7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Allison Randal <allison@lohutok.net>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 1 Oct 2019 15:50:10 +0200

Values from expressions were occasionally assigned to local variables
before they will be returned by the subsequent statement.
Such expressions can be directly specified in the return statement instead.

Adjust affected source code by the means of the semantic patch language
(Coccinelle software).

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
* Application of the SmPL construct “<+... … ...+>”
* Addition of a hint for the supported coccicheck operation modes


 .../coccinelle/misc/move_code_to_return.cocci | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 scripts/coccinelle/misc/move_code_to_return.cocci

diff --git a/scripts/coccinelle/misc/move_code_to_return.cocci b/scripts/coccinelle/misc/move_code_to_return.cocci
new file mode 100644
index 000000000000..22ce7c9d0fd2
--- /dev/null
+++ b/scripts/coccinelle/misc/move_code_to_return.cocci
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/// Return expressions directly instead of assigning them to
+/// local variables immediately before affected statements.
+//
+// Keywords: return statements variable assignments coding style
+// Confidence: Medium
+
+virtual patch
+virtual report
+
+@replacement1 depends on patch@
+expression x;
+identifier f, rc;
+local idexpression lrc;
+type rt;
+@@
+ rt f(...)
+ {
+ <+...
+ if (...)
+-{
+-lrc@rc = x;
+ return
+-       rc
++       x
+ ;
+-}
+ ...+>
+ }
+
+@replacement2 depends on patch@
+expression x;
+identifier f, rc;
+local idexpression lrc;
+type rt;
+@@
+ rt f(...)
+ {
+ <+...
+-lrc@rc = x;
+ return
+-       rc
++       x
+ ;
+ ...+>
+ }
+
+@deletion2 depends on patch@
+identifier replacement2.f, replacement2.rc;
+type replacement2.rt, t;
+@@
+ rt f(...)
+ {
+ ... when any
+-t rc;
+ ... when != rc
+ }
+
+@deletion1 depends on patch@
+identifier replacement1.f, replacement1.rc;
+type replacement1.rt, t;
+@@
+ rt f(...)
+ {
+ ... when any
+-t rc;
+ ... when != rc
+ }
+
+@script:python info depends on report@
+@@
+import sys
+sys.stderr.write("INFO: Unfortunately, specific software limitations have got the consequence that only the operation mode “patch” can be supported by this SmPL script so far as expected.\n")
--
2.23.0
