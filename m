From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Jul 2018 07:42:49 +0000
Subject: [PATCH 4/6] Coccinelle: atomic_as_refcounter: Replace disjunction by a constraint in two SmPL rules
Message-Id: <fcd2762c-66bb-3571-e2b7-da20eda5d8ea@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
 <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
In-Reply-To: <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elena Reshetova <elena.reshetova@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Jul 2018 18:45:15 +0200

Three function names were specified for a search of function calls
by the means of a disjunction in two rules of a script for
the semantic patch language.
Use a regular expression as a constraint for this source code search
pattern instead so that duplication of SmPL code can be avoided.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../coccinelle/api/atomic_as_refcounter.cocci | 21 +++++--------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 57af2db9463e..372ae99591fd 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -80,17 +80,11 @@ coccilib.report.print_report(p1[0], msg % (p2[0].line))
 
 @r2 exists@
 expression a;
-identifier x;
+identifier F =~ "^atomic(?:64|_long)?_add_unless$", x;
 position p1;
 @@
 
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
@@ -99,17 +93,12 @@ msg = "atomic_add_unless"
 coccilib.report.print_report(p1[0], msg)
 
 @r3 exists@
-identifier x;
+expression E;
+identifier F =~ "^atomic(?:64|_long)?_add_return$";
 position p1;
 @@
 
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

