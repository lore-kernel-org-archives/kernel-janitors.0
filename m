From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 17:32:38 +0000
Subject: [PATCH v2 5/8] Coccinelle: atomic_as_refcounter: Replace disjunction by a constraint in two SmPL rul
Message-Id: <94b3299b-becf-1026-e855-2c4826cd33ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
 <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
 <5ca6ab58-e929-8468-74e2-012f987a0773@users.sourceforge.net>
In-Reply-To: <5ca6ab58-e929-8468-74e2-012f987a0773@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Elena Reshetova <elena.reshetova@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 18:12:10 +0200

Three function names were specified for a search of function calls
by the means of a disjunction in two rules of a script for
the semantic patch language.
Use a regular expression as a constraint for this source code search
pattern instead so that duplication of SmPL code can be avoided.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../coccinelle/api/atomic_as_refcounter.cocci | 23 ++++---------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 62b0132d65fc..4484bea6c9d8 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -47,17 +47,10 @@ coccilib.report.print_report(p1[0], msg % (p2[0].line))
 
 @r2 exists@
 expression a;
-identifier x;
+identifier F =~ "^atomic(?:64|_long)?_add_unless$", x;
 position p1;
 @@
-
-(
-atomic_add_unless(&(a)->x,-1,1)@p1
-|
-atomic_long_add_unless(&(a)->x,-1,1)@p1
-|
-atomic64_add_unless(&(a)->x,-1,1)@p1
-)
+ F(&(a)->x, -1, 1)@p1
 
 @script:python depends on report@
 p1 << r2.p1;
@@ -66,17 +59,11 @@ msg = "atomic_add_unless"
 coccilib.report.print_report(p1[0], msg)
 
 @r3 exists@
-identifier x;
+expression E;
+identifier F =~ "^atomic(?:64|_long)?_add_return$";
 position p1;
 @@
-
-(
-x = atomic_add_return@p1(-1, ...);
-|
-x = atomic_long_add_return@p1(-1, ...);
-|
-x = atomic64_add_return@p1(-1, ...);
-)
+ E = F@p1(-1, ...);
 
 @script:python depends on report@
 p1 << r3.p1;
-- 
2.18.0

