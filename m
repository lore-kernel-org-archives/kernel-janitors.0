From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Jul 2018 07:45:54 +0000
Subject: [PATCH 5/6] Coccinelle: atomic_as_refcounter: Use nested disjunctions in two SmPL rules
Message-Id: <6d70ae28-69c2-4d7a-2151-6df704694d0e@users.sourceforge.net>
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
Date: Mon, 2 Jul 2018 19:21:28 +0200

Six function names were specified for a search of function calls
by the means of a disjunction in two rules of a script for
the semantic patch language.
Refactor them into two groups so that the SmPL code repetition
could be reduced a bit.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../coccinelle/api/atomic_as_refcounter.cocci | 36 +++++++++----------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 372ae99591fd..63cbe866c99f 100644
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
@@ -53,17 +51,15 @@ identifier fname =~ "free";
 @@
 
 (
- atomic_dec_and_test@p1(&(a)->x)
-|
- atomic_dec_and_lock@p1(&(a)->x, ...)
-|
- atomic_long_dec_and_lock@p1(&(a)->x, ...)
-|
- atomic_long_dec_and_test@p1(&(a)->x)
-|
- atomic64_dec_and_test@p1(&(a)->x)
+(atomic_dec_and_test@p1
+|atomic_long_dec_and_test@p1
+|atomic64_dec_and_test@p1
+|local_dec_and_test@p1
+)                           (&(a)->x)
 |
- local_dec_and_test@p1(&(a)->x)
+(atomic_dec_and_lock@p1
+|atomic_long_dec_and_lock@p1
+)                           (&(a)->x, ...)
 )
 ...
 y=a
-- 
2.18.0

