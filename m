From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 17:34:35 +0000
Subject: [PATCH v2 6/8] Coccinelle: atomic_as_refcounter: Use nested disjunctions in the first SmPL rule
Message-Id: <15372138-088d-81ce-3d3e-0b95f5d91ce9@users.sourceforge.net>
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
Date: Mon, 16 Jul 2018 18:22:53 +0200

Six function names were specified for a search of function calls
by the means of a disjunction in the rule of a script for
the semantic patch language.
Refactor them into two groups so that the SmPL code repetition
could be reduced a bit.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../coccinelle/api/atomic_as_refcounter.cocci  | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 4484bea6c9d8..7eae23dc9ea8 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -18,17 +18,15 @@ identifier fname2 =~ "(?:call_rcu|de(?:l|stroy)|(?:queue|schedule)_work)";
 @@
 
 (
- atomic_dec_and_test@p1(&(a)->x)
+(atomic_dec_and_test@p1
+|atomic_long_dec_and_test@p1
+|atomic64_dec_and_test@p1
+|local_dec_and_test@p1
+)                           (&(a)->x)
 |
- atomic_dec_and_lock@p1(&(a)->x, ...)
-|
- atomic_long_dec_and_lock@p1(&(a)->x, ...)
-|
- atomic_long_dec_and_test@p1(&(a)->x)
-|
- atomic64_dec_and_test@p1(&(a)->x)
-|
- local_dec_and_test@p1(&(a)->x)
+(atomic_dec_and_lock@p1
+|atomic_long_dec_and_lock@p1
+)                           (&(a)->x, ...)
 )
 ...
 (
-- 
2.18.0

