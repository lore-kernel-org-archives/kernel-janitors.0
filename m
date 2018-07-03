From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Jul 2018 07:37:39 +0000
Subject: [PATCH 2/6] Coccinelle: atomic_as_refcounter: Optimise a disjunction in the first SmPL rule
Message-Id: <a487edcd-8d53-be74-2034-3238fa7d4d68@users.sourceforge.net>
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
Date: Mon, 2 Jul 2018 17:14:01 +0200

The names “fname2” till “fname6” do not care for different function
parameters in the disjunction at the end of a rule in a script
for the semantic patch language.
Thus reduce this disjunction by using a regular expression with
an alternation for an optimised constraint.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/atomic_as_refcounter.cocci | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 94373a35744e..5571eea04c7b 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -13,12 +13,7 @@ virtual report
 identifier a, x;
 position p1, p2;
 identifier fname =~ "free";
-identifier fname2 =~ ".*destroy.*";
-identifier fname3 =~ ".*del.*";
-identifier fname4 =~ ".*queue_work.*";
-identifier fname5 =~ ".*schedule_work.*";
-identifier fname6 =~ ".*call_rcu.*";
-
+identifier fname2 =~ "(?:call_rcu|de(?:l|stroy)|(?:queue|schedule)_work)";
 @@
 
 (
@@ -39,14 +34,6 @@ identifier fname6 =~ ".*call_rcu.*";
  fname@p2(a, ...);
 |
  fname2@p2(...);
-|
- fname3@p2(...);
-|
- fname4@p2(...);
-|
- fname5@p2(...);
-|
- fname6@p2(...);
 )
 
 
-- 
2.18.0

