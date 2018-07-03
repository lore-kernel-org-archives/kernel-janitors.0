From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Jul 2018 07:48:33 +0000
Subject: [PATCH 6/6] Coccinelle: atomic_as_refcounter: Use format strings directly in SmPL rules
Message-Id: <3d4a4864-3b48-94a7-39c3-0f0e3018f9d5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
 <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
In-Reply-To: <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Elena Reshetova <elena.reshetova@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Jul 2018 19:46:45 +0200

Format strings were always assigned to the Python variable “msg”
before they were used in four rules of a script for the semantic
patch language.
Delete these extra variables so that the specified string objects
are directly used for the desired data output.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../coccinelle/api/atomic_as_refcounter.cocci    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 63cbe866c99f..1e2278ff3261 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -40,8 +40,9 @@ identifier fname2 =~ "(?:call_rcu|de(?:l|stroy)|(?:queue|schedule)_work)";
 p1 << r1.p1;
 p2 << r1.p2;
 @@
-msg = "atomic_dec_and_test variation before object free at line %s."
-coccilib.report.print_report(p1[0], msg % (p2[0].line))
+coccilib.report.print_report(p1[0],
+                             "atomic_dec_and_test variation before object free at line %s."
+                             % (p2[0].line))
 
 @r4 exists@
 expression a;
@@ -71,8 +72,9 @@ fname@p2(y, ...);
 p1 << r4.p1;
 p2 << r4.p2;
 @@
-msg = "atomic_dec_and_test variation before object free at line %s."
-coccilib.report.print_report(p1[0], msg % (p2[0].line))
+coccilib.report.print_report(p1[0],
+                             "atomic_dec_and_test variation before object free at line %s."
+                             % (p2[0].line))
 
 @r2 exists@
 expression a;
@@ -85,8 +87,7 @@ position p1;
 @script:python depends on report@
 p1 << r2.p1;
 @@
-msg = "atomic_add_unless"
-coccilib.report.print_report(p1[0], msg)
+coccilib.report.print_report(p1[0], "atomic_add_unless")
 
 @r3 exists@
 expression E;
@@ -99,5 +100,4 @@ position p1;
 @script:python depends on report@
 p1 << r3.p1;
 @@
-msg = "x = atomic_add_return(-1, ...)"
-coccilib.report.print_report(p1[0], msg)
+coccilib.report.print_report(p1[0], "x = atomic_add_return(-1, ...)")
-- 
2.18.0

