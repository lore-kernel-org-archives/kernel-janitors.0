From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 17:24:35 +0000
Subject: [PATCH v2 1/8] Coccinelle: atomic_as_refcounter: Delete an unnecessary SmPL rule
Message-Id: <ba3ffd66-7c04-cf3a-6c70-af7ba704b1b5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
 <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
 <5ca6ab58-e929-8468-74e2-012f987a0773@users.sourceforge.net>
In-Reply-To: <5ca6ab58-e929-8468-74e2-012f987a0773@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Elena Reshetova <elena.reshetova@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 17:15:26 +0200

A search was specified in the rule “r4” for function calls which should be
found by the rule “r1” already in a script for the semantic patch language.
It is useless to repeat a source code search there just to determine
that a variable assignment was performed also for an input parameter
of such a function call (while the same message will be displayed so far).
Thus delete an inappropriate search specification.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../coccinelle/api/atomic_as_refcounter.cocci | 33 -------------------
 1 file changed, 33 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 988120e0fd67..61fcaf5e45a3 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -57,39 +57,6 @@ p2 << r1.p2;
 msg = "atomic_dec_and_test variation before object free at line %s."
 coccilib.report.print_report(p1[0], msg % (p2[0].line))
 
-@r4 exists@
-identifier a, x, y;
-position p1, p2;
-identifier fname =~ ".*free.*";
-
-@@
-
-(
- atomic_dec_and_test@p1(&(a)->x)
-|
- atomic_dec_and_lock@p1(&(a)->x, ...)
-|
- atomic_long_dec_and_lock@p1(&(a)->x, ...)
-|
- atomic_long_dec_and_test@p1(&(a)->x)
-|
- atomic64_dec_and_test@p1(&(a)->x)
-|
- local_dec_and_test@p1(&(a)->x)
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
-msg = "atomic_dec_and_test variation before object free at line %s."
-coccilib.report.print_report(p1[0], msg % (p2[0].line))
-
 @r2 exists@
 identifier a, x;
 position p1;
-- 
2.18.0

