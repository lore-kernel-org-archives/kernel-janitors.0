From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 01 Aug 2018 12:30:18 +0000
Subject: [PATCH] Coccinelle: atomic_as_refcounter: Merge two SmPL rules
Message-Id: <9d9a0d3c-e4fd-d950-518a-b567fe18ff21@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
 <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
 <3d4a4864-3b48-94a7-39c3-0f0e3018f9d5@users.sourceforge.net>
In-Reply-To: <3d4a4864-3b48-94a7-39c3-0f0e3018f9d5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Elena Reshetova <elena.reshetova@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Aug 2018 14:16:01 +0200

Two rules of a script for the semantic patch language displayed
the same message.
Thus reduce duplicate SmPL code so that the desired data processing
is achieved by another nested SmPL disjunction in a single SmPL rule.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../coccinelle/api/atomic_as_refcounter.cocci | 50 ++++---------------
 1 file changed, 10 insertions(+), 40 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 1e2278ff3261..292a029d5a51 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -11,12 +11,11 @@ virtual report
 
 @r1 exists@
 expression a;
-identifier x;
 position p1, p2;
-identifier fname =~ "free";
-identifier fname2 =~ "(?:call_rcu|de(?:l|stroy)|(?:queue|schedule)_work)";
+identifier x, y,
+           fname =~ "free",
+           fname2 =~ "(?:call_rcu|de(?:l|stroy)|(?:queue|schedule)_work)";
 @@
-
 (
 (atomic_dec_and_test@p1
 |atomic_long_dec_and_test@p1
@@ -28,14 +27,17 @@ identifier fname2 =~ "(?:call_rcu|de(?:l|stroy)|(?:queue|schedule)_work)";
 |atomic_long_dec_and_lock@p1
 )                           (&(a)->x, ...)
 )
-...
+ ...
 (
- fname@p2(a, ...);
+(fname@p2(a, ...)
+|fname2@p2(...)
+);
 |
- fname2@p2(...);
+ y = a
+ ...
+ fname@p2(y, ...);
 )
 
-
 @script:python depends on report@
 p1 << r1.p1;
 p2 << r1.p2;
@@ -44,38 +46,6 @@ coccilib.report.print_report(p1[0],
                              "atomic_dec_and_test variation before object free at line %s."
                              % (p2[0].line))
 
-@r4 exists@
-expression a;
-identifier x, y;
-position p1, p2;
-identifier fname =~ "free";
-@@
-
-(
-(atomic_dec_and_test@p1
-|atomic_long_dec_and_test@p1
-|atomic64_dec_and_test@p1
-|local_dec_and_test@p1
-)                           (&(a)->x)
-|
-(atomic_dec_and_lock@p1
-|atomic_long_dec_and_lock@p1
-)                           (&(a)->x, ...)
-)
-...
-y=a
-...
-fname@p2(y, ...);
-
-
-@script:python depends on report@
-p1 << r4.p1;
-p2 << r4.p2;
-@@
-coccilib.report.print_report(p1[0],
-                             "atomic_dec_and_test variation before object free at line %s."
-                             % (p2[0].line))
-
 @r2 exists@
 expression a;
 identifier F =~ "^atomic(?:64|_long)?_add_unless$", x;
-- 
2.18.0

